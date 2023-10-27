all: start

start: down
	@echo ". . . Building & Running docker containers . . ."
	@cd srcs && docker-compose up --build

down:
	@echo ". . . Shut down all docker containers . . ."
	@cd srcs && docker-compose down

remove: down
	@echo ". . . Cleaning inactif docker containers . . ."
	@docker system prune -af
	@rm -rf ~/db/*
	@rm -rf ~/wp/*

status:
	@echo ". . . Docker containers status . . ."
	@docker ps
	@echo ". . . Docker images status . . ."
	@docker images

.PHONY: all start down remove status
