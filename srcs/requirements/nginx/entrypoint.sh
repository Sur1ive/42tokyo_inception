#!/bin/sh
set -e

envsubst '${DOMAIN_NAME}' < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf

exec "$@"
