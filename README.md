# 4Stack4PI

_Version 2.1.0_

The purpose of this repository is to build a stack of a local web app, a self-hosted instance of Gitea, and a PostgreSQL instance that can be used for an application backend. This is not meant to be fullly production-ready, rather for deployment within a Raspberry Pi.

## Helper Script

`helper.sh` is provided to allow changing the domain names from `example.local` to a more relevant hostname.

## Todo

- [ ] Add SSL certificate configuration
  - [x] Nginx SSL
  - [ ] Postgres SSL
  - [ ] Gitea SSL
  - [ ] Adminer SSL?
- [x] Use alpine images where applicable:
  - [x] Nginx: `nginx:stable-alpine`
  - [x] Gitea: N/A
  - [x] Postgres: `postgres:alpine`
  - [x] Adminer: N/A
- [x] Use NGINX environment variables and templates.
- [ ] Add SMTP server for Gitea
- [ ] Forward postgres and gitea logs to a host/bind mount directory
- [ ] Use Adminer image with environment variables?
  - What's the need? Not doing for now.
