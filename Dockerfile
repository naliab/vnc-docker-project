FROM alpine:latest

RUN apk update && apk add --no-cache nginx \
    && rm -rf /var/www/* && mkdir -p /var/www/vnc/img \
    && addgroup -S vnc-group && adduser -S vnc-user -G vnc-group \
    && chown -R vnc-user:vnc-group /var/www/vnc

COPY index.html /var/www/vnc
COPY expert.jpg /var/www/vnc/img
COPY default.conf /etc/nginx/http.d/default.conf
RUN sed -i 's/user nginx;/user vnc-user vnc-group;/g' /etc/nginx/nginx.conf

EXPOSE 80


CMD ["nginx", "-g", "daemon off;"]