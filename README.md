# 4Stack4PI

_Version 2.0.0_

The purpose of this repository is to build a stack of a local web app, a self-hosted instance of Gitea, and a PostgreSQL instance that can be used for an application backend. This is not meant to be fullly production-ready, rather for deployment within a Raspberry Pi.

## TODO:

- [ ] Add SSL certificate configuration
  - [x] Nginx SSL
  - [ ] Postgres SSL
  - [ ] Gitea SSL
  - [ ] Adminer SSL?
- [x] Use alpine images where applicable:
  - [x] Nginx: nginx:stable-alpine
  - [x] Gitea: N/A
  - [x] Postgres: postgres:alpine
  - [x] Adminer: N/A
- [x] Use NGINX environment variables and templates.
- [ ] Add SMTP server for Gitea
- [ ] Forward postgres and gitea logs to a host/bind mount directory
- [ ] Use Adminer image with environment variables?
  - What's the need? Not doing for now.

## Changelog

2.0.0:
- Added SSL configuration for Nginx, blank certificate files (as examples of directory structure), and changelog in README.
- Changed Nginx config file from static file to template to allow for environment variable usage. Environment variables added:
  - NGINX_SERVER_NAME
  - NGINX_HTTP_LISTEN_PORT
  - NGINX_HTTPS_LISTEN_PORT
  - NGINX_ROOT_DIR
- Used alpine images where applicable.
- Cleaned up README.

1.0.2:
- Fixes to docker-compose and nginx config files:
  - nginx/example.conf:
    - Reference subdomains rather than loopback.
    - Changed root from `/var/www/html` to `/usr/share/nginx/html`.
  - docker-compose: changed version from `3.1` to `3`.
  - README: Updated version in README (was not being updated before).

1.0.1:
- Minor README changes and fixes to index.html file.

1.0.0:
- Project init.
