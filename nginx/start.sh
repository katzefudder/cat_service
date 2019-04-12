#!/usr/bin/env bash
service nginx start

consul agent -config-file=/etc/consul.d/loadbalancer
./http_request loadbalancer
