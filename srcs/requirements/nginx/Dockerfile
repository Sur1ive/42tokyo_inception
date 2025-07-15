FROM alpine:3.20

RUN apk update && \
    apk add --no-cache nginx openssl envsubst && \
    rm -rf /var/cache/apk/*

COPY nginx.conf /etc/nginx/nginx.conf.template
RUN mkdir -p /etc/nginx/ssl && \
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/server.key -out /etc/nginx/ssl/server.crt -subj "/C=JP/ST=Tokyo/L=Tokyo/O=42/OU=42/CN=inception"

EXPOSE 443

COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]
