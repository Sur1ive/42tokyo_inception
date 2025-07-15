FROM debian:bullseye-slim

# install wordpress's dependencies and remove debian version of wordpress
RUN apt-get update && \
    apt-get install -y php-fpm curl wordpress && \
    apt-get remove -y wordpress && \
    rm -rf /var/lib/apt/lists/*

RUN sed -i 's|listen = /run/php/php7.4-fpm.sock|listen = 9000|' /etc/php/7.4/fpm/pool.d/www.conf

RUN mkdir -p /run/php

COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

ENTRYPOINT ["entrypoint.sh"]
CMD ["php-fpm7.4", "--nodaemonize"]
