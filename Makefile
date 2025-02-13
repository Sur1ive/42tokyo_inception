COMPOSE = srcs/docker-compose.yml

.PHONY: up down re

up:
	docker-compose -f $(COMPOSE) up --build -d

down:
	docker-compose -f $(COMPOSE) down

re: down up
