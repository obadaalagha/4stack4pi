# 4Stack4PI

_Version 1.0.0._

The purpose of this repository is to build a stack of a local web app, a self-hosted instance of Gitea, and a PostgreSQL instance that can be used for an application backend. This is not meant to be production-ready, rather for deployment to a local Raspberry PI.

TODO:

- Forward postgres and gitea logs to a host/bind mount directory?
- Add SMTP server for Gitea?
- Use alpine images where applicable?
- Better Docker compose file structuring?
- Saner defaults all around
- Use NGINX environment variables rather than conf files?
- Use Adminer image with environment variables?
