FROM alpine:3.20

RUN apk update && \
    apk add --no-cache nginx && \
    rm -rf /var/cache/apk/*

COPY nginx.conf /etc/nginx/nginx.conf
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/server.key -out /etc/nginx/ssl/server.crt -subj "/C=JP/ST=Tokyo/L=Tokyo/O=42/OU=42/CN=inception"
COPY index.html /usr/share/nginx/html/index.html

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
