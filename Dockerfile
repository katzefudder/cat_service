FROM ubuntu:16.04

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
	curl git zip apache2 php php-dom php-curl php-common\
&& apt-get clean

RUN rm /var/www/html/index.html
ADD website/ /var/www/html

WORKDIR /var/www/html

CMD ["apachectl", "-D", "FOREGROUND"]