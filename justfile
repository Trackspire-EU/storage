dockerCompose := "docker compose -f docker-compose.development.yml"

install:
    composer install

dev:
    {{dockerCompose}} up

stop:
    {{dockerCompose}} down

build ENV="development":
    docker compose -f docker-compose.{{ENV}}.yml build --pull