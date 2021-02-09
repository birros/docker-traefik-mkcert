# Traefik as reverse proxy for local development using Docker and mkcert

## Setup (macOS)

```shell
$ brew install mkcert
$ brew install nss
$ mkcert -install
$ make
$ make down
```

## Whoami (service example)

```shell
$ make whoami-up
$ make whoami-down
```
