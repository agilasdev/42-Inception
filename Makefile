OS=linux

SHELL=bash

# DB_DATA_PATH=

# WEB_DATA_PATH=

all: start

start: down remove #config
	@echo ". . . Building & Running docker containers . . ."
	@cd srcs && docker-compose up

down:
	@echo ". . . Shut down all docker containers . . ."
	@cd srcs && docker-compose down

remove: down
	@echo ". . . Cleaning inactif docker containers . . ."
	@docker image prune -af
	@docker volume prune -af

# config:
# 	@grep "DB_DATA_PATH" srcs/.env
# 	@if [$? -ne 0]; then echo "DB_DATA_PATH=${DB_DATA_PATH}" > srcs/.env fi
# 	@grep "WEB_DATA_PATH" srcs/.env
# 	@if [$? -ne 0]; then echo "WEB_DATA_PATH=${WEB_DATA_PATH}" > srcs/.env fi

status:
	@echo ". . . Docker containers status . . ."
	@docker ps
	@echo ". . . Docker images status . . ."
	@docker images

.PHONY: all start down remove status