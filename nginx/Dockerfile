FROM nginx

ENV CONSUL_VERSION 1.4.4
ENV CONSUL_TEMPLATE_VERSION 0.20.0

RUN mkdir -p /etc/consul.d

RUN apt-get -qq update \
    && apt-get -y install dnsutils procps curl unzip ca-certificates \
    && curl -sSL https://releases.hashicorp.com/consul/${CONSUL_VERSION}/consul_${CONSUL_VERSION}_linux_amd64.zip -o /tmp/consul.zip \
    && cd /bin \
    && unzip /tmp/consul.zip \
    && chmod +x /bin/consul \
    && rm /tmp/consul.zip

ADD https://releases.hashicorp.com/consul-template/${CONSUL_TEMPLATE_VERSION}/consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64.zip /

RUN unzip consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64.zip && \
    mv consul-template /usr/local/bin/consul-template &&\
    rm -rf /consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64.zip && \
    mkdir -p /etc/consul-template/config.d/templates

ADD config /etc/consul.d/loadbalancer

# add nginx' host configuration
RUN rm /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/conf.d/default.conf

ADD template /etc/consul-template/config.d/templates

ADD start.sh /

ENTRYPOINT ["/start.sh"]