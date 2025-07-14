#!/bin/bash
set -euo pipefail

CONFIG_FILE=/etc/wordpress/config-default.php

if [ ! -f /var/www/html/wp-config.php ]; then
  cp -r /usr/share/wordpress/* /var/www/html/
  cp /var/www/html/wp-config-sample.php ${CONFIG_FILE}

  sed -i "s/database_name_here/${WORDPRESS_DB_NAME}/" ${CONFIG_FILE}
  sed -i "s/username_here/${WORDPRESS_DB_USER}/" ${CONFIG_FILE}
  sed -i "s/password_here/${WORDPRESS_DB_PASSWORD}/" ${CONFIG_FILE}
  sed -i "s/localhost/${WORDPRESS_DB_HOST}/" ${CONFIG_FILE}

  wp core install --url=https://${DOMAIN_NAME} \
      --admin_user=yxu --admin_password=${WP_ADMIN_PASSWD} \
      --admin_email=yxu@test.com --allow-root

  wp user create test_user test@test.com --role=editor \
      --user_pass=${WP_USER_PASSWD} --allow-root
fi

exec "$@"
