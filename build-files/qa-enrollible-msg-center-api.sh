#cd ./build-files
aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 551804445178.dkr.ecr.ap-south-1.amazonaws.com
sudo git clone -b ecs-final-test git@github.com:CloudTechService/enrollible-msg-center-api.git
cd enrollible-msg-center-api
echo "APP_NAME=Laravel\nAPP_ENV=local
APP_KEY=base64:izhAmgjhE67gRG6vooVO1Vp3xO42hjM1ZJKWPYWRdGA=\nAPP_DEBUG=true
APP_URL=https://qa-api-message.enrollible.com\nAPP_API_URL=https://qa-api-message.enrollible.com/api/v1
VAULT_TOKEN="hvs.CAESIHMjJacSJH2p7BHjF9YwDt7KRyutnpZZdFnkgxiFfIZsGh4KHGh2cy5uMDNqSjdrNDIyUTRrZUdqTXFDTTZJcGw"
VAULT_URL_ALL=https://vault.purenroll.com/v1/kv/data/secret/enrollible-msg-center-api
VAULT_URL_AWS_BUCKET=https://vault.purenroll.com/v1/kv/data/secret/enroll-msg-api-qa-s3
VAULT_URL_DATABASE_MESSAGE_CENTER_API=https://vault.purenroll.com/v1/kv/data/secret/enroll-msg-api-qa-db1
VAULT_URL_DATABASE_COR_API=https://vault.purenroll.com/v1/kv/data/secret/enroll-msg-api-qa-db2
VAULT_URL_DATABASE_HEALTH_COMPANY=https://vault.purenroll.com/v1/kv/data/secret/enroll-msg-api-qa-db3
VAULT_URL_DATABASE_SSO=https://vault.purenroll.com/v1/kv/data/secret/enroll-msg-api-qa-db4" > .env
sudo docker build -t qa-enrollible-msg-center-api .
sudo docker tag qa-enrollible-msg-center-api:latest 551804445178.dkr.ecr.ap-south-1.amazonaws.com/qa-api:qa-enrollible-msg-center-api
sudo docker push 551804445178.dkr.ecr.ap-south-1.amazonaws.com/qa-api:qa-enrollible-msg-center-api