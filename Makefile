# Travis example for Identifier created by Rafael Garibotti

GCCFLAGS = -g -Wall -Wfatal-errors 
ALL = identifier
GCC = gcc

all: $(ALL)

identifier: ./src/identifier.c ./test/TestFoo.c
	#$(GCC) $(GCCFLAGS) -o $@ $@.c
	#$(GCC) $(CFLAGS) -o test_foo.out ./src/identifier.c ./test/TestFoo.c
	gcc -std=c99 -Wall -Wextra -Wpointer-arith -Wcast-align -Wwrite-strings -Wswitch-default -Wunreachable-code -Winit-self -Wmissing-field-initializers -Wno-unknown-pragmas -Wstrict-prototypes -Wundef -Wold-style-definition -Isrc -I./src  ./src/unity.c src/identifier.c  test/TestFoo.c  test/test_runners/TestFoo_Runner.c -o test_foo.out
	ruby ./auto/generate_test_runner.rb test/TestFoo.c  test/test_runners/TestFoo_Runner.c



cov: identifier.c
	$(GCC) $(GCCFLAGS) -fprofile-arcs -ftest-coverage -o $@ identifier.c

clean:
	rm -fr $(ALL) *.o cov* *.dSYM *.gcda *.gcno *.gcov

test: all
	bash test
