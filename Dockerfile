FROM alpine:latest

RUN apk --no-cache update && apk --no-cache upgrade && apk add --no-cache nginx \
    && rm -rf /var/cache/apk/* && rm -rf /var/www/* \
	&& mkdir -p /var/www/vnc/img && addgroup -S vnc-group \
    && adduser -S vnc-user -G vnc-group \
    && chown -R vnc-user:vnc-group /var/www/vnc

COPY . .
RUN sed -i 's/user nginx;/user vnc-user vnc-group;/g' /etc/nginx/nginx.conf

EXPOSE 80


CMD ["nginx", "-g", "daemon off;"]