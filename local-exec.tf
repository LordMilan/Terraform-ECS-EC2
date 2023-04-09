## Executing shell script to build image and push to ECR via Null Resource ##
## API ##
resource "null_resource" "build_api" {
 provisioner "local-exec" {
    command = <<EOT
      aws ecr get-login-password --region ${local.awslogs-region} | docker login --username AWS --password-stdin ${data.aws_caller_identity.current.account_id}.dkr.ecr.${local.awslogs-region}.amazonaws.com
      sudo git clone -b ecs-final-test git@github.com:CloudTechService/enrollible-msg-center-api.git
      cd enrollible-msg-center-api
      echo "APP_NAME=Laravel
      APP_ENV=local
      APP_KEY=base64:izhAmgjhE67gRG6vooVO1Vp3xO42hjM1ZJKWPYWRdGA=
      APP_DEBUG=true
      APP_URL=https://qa-api-message.enrollible.com
      APP_API_URL=https://qa-api-message.enrollible.com/api/v1
      VAULT_TOKEN="hvs.CAESIBc5psngn_1RWsoebVfBrl5Qq-CMMap577PWi4vLeTXeGh4KHGh2cy5vUjJpdFc4djhzRTRjMG52YzNhUnVRY2c"
      VAULT_URL_ALL=https://vault.purenroll.com/v1/kv/data/secret/enrollible-msg-center-api
      VAULT_URL_AWS_BUCKET=https://vault.purenroll.com/v1/kv/data/secret/enroll-msg-api-qa-s3
      VAULT_URL_DATABASE_MESSAGE_CENTER_API=https://vault.purenroll.com/v1/kv/data/secret/enroll-msg-api-qa-db1
      VAULT_URL_DATABASE_COR_API=https://vault.purenroll.com/v1/kv/data/secret/enroll-msg-api-qa-db2
      VAULT_URL_DATABASE_HEALTH_COMPANY=https://vault.purenroll.com/v1/kv/data/secret/enroll-msg-api-qa-db3
      VAULT_URL_DATABASE_SSO=https://vault.purenroll.com/v1/kv/data/secret/enroll-msg-api-qa-db4" > .env
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