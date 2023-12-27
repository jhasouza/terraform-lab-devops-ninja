output "bucket_name" {
  value = aws_s3_bucket.jorgesouzaeti-terraform.bucket
}

output "bucket_arn" {
  value       = aws_s3_bucket.jorgesouzaeti-terraform.arn
  description = "retorno o ARN do bucket"
}

output "bucket_domain_name" {
  value = aws_s3_bucket.jorgesouzaeti-terraform.bucket_domain_name
}

output "ips_file_path" {
  value = "${aws_s3_bucket.jorgesouzaeti-terraform.bucket}/${aws_s3_object.this.key}"
}

output "remote_state_bucket" {
  value = aws_s3_bucket.tfstate.bucket
}