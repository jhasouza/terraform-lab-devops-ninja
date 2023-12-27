locals {
  ip_filepath = "ips.json"

  #Tags Comuns
  common_tags = merge(var.tags, {
    Random      = "${random_pet.bucket.id}"
    Environment = var.environment
    Region      = var.aws_region
  })
}