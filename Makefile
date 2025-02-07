COMPOSE = srcs/docker-compose.yml

.PHONY: all clean

all: clean
	docker-compose -f $(COMPOSE) up --build -d

clean:
	docker-compose -f $(COMPOSE) down
