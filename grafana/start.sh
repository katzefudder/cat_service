#!/bin/bash

consul agent -config-file=/etc/consul.d/grafana -enable-local-script-checks &

bash /run.sh