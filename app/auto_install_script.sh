#!/bin/bash
sudo apt update 
sudo apt install -y curl
sudo apt install -y docker-compose
sudo apt-get install -y\
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get -y install docker-ce docker-ce-cli containerd.io; 
echo "Testing Docker-hello-world"

sudo docker run hello-world;
sudo docker-compose --version;

echo "Done.";

sudo service docker restart;
sudo chown -R $USER:$USER .;
sudo systemctl enable docker;
sudo systemctl start docker ;

sudo chown -R $USER:$USER .;
sudo groupadd docker;

sudo chown -R $USER:$USER .;
sudo usermod -aG docker $USER;
echo "Installed Docker and requirements successfully."
sudo chown -R $USER:$USER .;
sudo bash cleanup_script.sh
sudo git clone https://github.com/merto-dvp/django-spirit-ready-app;
sudo rm -rf django-spirit-ready-app/.git;
sudo mv django-spirit-ready-app/* .;
sudo rm -rf django-spirit-ready-app;
echo "";
echo "Spirit app <mysite> is ready to serve.";
echo "Now running  <sudo docker-compose up> to serve.";
sudo docker-compose up;


