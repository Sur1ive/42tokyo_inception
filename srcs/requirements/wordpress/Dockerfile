FROM debian:bullseye-slim

RUN apt-get update && \
    apt-get install -y php-fpm wordpress && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /run/php

CMD ["php-fpm7.4", "--nodaemonize"]
