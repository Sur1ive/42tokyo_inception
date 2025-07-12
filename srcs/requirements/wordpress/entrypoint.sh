#!/bin/bash
set -euo pipefail

cp /var/www/html/wp-config-sample.php /etc/wordpress/config-localhost.php

sed -i "s/define('DB_HOST', 'localhost');/define('DB_HOST', '${WORDPRESS_DB_HOST}');/" /etc/wordpress/config-localhost.php
sed -i "s/define('DB_NAME', 'wordpress');/define('DB_NAME', '${WORDPRESS_DB_NAME}');/" /etc/wordpress/config-localhost.php
sed -i "s/define('DB_USER', 'wordpress');/define('DB_USER', '${WORDPRESS_DB_USER}');/" /etc/wordpress/config-localhost.php
sed -i "s/define('DB_PASSWORD', 'password');/define('DB_PASSWORD', '${WORDPRESS_DB_PASSWORD}');/" /etc/wordpress/config-localhost.php

exec "$@"
