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
	@echo "${bold}init${end}         -> init environment."
	@echo "${bold}start${end}        -> start environment."
	@echo "${bold}stop${end}         -> stop environment."
	@echo "${bold}update${end}       -> update docker images."
	@echo "${bold}logs${end}         -> inspect containers logs."

## initialize project
init:
	cp .env.example .env

## start dev
start:
	$(MAKE) stop
	docker-compose up -d
	$(MAKE) logs

## stop dev
stop:
	docker-compose down

## update docker images
update:
	$(MAKE) stop
	docker-compose pull
	$(MAKE) start

## logs containes
logs:
	docker-compose logs -f

