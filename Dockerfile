#
# Unofficial Caddy 2 Docker image.
#

##### Build stage #####
FROM golang:1.12-alpine

# Add git, clone the repository and switch to the
RUN apk add git --no-cache
RUN git clone https://github.com/caddyserver/caddy -b v2 caddy2

WORKDIR caddy2/cmd/caddy

RUN go build -v


##### Final image stage #####

FROM alpine:3.10

# Create Caddy's working directory.
RUN mkdir /caddy
WORKDIR /caddy

# copy just built binary to new stage
COPY --from=0 /go/caddy2/cmd/caddy/caddy /caddy/

# The index file indicates that the Caddy
# container is up and running.
COPY index.html /srv/index.html

# The initial configuration declares a file server
# delivering the index file in /srv.
COPY initial-conf.json ./initial-conf.json

CMD ["/caddy/caddy", "run", "--config", "initial-conf.json"]

EXPOSE 2019
EXPOSE 2080
