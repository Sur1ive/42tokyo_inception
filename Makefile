COMPOSE = srcs/docker-compose.yml

.PHONY: all

all:
	docker-compose -f $(COMPOSE) up -d

down:
	docker-compose -f $(COMPOSE) down
