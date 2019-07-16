#
# Unofficial Caddy 2 Docker image.
#
FROM golang:1.12-alpine

# Create Caddy's working directory.
RUN mkdir /caddy
WORKDIR /caddy

# Add git, clone the repository and switch to the
# v2 branch since Caddy 2 is not in the master yet.
RUN apk add git --no-cache
RUN git clone https://github.com/caddyserver/caddy caddy2 \
    && cd caddy2 \
    && git fetch \
    && git checkout v2

WORKDIR /caddy/caddy2/cmd/caddy

RUN go build -v
CMD ["./caddy", "start"]

EXPOSE 2019 2019
EXPOSE 80 2080
#WORKDIR /srv

#COPY index.html /srv/index.html