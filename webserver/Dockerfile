FROM ubuntu:16.04

ENV CONSUL_VERSION 1.4.4
ENV CONSUL_TEMPLATE_VERSION 0.20.0

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
	curl dnsutils apache2 libapache2-mod-php php unzip \
	&& curl -sSL https://releases.hashicorp.com/consul/${CONSUL_VERSION}/consul_${CONSUL_VERSION}_linux_amd64.zip -o /tmp/consul.zip \
	&& cd /bin \
	&& unzip /tmp/consul.zip \
	&& chmod +x /bin/consul \
	&& rm /tmp/consul.zip \
&& apt-get clean

ADD https://releases.hashicorp.com/consul-template/${CONSUL_TEMPLATE_VERSION}/consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64.zip /

RUN unzip consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64.zip && \
    mv consul-template /usr/local/bin/consul-template &&\
    rm -rf /consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64.zip && \
    mkdir -p /etc/consul-template/config.d/templates

ADD config /etc/consul.d/webserver

RUN sed -i -e "s/variables_order = \"GPCS\"/variables_order = \"EGPCS\"/" /etc/php/7.0/cli/php.ini
RUN sed -i -e "s/variables_order = \"GPCS\"/variables_order = \"EGPCS\"/" /etc/php/7.0/apache2/php.ini

RUN rm /var/www/html/index.html

ADD index.php /etc/consul-templates/index.php
ADD img /var/www/html/img
ADD css /var/www/html/css

WORKDIR /var/www/html

ADD start.sh /

ENTRYPOINT ["/start.sh"]
