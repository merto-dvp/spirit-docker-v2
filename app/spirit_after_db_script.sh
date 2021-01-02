sudo docker-compose run web python3 manage.py migrate
sudo docker-compose run web python3 manage.py createsuperuser
sudo rm db.sqlite3
sudo mv static web
sudo docker-compose up --build
