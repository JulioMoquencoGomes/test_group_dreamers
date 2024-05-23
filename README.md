# Instalation requirements
* docker
** https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-20-04-pt

# Construct and start the containers:
* docker-compose up --build

# Configure the database
* docker-compose run web rake db:create
* docker-compose run web rake db:migrate
