#cd ./build-files
aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 551804445178.dkr.ecr.ap-south-1.amazonaws.com
sudo git clone https://github.com/gech4me/tic-tac-react.git
cd tic-tac-react
sudo docker build -t tik-tac-app .
sudo docker tag tik-tac-app:latest 551804445178.dkr.ecr.ap-south-1.amazonaws.com/qa-ui:tik-tac-app
sudo docker push 551804445178.dkr.ecr.ap-south-1.amazonaws.com/qa-ui:tik-tac-app
