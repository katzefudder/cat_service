FROM ubuntu:16.04

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
	curl apache2 libapache2-mod-php php\
&& apt-get clean

RUN sed -i -e "s/variables_order = \"GPCS\"/variables_order = \"EGPCS\"/" /etc/php/7.0/cli/php.ini
RUN sed -i -e "s/variables_order = \"GPCS\"/variables_order = \"EGPCS\"/" /etc/php/7.0/apache2/php.ini

RUN rm /var/www/html/index.html
ADD website/ /var/www/html

WORKDIR /var/www/html

CMD ["apachectl", "-D", "FOREGROUND"]