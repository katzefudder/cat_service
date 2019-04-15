#!/usr/bin/env bash
service apache2 start

consul agent -config-file=/etc/consul.d/webserver -enable-local-script-checks &
consul-template \
    -consul-addr consul1:8500 \
    -template "/etc/consul-templates/index.php:/var/www/html/index.php:service apache2 reload" \
