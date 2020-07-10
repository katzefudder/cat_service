# Load Balancing with openresty and Consul Template, monitoring with Prometheus

Run a set of load balanced Apache Web Servers to serve a simple web page.
The service is monitored using Prometheus and Alertmanager, graphing via Grafana.
Users might change some settings via Consul Template on the loadbalancing nginx proxy in front of the webservers.
 
![Architecture Schema](architecture-schema.jpg)

* Registering each Apache instance within Consul
* update openresty's upstream using Consul Template and reload openresty in case changes happen to the array of webservers
* monitor all available services using Prometheus
* visualize all metrics with Grafana
* alerting with Prometheus' Alertmanager


## Start the containers by stating:

``
docker-compose up -d --build
``

## Available Services

| Component                     | Description                                                               | URL                           |
| -----------------------       | ------------------------------------------------------                    | ----------------------------- |
| consul-1                      | Consul                                                                    | <http://localhost:8500/>      |
| consul-2                      | Consul                                                                    | not available to the outside  |
| consul-3                      | Consul                                                                    | not available to the outside  |
| loadbalancer                  | Openresty                                                                 | <http://localhost:80/>        |
| webserver-1                   | Apache                                                                    | not available to the outside  |
| webserver-2                   | Apache                                                                    | not available to the outside  |
| webserver-3                   | Apache                                                                    | not available to the outside  |
| grafana                       | Grafana                                                                   | <http://localhost:3000/>      |
| prometheus                    | Prometheus                                                                | <http://localhost:9090/>      |
| alertmanager                  | Alertmanager                                                              | <http://localhost:9093/>      |
| mailhog                       | Mailhog                                                                   | <http://localhost:8025/>      |
| node-exporter                 | Node Exporter                                                             | <http://localhost:9100/>      |