all: up

# .env

$(shell test -f .env || cp .env.example .env)
include .env

# setup

.PHONY: docker-network
docker-network:
	@docker network create reverse-proxy 2> /dev/null || exit 0

.PHONY: certs
certs: traefik/certs/$(BASE_HOST).*.pem
traefik/certs/dev.localhost.*.pem:
	mkcert \
		-cert-file ./traefik/certs/$(BASE_HOST).cert.pem \
		-key-file ./traefik/certs/$(BASE_HOST).key.pem \
		$(BASE_HOST) "*.$(BASE_HOST)"

.PHONY: setup
setup: docker-network certs

# traefik

.PHONY: up
up: setup
	docker-compose up -d

.PHONY: restart
restart:
	docker-compose restart

.PHONY: down
down: whoami-down
	docker-compose down

# whoami

.PHONY: whoami-up
whoami-up: up
	docker-compose -f whoami/docker-compose.yml up -d

.PHONY: whoami-restart
whoami-restart:
	docker-compose -f whoami/docker-compose.yml restart

.PHONY: whoami-down
whoami-down:
	docker-compose -f whoami/docker-compose.yml down
