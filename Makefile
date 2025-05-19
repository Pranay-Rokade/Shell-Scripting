DOCKER_COMPOSE := docker-compose

OS := $(shell uname -s)

build:
	ifeq ($(OS),Linux)
		@echo "Running in $(OS)"
		$(DOCKER_COMPOSE) build
	endif

	ifeq ($(OS),Windows_NT)
		@echo "Please Add windows commands"
	endif

up:
	$(DOCKER_COMPOSE) up -d

down:
	$(DOCKER_COMPOSE) down

clean:
	$(DOCKER_COMPOSE) rm -f
	docker system prune -f