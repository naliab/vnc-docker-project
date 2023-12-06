FROM alpine:latest

RUN apt update && apt upgrade
RUN apt install nginx && apt clean
RUN rm -rf /var/www/* \
    && mkdir -p /var/www/vnc/img

COPY index.html /var/www/vnc
COPY expert.jpg /var/www/vnc/img