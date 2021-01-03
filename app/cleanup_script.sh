#Cleans the project folder.

echo "Running folder cleanup script."
sudo rm -rf manage.py
sudo rm -rf src/*
sudo rm -rf src
sudo rm -rf mysite
sudo rm -rf __init__.py
sudo rm -rf db.sqlite3
sudo rm -rf django.log
sudo rm -rf static
sudo rm -rf settings
sudo rm -rf urls.py
sudo rm -rf celery.py
sudo rm -rf wsgi.py
echo "Folder cleaned successfully."
echo ""
