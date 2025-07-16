#!/bin/bash

echo "Try to download WordPress if needed."
wp core download --path=/var/www/html --allow-root || true

wp config create --path=/var/www/html --dbname=${WORDPRESS_DB_NAME} \
  --dbuser=${WORDPRESS_DB_USER} --dbpass=${WORDPRESS_DB_PASSWORD} \
  --dbhost=${WORDPRESS_DB_HOST} --allow-root || true

echo "Waiting for the database to be ready..."
while ! wp db check --path=/var/www/html --allow-root --quiet; do
    echo "Database connection failed, retrying in 1 second..."
    sleep 1
done
echo "Database is ready. Try to install WordPress and create users if needed."

wp core install --path=/var/www/html --url=https://${DOMAIN_NAME} \
    --admin_user=yxu --admin_password=${WP_ADMIN_PASSWD} --title=${DOMAIN_NAME} \
    --admin_email=yxu@test.com --allow-root || true

wp user create test_user test@test.com --path=/var/www/html --role=editor \
    --user_pass=${WP_USER_PASSWD} --allow-root || true

exec "$@"
