FROM debian:bullseye-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends mariadb-server gettext-base && \
    rm -rf /var/lib/apt/lists/*

RUN sed -i 's/^bind-address.*$/bind-address = 0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf

RUN mkdir -p /run/mysqld && \
    chown -R mysql:mysql /run/mysqld

EXPOSE 3306

COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

COPY init.sql /tmp/init.sql

ENTRYPOINT ["entrypoint.sh"]
CMD ["mysqld"]
