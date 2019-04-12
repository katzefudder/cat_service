#!/usr/bin/env bash
service nginx start

consul agent -config-file=/etc/consul.d/loadbalancer -enable-local-script-checks