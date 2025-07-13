COMPOSE = srcs/docker-compose.yml
WP_DATA_DIR = ~/data/wordpress
DB_DATA_DIR = ~/data/mariadb

.PHONY: up down re

up:
	mkdir -p $(WP_DATA_DIR)
	mkdir -p $(DB_DATA_DIR)
	docker-compose -f $(COMPOSE) up --build -d

down:
	docker-compose -f $(COMPOSE) down

re: down up
