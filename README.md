# docker-nginx-symfony

[![GitHub](https://img.shields.io/github/license/gaiaz-iusipov/docker-nginx-symfony.svg)](https://github.com/gaiaz-iusipov/docker-nginx-symfony#license)
[![Docker Automated build](https://img.shields.io/docker/cloud/automated/gaiaz/nginx-symfony.svg)](https://cloud.docker.com/repository/docker/gaiaz/nginx-symfony)
[![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/gaiaz/nginx-symfony.svg)](https://cloud.docker.com/repository/docker/gaiaz/nginx-symfony)
[![Docker Pulls](https://img.shields.io/docker/pulls/gaiaz/nginx-symfony.svg)](https://hub.docker.com/r/gaiaz/nginx-symfony/)

:whale: [Alpine](https://alpinelinux.org/) Linux based [Nginx](https://www.nginx.com/) [Docker](https://www.docker.com/) Image for [Symfony](https://symfony.com/) applications.

## Usage

### Docker Compose
```yaml
version: '3'

services:
  php:
    build: .
    volumes:
      - .:/app:rw
  nginx:
    image: gaiaz/nginx-symfony
    ports:
      - 80:80
    volumes:
      - ./public:/app/public:ro
    depends_on:
      - php
    environment:
      FASTCGI_PASS: php:9000
```

### Kubernetes Deployment
```yaml
volumes:
  - name: public
    emptyDir: {}
containers:
  - name: php
    image: app-image:tag
    volumeMounts:
      - name: public
        mountPath: /tmp/public
    lifecycle:
      postStart:
        exec:
          command: ["/bin/sh", "-c", "cp -r /app/public /tmp/public"]
  - name: nginx
    image: gaiaz/nginx-symfony
    ports:
      - name: http
        containerPort: 80
    volumeMounts:
      - name: public
        mountPath: /app/public
        readOnly: true
```

## License

[MIT](http://opensource.org/licenses/MIT) © [Gaiaz Iusipov](https://github.com/gaiaz-iusipov)
