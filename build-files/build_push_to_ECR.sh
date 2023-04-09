#cd ./build-files
aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 551804445178.dkr.ecr.ap-south-1.amazonaws.com
sudo git clone -b test-qa git@github.com:CloudTechService/enrollible-msg-center-frontend.git
cd enrollible-msg-center-frontend
echo "VUE_APP_API_BASE=https://qa-api-message.enrollible.com/api/v1\nVUE_APP_API_SSO=https://qa-api-sso.enrollible.com/api\nVUE_APP_SSO=https://qa-sso.enrollible.com\nVUE_APP_SITE_KEY=fzVrDNpRAxufNFsWWtfN7aAf2LsCEkvMgIiCXWlf" > .env
sudo docker build -t qa-enrollible-msg-center-ui .
sudo docker tag qa-enrollible-msg-center-ui:latest 551804445178.dkr.ecr.ap-south-1.amazonaws.com/qa-ui:qa-enrollible-msg-center-ui
sudo docker push 551804445178.dkr.ecr.ap-south-1.amazonaws.com/qa-ui:qa-enrollible-msg-center-ui
