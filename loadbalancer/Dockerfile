FROM openresty/openresty:1.15.8.2-1-xenial

ENV PATH=$PATH:/usr/local/openresty/luajit/bin:/usr/local/openresty/nginx/sbin:/usr/local/openresty/bin

ENV CONSUL_VERSION 1.6.5
ENV CONSUL_TEMPLATE_VERSION 0.25.0

RUN mkdir -p /etc/consul.d

RUN apt-get -qq update \
    && apt-get -y install dnsutils procps curl wget iputils-ping net-tools unzip python-pip ca-certificates \
    && curl -sSL https://releases.hashicorp.com/consul/${CONSUL_VERSION}/consul_${CONSUL_VERSION}_linux_amd64.zip -o /tmp/consul.zip \
    && cd /bin \
    && unzip /tmp/consul.zip \
    && chmod +x /bin/consul \
    && rm /tmp/consul.zip \
    && pip install virtualenv

ADD https://releases.hashicorp.com/consul-template/${CONSUL_TEMPLATE_VERSION}/consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64.zip /

RUN unzip consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64.zip && \
    mv consul-template /usr/local/bin/consul-template &&\
    rm -rf /consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64.zip && \
    mkdir -p /etc/consul-template/config.d/templates

# install linux prometheus exporter
RUN cd /tmp && wget https://github.com/prometheus/node_exporter/releases/download/v1.0.0/node_exporter-1.0.0.linux-amd64.tar.gz && \
    tar -zxvf node_exporter-1.0.0.linux-amd64.tar.gz && \
    install node_exporter-1.0.0.linux-amd64/node_exporter /usr/local/bin/

ADD config /etc/consul.d/loadbalancer

# add nginx' host configuration
RUN rm /etc/nginx/conf.d/default.conf && mkdir -p /var/log/nginx

ADD start.sh /

ENTRYPOINT ["/start.sh"]
