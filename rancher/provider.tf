#Bloco Terraform - Serve para configurar os parâmetros do terraform a ser utilizado
terraform {
  required_version = "1.6.5"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.6.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile

  #NUNCA USAR - Forma insegura. Use variáveis de ambiente, ou, via configuração do AWS CLI
  #access_key = ""
  #secret_key = ""
}
