sudo docker-compose down;
sudo chown -R $USER:$USER .;
sudo bash cleanup_script.sh

#----- CHANGE spiritapp to change project name---------------

sudo chown -R $USER:$USER .;
sudo apt install python3-pip
sudo pip3 install django-spirit
sudo pip3 install -r requirements.txt
echo ""
echo "Choose a project name for Spirit/Django app:";
read -p "App:" projectname;
echo ""
echo "Creating Spirit app as: " $projectname;

spirit startproject $projectname

sudo mv $projectname _data;
sudo mv _data/* ./;
sudo rm -rf _data;
sudo python3 manage.py spiritinstall;
sudo mkdir src;
sudo mv static src;
echo "";
echo "Created Spirit project as " $projectname;
echo "This is the default project for nitely/Spirit";
echo "For using it with Docker, you have to configure database and docker-compose.yml"
echo "Also you have to configure NGINX and gunicorn settings.";

