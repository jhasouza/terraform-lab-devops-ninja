#RANCHER SERVER
resource "aws_instance" "rancher-server" {
  ami                         = var.instance_ami
  instance_type               = var.instance_type-server
  subnet_id                   = var.subnet_id
  key_name                    = var.key_pair
  vpc_security_group_ids      = [var.instance_sg]
  associate_public_ip_address = true

  tags = merge(var.tags, {
    Name = "rancher-SERVER"
  })

  #TAGS por variaveis
  #tags = var.tags
  #{
  #Name = "ec2"
  #Create = "2023-12-14"
  #}

  root_block_device {
    volume_size = var.instance_volume
    volume_type = var.instance_volume_type
  }

  #Docker que funcionou = sudo curl https://releases.rancher.com/install-docker/20.10.sh | sh
  user_data = <<-EOF
              #!/bin/bash
              sudo apt-get update
              sudo curl https://releases.rancher.com/install-docker/20.10.sh | sh
              sudo usermod -aG docker ubuntu
              sudo systemctl enable docker
              sudo systemctl start docker
              sudo docker run -d --restart=unless-stopped -p 8080:8080 rancher/server:stable
              EOF
}

#RANCHER NODES
resource "aws_instance" "rancher-nodes" {
  count                       = 3
  ami                         = var.instance_ami
  instance_type               = var.instance_type-nodes
  subnet_id                   = var.subnet_id
  key_name                    = var.key_pair
  vpc_security_group_ids      = [var.instance_sg]
  associate_public_ip_address = true

  tags = merge(var.tags, {
    Name = "rancher-k8s-${count.index + 1}"
  })

  #TAGS por variaveis
  #tags = var.tags
  #{
  #Name = "ec2"
  #Create = "2023-12-14"
  #}

  root_block_device {
    volume_size = var.instance_volume
    volume_type = var.instance_volume_type
  }

  user_data = <<-EOF
              #!/bin/bash
              sudo apt-get update
              sudo curl https://releases.rancher.com/install-docker/20.10.sh | sh
              sudo usermod -aG docker ubuntu
              sudo systemctl enable docker
              sudo systemctl start docker
              EOF
}
