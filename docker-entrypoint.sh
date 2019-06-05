#!/usr/bin/env sh

envsubst '$FASTCGI_PASS' \
    < /etc/nginx/conf.d/app.conf \
    | tee /etc/nginx/conf.d/app.conf

exec "$@"
