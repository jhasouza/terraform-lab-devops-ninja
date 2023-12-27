#PROVIDER
variable "aws_region" {
  type        = string
  description = "Região da AWS"
  #default     = "us-east-1"
}
variable "aws_profile" {
  type        = string
  description = "Profile Terraform para AWS"
  #default     = "your_profile"
}

#EC2
variable "instance_ami" {
  type        = string
  description = "AMI Ubuntu 20.04 LTS"
  #default     = "ami-06aa3f7caf3a30282"
}
variable "instance_type" {
  type        = string
  description = "Tipo da instancia EC2"
  #default     = "t2.micro"
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
  }
}

##########
#Env
variable "environment" {
  type        = string
  description = "Qual o ambiente de deploy"
  default     = "dev"
}
