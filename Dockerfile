FROM alpine:latest

RUN apk update && apk add --no-cache nginx \
    && rm -rf /var/www/* && mkdir -p /var/www/vnc/img

COPY index.html /var/www/vnc
COPY expert.jpg /var/www/vnc/img

EXPOSE 80


CMD ["nginx", "-g", "daemon off;"]