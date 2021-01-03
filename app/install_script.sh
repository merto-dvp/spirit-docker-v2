#!/bin/bash

# Add repositories for required sources
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
   
#Install Docker and other Docker related sources.  
sudo apt-get -y install docker-ce docker-ce-cli containerd.io;

#Test if Docker works correctly with hello-world image.
echo ""
echo "Testing Docker-hello-world"

sudo docker run hello-world;
sudo docker-compose --version;

echo "Done.";

#Setup docker related services
sudo service docker restart;
sudo chown -R $USER:$USER .;
sudo systemctl enable docker;
sudo systemctl start docker ;

#For gaining permissions on USER & other user related configs
sudo chown -R $USER:$USER .;
sudo groupadd docker;
sudo chown -R $USER:$USER .;
sudo usermod -aG docker $USER;
echo "Installed Docker and requirements successfully."

#Run other manual script for asking to deploy ready-to-serve Spirit/Django app.
#This script loads https://github.com/merto-dvp/django-spirit-ready-app on permission
bash spirit_install_app_script.sh

exit
