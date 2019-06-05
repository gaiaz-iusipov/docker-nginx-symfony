FROM nginx:stable-alpine

LABEL maintainer="Gaiaz Iusipov <g.iusipov@gmail.com>"

RUN rm -r \
    /usr/share/nginx \
    /etc/nginx/conf.d/default.conf

COPY app.conf /etc/nginx/conf.d

COPY docker-entrypoint.sh .

ENV FASTCGI_PASS="localhost:9000"

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["nginx", "-g", "daemon off;"]
