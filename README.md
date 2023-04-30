# ynov_docker_projet

## What is requested

- Un docker-compose qui a au moins 2 services qui communiquent
- Une image Docker customisé qui vient de votre compte Docker Hub (ou tous mais au moins un)
    - L'image contient un entrypoint custom
- Au moins un volume partagé avec la machine hôte pour pouvoir garder un état si on éteint et redémarre le docker-compose
- Des variables d'environnement pris en compte dans le container (dans le entrypoint ou par example pour connecter le back à la base de données)

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

As requested by the project, I had to implement a customized Docker image. So I created one named "tonytechlab/myalpine" which is available on my dockerhub, and it will be linked to an entrypoint.sh file that will show the current date. To do so, build my image `docker build -t tonytechlab/myalpine`, then run it `docker run tonytechlab/myalpine time` (ps : it requires the `time` parameter to show the current date).

Enjoy.
