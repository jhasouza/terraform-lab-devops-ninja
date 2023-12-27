/*
resource "aws_instance" "ubuntu-tf" {
  ami           = var.instance_ami
  instance_type = var.instance_type

  tags = merge(var.tags, {
    Name   = "ec2-terraform"
    Create = "2023-12-19"
  })

  #TAGS por variaveis
  #tags = var.tags
  #{
  #Name = "ec2"
  #Create = "2023-12-14"
  #}
}
*/