#!/bin/bash
set -euo pipefail

CONFIG_FILE=/etc/wordpress/config-localhost.php

cp /var/www/html/wp-config-sample.php ${CONFIG_FILE}

sed -i "s/database_name_here/${WORDPRESS_DB_NAME}/" ${CONFIG_FILE}
sed -i "s/username_here/${WORDPRESS_DB_USER}/" ${CONFIG_FILE}
sed -i "s/password_here/${WORDPRESS_DB_PASSWORD}/" ${CONFIG_FILE}
sed -i "s/localhost/${WORDPRESS_DB_HOST}/" ${CONFIG_FILE}

exec "$@"
