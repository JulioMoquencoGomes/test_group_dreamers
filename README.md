# Instalation requirements

* **Docker and Docker-Compose**

* https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-20-04-pt

* https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-compose-on-ubuntu-22-04


# Construct and start the containers:

* **Use the first or second command**

* docker-compose up --build
* docker compose up --build

# Configure the database

* **Creating the database on container**

* docker-compose run web rake db:create
* docker-compose run web rake db:migrate

# Set Up the Test Database

* docker-compose run web rake db:create RAILS_ENV=test
* docker-compose run web rake db:migrate RAILS_ENV=test

# Run the test

* docker-compose run web bundle exec rspec