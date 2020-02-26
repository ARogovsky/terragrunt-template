resource "aws_s3_bucket" "s3-setup" {
  bucket = var.aws_setup_bucket

  acl    = "private"

  versioning {
    enabled = true
  }

  force_destroy = true

  tags = {
    Project     = var.project_name
    Env         = var.project_env
  }

}

resource "aws_s3_bucket_policy" "s3-policy" {
  bucket = aws_s3_bucket.s3-setup.id

  policy = <<POLICY
{
    "Version": "2008-10-17",
    "Id": "ProtectionPolicy",
    "Statement": [
        {
            "Sid": "ProtectionPolicy",
            "Effect": "Deny",
            "Principal": {
                "AWS": "*"
            },
            "Action": "s3:DeleteBucket",
            "Resource": "arn:aws:s3:::${var.aws_setup_bucket}"
        }
    ]
}
POLICY
}
