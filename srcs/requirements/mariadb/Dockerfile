FROM debian:bullseye-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends mariadb-server && \
    rm -rf /var/lib/apt/lists/*

# 确保数据库数据目录存在，并设置 mysql 用户的权限
RUN mkdir -p /var/lib/mysql && \
    chown -R mysql:mysql /var/lib/mysql

# 修改 MariaDB 的配置文件，使其监听 0.0.0.0（所有网络接口）
RUN sed -i 's/^bind-address\s*=.*/bind-address = 0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf

EXPOSE 3306

CMD ["mysqld_safe"]
