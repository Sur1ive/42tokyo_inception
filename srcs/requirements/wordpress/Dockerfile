FROM debian:bullseye-slim

RUN apt-get update && \
    apt-get install -y php-fpm wordpress && \
    rm -rf /var/lib/apt/lists/*

RUN sed -i 's|listen = /run/php/php7.4-fpm.sock|listen = 9000|' /etc/php/7.4/fpm/pool.d/www.conf

RUN mkdir -p /run/php

COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]
CMD ["php-fpm7.4", "--nodaemonize"]
