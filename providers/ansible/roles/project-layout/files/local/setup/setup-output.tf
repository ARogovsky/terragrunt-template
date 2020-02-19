output "bucket" {
  value = aws_s3_bucket.s3-setup.id
}

output "key" {
  value = module.setup_key.key_arn
}
