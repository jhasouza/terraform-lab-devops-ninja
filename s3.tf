/*
resource "aws_s3_bucket" "jorgesouzaeti-terraform" {
  bucket = "${random_pet.bucket.id}-${var.environment}-${var.aws_region}"
  #deprecated
  #acl = "private"

  tags = local.common_tags

  #{
  #Name        = "jorgesouzaeti-terraform"
  #UpdateAt    = "2023-12-14"
  #Change      = "Aula11"
  #}
}

resource "aws_s3_object" "this" {
  bucket = aws_s3_bucket.jorgesouzaeti-terraform.bucket
  key    = "config/${local.ip_filepath}"
  source = local.ip_filepath
  etag   = filemd5(local.ip_filepath)

  tags = local.common_tags
}

resource "aws_s3_object" "random" {
  bucket = aws_s3_bucket.jorgesouzaeti-terraform.bucket
  key    = "config/${random_pet.bucket.id}.json"
  source = local.ip_filepath
  etag   = filemd5(local.ip_filepath)

  tags = local.common_tags
}

#BUCKET CRIADO NA MÃO NA CONTA E IMPORTADO
resource "aws_s3_bucket" "manual" {
  # (resource arguments)
  bucket = "jorgesouzaeti-account"

  tags = {
    name      = "jorgesouzaeti-account"
    criado    = "12/12/2023"
    importado = "20/12/2023"
    managedby = "terraform"
  }
}
*/

data "aws_caller_identity" "current" {}

resource "aws_s3_bucket" "tfstate" {
  bucket = "tfstate-${data.aws_caller_identity.current.account_id}"

tags = merge(var.tags,{
  name = "tfstate-${data.aws_caller_identity.current.account_id}"
  create = "20/12/2023" 
})
}

resource "aws_s3_bucket_versioning" "tfstate" {
  bucket = aws_s3_bucket.tfstate.id
  versioning_configuration {
    status = "Enabled"
  }
}
