# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ikayaalp <ikayaalp@student.42kocaeli.      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/06/24 10:43:49 by ikayaalp          #+#    #+#              #
#    Updated: 2022/06/24 10:43:51 by ikayaalp         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SERVERNAME = server
CLIENTNAME = client
NAME = print.c
SRCSERVER = server.c
SRCCLIENT = client.c
CC = gcc
FLAGS = -Wall -Wextra -Werror
OBJSERVER = $(SRCSERVER:.c=.o)
OBJCLIENT = $(SRCCLIENT:.c=.o)
OBJNAME = $(NAME:.c=.o)

all: $(SERVERNAME) $(CLIENTNAME)

$(NAME) : all

$(SERVERNAME) : $(OBJSERVER)
	$(CC) $(OBJSERVER) -o $(SERVERNAME) $(NAME)

$(CLIENTNAME) : $(OBJCLIENT)
	$(CC) $(OBJCLIENT) -o $(CLIENTNAME) $(NAME)

clean:
	rm -rf $(OBJSERVER) $(OBJCLIENT)

fclean: clean
	rm -rf $(SERVERNAME) $(CLIENTNAME)

re: fclean all

.PHONY : re fclean clean all norm
