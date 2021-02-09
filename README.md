# Traefik as reverse proxy for local development

Scaffolding of a reverse proxy for local development :
1. [traefik][1] watch [docker][2] to detect new web services to be exposed
   locally
2. [mkcert][3] is used as ssl provider for valid certificates in browsers

## Setup (macOS)

```shell
$ brew install mkcert
$ brew install nss
$ mkcert -install
$ make      # start
$ make down # stop
```

Dashboard available here: http://dashboard.dev.localhost

## Example of web service (whoami)

```shell
$ make whoami-up   # start
$ make whoami-down # stop
```

Whoami available here: http://whoami.dev.localhost

## Remarks

By default **macOS** and **linux** point subdomains `<subdomain>.localhost` to
`localhost`, which is not necessarily the case on all systems, it may be
necessary to manually edit `/etc/hosts` in order to add these redirections.

<!-- Links -->

[1]: https://github.com/traefik/traefik
[2]: https://github.com/docker/docker-ce
[3]: https://github.com/FiloSottile/mkcert
