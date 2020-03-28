##
## EPITECH PROJECT, 2017
## Makefile
## File description:
## julien.ollivier@epitech.eu
##

SRC	=	./src/lem_in.c	\
		./src/room/create_room.c	\
		./src/room/rooms_from_file.c	\
		./src/room/link_room.c	\
		./src/room/free_room.c	\
		./src/room/buff.c	\
		./src/room/check_valid_path0.c	\
		./src/parsing/check_anthill.c		\
		./src/parsing/check_ants.c		\
		./src/parsing/check_rooms.c		\
		./src/parsing/check_start_end.c	\
		./src/parsing/check_tunnels.c		\
		./src/parsing/free.c			\
		./src/parsing/load_file.c		\
		./src/parsing/save_rooms_names.c	\
		./lib/my/did_i_end_by.c	\
		./src/display_map_info.c \
		./src/parsing/parsing.c		\
		./src/parsing/is_line_empty.c	\
		./src/algo/pathfunding/found_next_step.c	\
		./src/algo/pathfunding/mouved.c		\
		./src/algo/algo.c	\
		./src/ants/init_ants.c	\

TEST	=	./unit_test/parsing/is_line_valid_test.c		\
		./unit_test/parsing/anthill_ants_test.c		\
		./unit_test/parsing/anthill_room_test.c		\
		./unit_test/parsing/anthill_start_end_test.c	\
		./unit_test/parsing/anthill_tunnel_test.c		\
		./unit_test/parsing/ants_test.c			\
		./unit_test/parsing/room_name_dash_test.c		\
		./unit_test/parsing/room_start_end_test.c		\
		./unit_test/parsing/room_test.c			\
		./unit_test/parsing/save_rooms_names_test.c	\
		./unit_test/parsing/start_end_next_test.c		\
		./unit_test/parsing/start_end_test.c		\
		./unit_test/room/test_check_valid_path.c	\
		./unit_test/room/test_buff.c	\
		./unit_test/room/test_free_room.c	\
		./unit_test/room/test_fill_room.c	\
		./unit_test/room/test_fill_room0.c	\
		./unit_test/room/test_empty_room.c	\
		./unit_test/room/test_rooms_from_file.c	\
		./unit_test/room/test_rooms_from_file0.c	\
		./unit_test/parsing/remove_end_of_line_test.c \
		./unit_test/parsing/check_file_line_test.c \
		./unit_test/parsing/display_map_info_test.c

MAIN	=	./src/main.c  \

OBJ	=	$(SRC:.c=.o)

NAME	=	lem_in

CC	=	gcc $(HEADER) $(GRAPH) $(CDFLAG)

LIB	=	-L./lib/ -lmy

CRITERION	=	-lcriterion --coverage

HEADER	=	-I./include/

CDFLAG	=	-W -Wall -Wextra -pedantic

all:	$(NAME)

$(NAME):	$(OBJ) $(MAIN:.c=.o)
	$(CC) -o $(NAME) $(HEADER) $(MAIN:.c=.o) $(OBJ) $(LIB)

tests_run:	$(OBJ)
	$(CC) -o test $(HEADER) $(SRC) $(TEST) $(LIB) $(CRITERION)
	./test --always-succeed

show_coverage:
	$(CC) $(TEST) $(SRC) $(LIB) -o test $(CRITERION)
	./test --always-succeed
	lcov --directory ./ -c -o rapport.info
	genhtml -o ./report -t "code coverage report" rapport.info
	xdg-open ./report/index.html &>/dev/null

debug:
	$(CC) $(MAIN) $(HEADER) $(SRC) $(LIB) -g3
	gdb ./a.out

valgrind:
	make -C./lib/
	$(CC) $(HEADER) $(MAIN) $(SRC) $(LIB) -g3
	valgrind --leak-check=full ./a.out

clean:
	make clean -C./lib/
	rm -f $(OBJ) $(MAIN:.c=.o) *.gc* map map1 map2 map3
	find -type f -name "*~" -delete -o -type f -name "#*#" -delete
	rm -Rf report rapport.info

fclean: clean
	make fclean -C./lib/
	rm -f $(NAME) a.out test

re:	fclean all
