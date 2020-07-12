sudo docker-compose build
sudo docker-compose up
sudo docker-compose down
sudo docker-compose run web rake db:create
docker-compose run web rake db:migrate