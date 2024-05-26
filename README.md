# Installation requirements

* **Docker and Docker-Compose**

* https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-20-04-pt

* https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-compose-on-ubuntu-22-04


# 1- Construct and start the containers:

* **Use the first or second command, depends of your docker compose version**

* docker-compose up --build
* docker compose up --build

# 2 - Configure the database

* **Creating the database on container, please run these commands in new console's tab**

* docker compose run web rake db:create
* docker compose run web rake db:migrate

# 3 - Set up the test database

* docker compose run web rake db:create RAILS_ENV=test
* docker compose run web rake db:migrate RAILS_ENV=test

# 4 - Run the test

* docker compose run web bundle exec rspec

# 5 - Use the api-doc to execute the requests  RestApi

* Open this link on browser http://localhost:3000/api-docs/index.html