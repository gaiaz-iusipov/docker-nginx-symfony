FROM nginx:stable-alpine

LABEL maintainer="Gaiaz Iusipov <g.iusipov@gmail.com>"

RUN rm -r \
    /usr/share/nginx \
    /etc/nginx/conf.d/default.conf \
    /etc/nginx/*.default

COPY app.conf /etc/nginx/conf.d
