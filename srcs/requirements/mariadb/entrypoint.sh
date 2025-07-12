#!/bin/bash
set -euo pipefail

if [ ! -d /var/lib/mysql/${MYSQL_DATABASE} ]; then
  mysqld &

  for i in {0..10}; do
    if mysqladmin ping &> /dev/null; then
      break
    fi
    echo 'MariaDB starting...' "$i"
    sleep 1
  done

  if [ "$i" = 10 ]; then
    echo >&2 'MariaDB startup failed.'
    exit 1
  fi

  envsubst < /tmp/init.sql | mysql -u root
  mysqladmin -u root shutdown
fi

exec "$@"
