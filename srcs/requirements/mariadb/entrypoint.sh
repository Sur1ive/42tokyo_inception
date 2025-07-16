#!/bin/bash
set -e

if [ ! -d /var/lib/mysql/${MYSQL_DATABASE} ]; then
  mysql_install_db || true
  mysqld &

  while ! mysqladmin ping &> /dev/null; do
    echo 'Waiting for MariaDB to start...'
    sleep 1
  done

  echo "Initializing the database."
  envsubst < /tmp/init.sql | mysql -u root
  mysqladmin -u root shutdown
fi

exec "$@"
