#!/usr/bin/env bash

consul agent -config-file=/etc/consul.d/loadbalancer -enable-local-script-checks &

sleep 5

consul kv put limit_conn "3"
consul kv put limit_rate "20k"

consul-template \
    -consul-addr consul1:8500 \
    -template "/etc/consul-template/config.d/templates/nginx.conf:/etc/nginx/conf.d/app.conf" \
    -exec "nginx -g 'daemon off;'" \
    -log-level=INFO