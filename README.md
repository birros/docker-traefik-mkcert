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

Dashboard available here: https://dashboard.dev.localhost

## Example of web service (whoami)

```shell
$ make whoami-up   # start
$ make whoami-down # stop
```

Whoami available here: https://whoami.dev.localhost

## Remarks

By default only **linux** point addresses `<subdomain>.localhost` to
`localhost`, which is not necessarily the case on all systems. In this case a
solution could be to use dnsmasq to point the `<subdomain>.localhost` addresses
to `localhost`.

### macOS

```shell
$ brew install dnsmasq
$ mkdir -pv $(brew --prefix)/etc/
$ echo 'address=/.localhost/127.0.0.1' >> $(brew --prefix)/etc/dnsmasq.conf
$ sudo brew services start dnsmasq
$ sudo mkdir -v /etc/resolver
$ sudo bash -c 'echo "nameserver 127.0.0.1" > /etc/resolver/localhost'
````

<!-- Links -->

[1]: https://github.com/traefik/traefik
[2]: https://github.com/docker/docker-ce
[3]: https://github.com/FiloSottile/mkcert
