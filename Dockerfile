#
# Unofficial Caddy 2 Docker image.
#
FROM golang:1.12-alpine

# Copy the index file which confirms that the Caddy 2
# container is up and running.
WORKDIR /srv
COPY index.html ./index.html

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
COPY initial-conf.json ./initial-conf.json

RUN go build -v
CMD ["./caddy", "run", "--config", "initial-conf.json"]

EXPOSE 2019 2019
EXPOSE 2080 2080