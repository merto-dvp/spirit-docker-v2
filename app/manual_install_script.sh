sudo chown -R $USER:$USER .
echo "Choose a project name for Spirit/Django app:"
read -p "App:" projectname
echo "Creating Spirit app as: " $projectname
#----- CHANGE spiritapp to change project name---------------
sudo docker-compose run web spirit startproject $projectname
sudo chown -R $USER:$USER .
sudo mv mysite _data
sudo mv _data/* ./
sudo rm -rf _data
sudo docker-compose run web python3 manage.py spiritinstall
