#For migrating project related changes
sudo docker-compose run web python3 manage.py migrate

#For creating admin account for project
sudo docker-compose run web python3 manage.py createsuperuser

#Folder related changes
sudo rm db.sqlite3
sudo mv static web

#Build container for fresh start.
sudo docker-compose up --build
