# librenms-docker
LibreNMS Docker Container

A simple docker container to run librenms. 

You will need a seperate MySQL server. 

Example datbase and user creation:

CREATE DATABASE librenms CHARACTER SET utf8 COLLATE utf8_unicode_ci;
CREATE USER 'librenms'@'%' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON librenms.* TO 'librenms'@'%';
FLUSH PRIVILEGES;

Once the container is created a loop starts every 10 seconds that fixes some permissions after the creation of the config. 
