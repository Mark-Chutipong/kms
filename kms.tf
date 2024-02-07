#KMS Key

resource "aws_kms_key" "default" {
  description = var.name
}

# KMS Alias

resource "aws_kms_alias" "a" {
  name          = var.alias
  target_key_id = aws_kms_key.default.key_id
}

resource "aws_kms_key_policy" "default" {
   key_id = aws_kms_key.default.key_id
   policy = jsonencode({
     Id = "example"
     Statement = [
       {
         Action = "kms:*"
         Effect = "Allow"
         Principal = {
           AWS = "*"
         }

         Resource = "*"
         Sid      = "Enable IAM User Permissions"
       },
     ]
     Version = "2012-10-17"
   })
}



