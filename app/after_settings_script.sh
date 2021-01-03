sudo rm -rf db.sqlite3 #Clean up unnecessary db files after db change
sudo docker-compose down #Remove container for further install
sudo docker-compose up --build  #Build & install docker containers required.



