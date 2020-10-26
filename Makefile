# Travis example for Identifier created by Rafael Garibotti

GCCFLAGS = -g -Wall -Wfatal-errors 
ALL = identifier
GCC = gcc

all: $(ALL)

identifier: ./src/identifier.c ./test/TestFoo.c
	#$(GCC) $(GCCFLAGS) -o $@ $@.c
	#$(GCC) $(CFLAGS) -o test_foo.out ./src/identifier.c ./test/TestFoo.c
	gcc -std=c99 -Wall -Wextra -Wpointer-arith -Wcast-align -Wwrite-strings -Wswitch-default -Wunreachable-code -Winit-self -Wmissing-field-initializers -Wno-unknown-pragmas -Wstrict-prototypes -Wundef -Wold-style-definition -Isrc -I./src  ./src/unity.c src/identifier.c  test/TestFoo.c  test/test_runners/TestFoo_Runner.c -o test_foo.out
	./test_foo.out

testunity: ./test/TestFoo.c
	ruby ./auto/generate_test_runner.rb test/TestFoo.c  test/test_runners/TestFoo_Runner.c
	

gcov: ./src/identifier_main.c
	$(GCC) $(GCCFLAGS) -fprofile-arcs -ftest-coverage -o $@ ./src/identifier_main.c
	./cov
	gcov -b identifier_main.c

check: ./src/identifier.c
	cppcheck ./src/identifier.c
	
valgrind: ./src/identifier_main.c
	gcc -g -Wall -Wfatal-errors ./src/identifier_main.c -o ./src/id
	valgrind --leak-check=full --show-leak-kinds=all ./src/id

address: ./src/identifier_main.c
	gcc -g -Wall -Wfatal-errors -fsanitize=address ./src/identifier_main.c -o ./src/test
	./src/test

clean:
	rm -fr $(ALL) *.o cov* *.dSYM *.gcda *.gcno *.gcov

test: all
	bash test
