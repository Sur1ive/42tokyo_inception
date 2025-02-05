FROM alpine:3.20

RUN apk update && \
    apk add --no-cache nginx && \
    rm -rf /var/cache/apk/*

COPY nginx.conf /etc/nginx/nginx.conf
COPY server.crt /etc/nginx/ssl/server.crt
COPY server.key /etc/nginx/ssl/server.key

# RUN mkdir -p /var/www/html
# COPY ./html /var/www/html

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
