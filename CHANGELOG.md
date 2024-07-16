# Changelog

2.0.1:
- Added changelog, separate from README, and updated README to have proper changelog

2.0.1:
- Stylistic changes to README

2.0.0:
- Added SSL configuration for Nginx, blank certificate files (as examples of directory structure), and changelog in README.
- Changed Nginx config file from static file to template to allow for environment variable usage. Environment variables added:
  - `NGINX_SERVER_NAME`
  - `NGINX_HTTP_LISTEN_PORT`
  - `NGINX_HTTPS_LISTEN_PORT`
  - `NGINX_ROOT_DIR`
  - Deprecated `NGINX_CONF_FILE`
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