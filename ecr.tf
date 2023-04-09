## ECR for API ##
resource "aws_ecr_repository" "api" {
  provider             = aws
  name                 = local.ecr_name_api
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

}

# resource "aws_ecr_repository_policy" "policy" {
#   repository = aws_ecr_repository.this.name
#   provider   = aws

#   policy     = <<EOF
# {
#   "Version": "2008-10-17",
#   "Statement": [
#     {
#       "Sid": "AllowPushPull",
#       "Effect": "Allow",
#       "Principal": {
#         "AWS": "${local.ecr_aws_principal}"
#       },
#       "Action": [
#         "ecr:GetDownloadUrlForLayer",
#         "ecr:BatchGetImage",
#         "ecr:BatchCheckLayerAvailability",
#         "ecr:PutImage",
#         "ecr:InitiateLayerUpload",
#         "ecr:UploadLayerPart",
#         "ecr:CompleteLayerUpload"
#       ]
#     }
#   ]
# }
# EOF
#   depends_on = [aws_ecr_repository.this]

# }

## ECR for UI ##
resource "aws_ecr_repository" "ui" {
  provider             = aws
  name                 = local.ecr_name_ui
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

}

# resource "aws_ecr_repository_policy" "policy" {
#   repository = aws_ecr_repository.this.name
#   provider   = aws

#   policy     = <<EOF
# {
#   "Version": "2008-10-17",
#   "Statement": [
#     {
#       "Sid": "AllowPushPull",
#       "Effect": "Allow",
#       "Principal": {
#         "AWS": "${local.ecr_aws_principal}"
#       },
#       "Action": [
#         "ecr:GetDownloadUrlForLayer",
#         "ecr:BatchGetImage",
#         "ecr:BatchCheckLayerAvailability",
#         "ecr:PutImage",
#         "ecr:InitiateLayerUpload",
#         "ecr:UploadLayerPart",
#         "ecr:CompleteLayerUpload"
#       ]
#     }
#   ]
# }
# EOF
#   depends_on = [aws_ecr_repository.this]

# }
