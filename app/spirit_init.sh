sudo chown -R $USER:$USER .
sudo docker-compose run web spirit startproject mysite
sudo chown -R $USER:$USER .
sudo mv mysite _data
sudo mv _data/* ./
sudo rm -rf _data
sudo docker-compose run web python3 manage.py spiritinstall

