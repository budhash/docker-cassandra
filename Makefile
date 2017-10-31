##################################################################

# This makefile is just a convenience over docker-compose

######################### DEFINITIONS ############################

.DEFAULT_GOAL := help

ifeq ($(DC),)
	DC	 := docker-compose
endif

ifeq ($(CF),)
	CF	 := ./docker-compose.yml
endif

######################## COMMANDS ###########################

.PHONY: up down start stop restart status reset portainer help

up: 
	@ $(DC) -f $(CF) up &

down:
	@ $(DC) down

restart:
	@ $(DC) restart

start:
	@ $(DC) start

stop:
	@ $(DC) stop

status:
	@ $(DC) ps
	@ $(DC) top

reset:
	@ $(DC) down
	@ rm -rf ./.cache
	@ mkdir ./.cache

portainer:
	@ open http://localhost:10001

help:
	@ echo "Usage	:  make <target>"
	@ echo "Targets :"
	@ echo "   up ........... initialize the cassandra cluster"
	@ echo "   down ......... tear-down cassandra cluster"
	@ echo "   start ........ starts all stopped services"
	@ echo "   stop ......... stops all services"	 		
	@ echo "   restart ...... restarts the cluster" 
	@ echo "   status ....... container status" 
	@ echo "   reset ........ tear-down cassandra cluster and remove volume data" 	
