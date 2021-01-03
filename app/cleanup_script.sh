sudo chown -R $USER:$USER .
echo ""
echo "Running folder cleanup script."
sudo rm -rf manage.py
sudo rm -rf src/*
sudo rm -rf src
sudo rm -rf mysite
sudo rm -rf __init__.py
echo "Folder cleaned successfully."
