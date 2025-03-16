DOCKER_COMPOSE = docker compose
RAILS = docker compose run --rm web rails

.PHONY: up
up:
	$(DOCKER_COMPOSE) up

.PHONY: down
down:
	$(DOCKER_COMPOSE) down

.PHONY: build
build:
	$(DOCKER_COMPOSE) build

.PHONY: setup
setup:
	$(DOCKER_COMPOSE) build
	$(DOCKER_COMPOSE) run --rm web /bin/bash -c "bundle config set --local path vendor/bundle && bundle install"
	$(DOCKER_COMPOSE) run --rm web yarn install

.PHONY: bash
container:
	$(DOCKER_COMPOSE) exec web bash

.PHONY:	db/create
db-create:
	$(DOCKER_COMPOSE) exec web bin/rails db:create

.PHONY:	db/migrate
db-migrate:
	$(DOCKER_COMPOSE) exec web bin/rails db:migrate
