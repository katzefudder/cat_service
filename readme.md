
Start the containers by stating:

``
docker-compose up -d --build
``

Scale webservers by stating:

``
docker-compose scale webserver=2
``

see consul web ui:

http://localhost:8500/ui/cat-service/services

see webserver:

http://localhost/webserver/
