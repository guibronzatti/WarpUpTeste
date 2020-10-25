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

testuni: ./test/TestFoo.c
	ruby ./auto/generate_test_runner.rb test/TestFoo.c  test/test_runners/TestFoo_Runner.c
	

cov: ./src/identifier_gcov.c
	$(GCC) $(GCCFLAGS) -fprofile-arcs -ftest-coverage -o $@ ./src/identifier_gcov.c
	./cov
	gcov -b identifier_gcov.c

check: ./src/identifier.c
	cppcheck ./src/identifier.c
	
valgrind: ./src/identifier_valgrind.c
	gcc -g -Wall -Wfatal-errors identifier_valgrind.c -o id
	valgrind --leak-check=full --show-leak-kinds=all ./id

address: ./src/identifier_valgrind.c
	gcc -g -Wall -Wfatal-errors -fsanitize=address identifier_valgrind.c -o test
	./test

clean:
	rm -fr $(ALL) *.o cov* *.dSYM *.gcda *.gcno *.gcov

test: all
	bash test
