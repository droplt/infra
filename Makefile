.PHONY: help

end = \033[0m
bold = \033[1m
light = \033[37m
dark = \033[90m
ts := $(shell /bin/date "+%Y-%m-%d--%H-%M-%S")

help:
	@echo "${light}██████╗ ██████╗  ██████╗ ██████╗ ██╗  ████████╗${end}"
	@echo "${light}██╔══██╗██╔══██╗██╔═══██╗██╔══██╗██║  ╚══██╔══╝${end}"
	@echo "${light}██║  ██║██████╔╝██║   ██║██████╔╝██║     ██║   ${end}"
	@echo "${light}██║  ██║██╔══██╗██║   ██║██╔═══╝ ██║     ██║   ${end}"
	@echo "${light}██████╔╝██║  ██║╚██████╔╝██║     ███████╗██║   ${end}"
	@echo "${light}╚═════╝ ╚═╝  ╚═╝ ╚═════╝ ╚═╝     ╚══════╝╚═╝   ${end}"
	@echo ""
	@echo "${dark}Please use '${bold}make <target>${end}${dark}' where ${bold}<target>${end}${dark} is one of:${end}"
	@echo ""
	@echo "${bold}start${end} -> start infra."
	@echo "${bold}stop${end}  -> stop infra."
	@echo "${bold}logs${end}  -> watch infra logs."

## start infra
start:
	docker-compose pull
	docker network create droplt || true
	docker-compose up -d

## stop infra
stop:
	docker-compose down

## watch infra logs
logs:
	docker-compose logs -f

