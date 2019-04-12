
Add the loadbalancer to Consul

`docker cp consul/config/loadbalancer loadbalancer:/etc/consul.d`
`docker exec -d -t loadbalancer consul agent -config-file=/etc/consul.d/loadbalancer`
`docker exec -d -t loadbalancer bash -c './http_request loadbalancer'`

