NAME		= inception
SRCS		= ./srcs
COMPOSE		= $(SRCS)/docker-compose.yml
HOST_URL	= pibosc.42.fr


all: $(NAME)

$(NAME): up

up: create_dir
	@sudo hostsed add 127.0.0.1 $(HOST_URL)
	@docker compose -p $(NAME) -f $(COMPOSE) up --build || (echo " $(FAIL)" && exit 1)

down:
	@docker compose -p $(NAME) down

create_dir:
	@mkdir -p ~/data/database
	@mkdir -p ~/data/wordpress_files

logs:
	docker logs nginx
	docker logs mariadb
	docker logs wordpress
	docker logs redis

status:
	docker ps -a
	docker image ls
	docker volume ls
	docker network ls --filter "name=$(NAME)_all"

clean:
	docker stop nginx ; \
	docker stop mariadb ; \
	docker stop wordpress ; \
	pwd

fclean: down clean
	sudo rm -rf ~/data
	docker volume rm inception_database
	docker volume rm inception_wordpress_files
	docker system prune -af


re: fclean all

.PHONY: all logs clean fclean re