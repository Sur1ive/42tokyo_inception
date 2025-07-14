#!/bin/bash
set -euo pipefail

envsubst '${DOMAIN_NAME}' < /etc/nginx/nginx.conf > /etc/nginx/nginx.conf

exec "$@"
