#!/usr/bin/env bash
service nginx start

consul agent -config-file=/etc/consul.d/loadbalancer -enable-local-script-checks &
consul-template \
    -consul-addr consul1:8500 \
    -template "/etc/consul-templates/nginx.conf:/etc/nginx/conf.d/app.conf:service nginx reload" \
