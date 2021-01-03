#!/bin/bash

echo "Do you want to install a ready to serve project for Spirit?"
echo "It is ready to serve with Docker and will be downloaded from GitHub."
echo "This will set Django(Spirit) app name as <mysite>."
echo "You can cancel this for building app manually."
while true
do
 read -r -p "[Y/n]? " input
 case $input in
     [yY][eE][sS]|[yY])
 echo "Selected: Yes"
 echo "Installing Spirit boilerplate from GitHub."
 sudo chown -R $USER:$USER .
 sudo bash cleanup_script.sh

 git clone https://github.com/merto-dvp/django-spirit-ready-app
 sudo rm -rf django-spirit-ready-app/.git
 sudo mv django-spirit-ready-app/* .
 sudo rm -rf django-spirit-ready-app
 echo ""
 sudo docker-compose down
 echo "Spirit app <mysite> is ready to serve."
 echo "Run  <sudo docker-compose up --build> to run application."
 break
 ;;
     [nN][oO]|[nN])
 echo "Selected: No"
 echo "This folder is ready to serve Django apps."
 echo "Check out readme and docs for installing Spirit app manually or rerun this script."

 break
