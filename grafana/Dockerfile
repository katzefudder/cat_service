FROM grafana/grafana:7.0.3

USER root

ENV CONSUL_VERSION 1.6.5

RUN mkdir -p /etc/consul.d /opt/consul
RUN chown grafana:grafana /opt/consul

RUN wget https://releases.hashicorp.com/consul/${CONSUL_VERSION}/consul_${CONSUL_VERSION}_linux_amd64.zip -O /tmp/consul.zip \
    && cd /bin \
    && unzip /tmp/consul.zip \
    && chmod +x /bin/consul \
    && rm /tmp/consul.zip

ADD config /etc/consul.d/grafana
ADD start.sh /start.sh

ENTRYPOINT ["/start.sh"]

USER grafana