#
# Unofficial Caddy 2 Docker image.
#
FROM alpine:3.10

# Download Caddy 2 and run it on :2080

EXPOSE 2019 2019
EXPOSE 80 2080
WORKDIR /srv

COPY index.html /srv/index.html