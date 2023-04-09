## Executing shell script to build image and push to ECR via Null Resource ##
## API ##
resource "null_resource" "build_api" {
 provisioner "local-exec" {
    command = <<EOT
      aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin ${data.aws_caller_identity.current.account_id}.dkr.ecr.ap-south-1.amazonaws.com
      sudo git clone -b ecs-final-test git@github.com:CloudTechService/enrollible-msg-center-api.git
      cd enrollible-msg-center-api
      echo "APP_NAME=Laravel\nAPP_ENV=local\nAPP_KEY=base64:izhAmgjhE67gRG6vooVO1Vp3xO42hjM1ZJKWPYWRdGA=\nAPP_DEBUG=true\nAPP_URL=https://qa-api-message.enrollible.com\nAPP_API_URL=https://qa-api-message.enrollible.com/api/v1\nVAULT_TOKEN="hvs.CAESIHMjJacSJH2p7BHjF9YwDt7KRyutnpZZdFnkgxiFfIZsGh4KHGh2cy5uMDNqSjdrNDIyUTRrZUdqTXFDTTZJcGw"\nVAULT_URL_ALL=https://vault.purenroll.com/v1/kv/data/secret/enrollible-msg-center-api\nVAULT_URL_AWS_BUCKET=https://vault.purenroll.com/v1/kv/data/secret/enroll-msg-api-qa-s3\nVAULT_URL_DATABASE_MESSAGE_CENTER_API=https://vault.purenroll.com/v1/kv/data/secret/enroll-msg-api-qa-db1\nVAULT_URL_DATABASE_COR_API=https://vault.purenroll.com/v1/kv/data/secret/enroll-msg-api-qa-db2\nVAULT_URL_DATABASE_HEALTH_COMPANY=https://vault.purenroll.com/v1/kv/data/secret/enroll-msg-api-qa-db3\nVAULT_URL_DATABASE_SSO=https://vault.purenroll.com/v1/kv/data/secret/enroll-msg-api-qa-db4" > .env
      sudo docker build -t ${local.docker_tag_api} .
      sudo docker tag ${local.docker_tag_api}:latest ${local.ecr_image_api}:${local.docker_tag_api}
      sudo docker push ${local.ecr_image_api}:${local.docker_tag_api}
    EOT
    interpreter = ["/bin/bash", "-c"]
    working_dir = "./build-files"
  }
}

## UI ##
resource "null_resource" "build_ui" {
 provisioner "local-exec" {
    command = "sh qa-enrollible-msg-center-ui.sh > qa-enrollible-msg-center-ui.log 2>&1"
    interpreter = ["/bin/bash", "-c"]
    working_dir = "./build-files"
  }
}