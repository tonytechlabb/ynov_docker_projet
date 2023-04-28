# ynov_docker_projet

Here is my repository for my Sonar app.

## How it works

In our docker-compose file, we have 2 services : `sonarqube` and `db`.
`Sonarque` uses the SonarQube official docker image and it will be accessible on the port 9000 of our local host. We have environment variables set to configure the SonarQube database. There are also 2 volumes to save our data and the SonarQube extensions.

The second service, `db`, uses the PostGreSQL official Docker image. Environment variables are set to create our SonarQube database and we have a volume to save our data. We add a Dockerfile to build a personnalized Docker image using the PostgreSQL image. Basically, it says to copy the `init.sql` file in the `/docker-entrypoint-initdb.d/` directory. The `init.sql` file contains SQL instructions to initialyze the PostgreSQL database.

## How to install

Pull the image : 

`docker pull tonytechlab/sonarqube`

and run the following docker command :

`docker run -p 9000:9000 tonytechlab/sonarqube`

You can now access your Sonar app by hitting your local address on port 9000.

Enjoy.
