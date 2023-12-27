#PROVIDER
variable "aws_region" {
  type        = string
  description = "Região da AWS"
  default     = "us-east-1"
}
variable "aws_profile" {
  type        = string
  description = "Profile Terraform para AWS"
  default     = "terraform-jseti"
}

#EC2
variable "instance_ami" {
  type        = string
  description = "AMI Ubuntu 20.04 LTS"
  default     = "ami-06aa3f7caf3a30282"
}
variable "instance_type-server" {
  type        = string
  description = "Tipo da instancia EC2"
  default     = "t3.medium"
}

variable "instance_type-nodes" {
  type        = string
  description = "Tipo da instancia EC2"
  default     = "t3.micro"
}

variable "subnet_id" {
  type        = string
  description = "Subnet a ser utilizada"
  default     = "subnet-0fe7adab9afd49d5f"
}

variable "key_pair" {
  type        = string
  description = "Chave Key Pair da instância"
  default     = "devops-ninja"
}

variable "instance_sg" {
  type        = string
  description = "Security Group EC2"
  default     = "sg-036c16525a1052827"
}

variable "instance_volume" {
  type        = number
  description = "Tamanho do volume EBS para instância EC2"
  default     = 20
}

variable "instance_volume_type" {
  type        = string
  description = "Tipo do volume EBS para instância EC2"
  default     = "standard"
}

######################################################
#TAGS
variable "tags" {
  type        = map(string)
  description = "Tags defaults"
  default = {
    Environment = "Test"
    Owner       = "Jorge Souza"
    ManagedBy   = "Terraform"
    Project     = "DevOps Ninja"
    Feature     = "Rancher"
  }
}

/*
##########
#Env
variable "environment" {
  type        = string
  description = "Qual o ambiente de deploy"
  default     = "dev"
}
*/