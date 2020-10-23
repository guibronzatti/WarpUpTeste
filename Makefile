# Travis example for Identifier created by Rafael Garibotti

GCCFLAGS = -g -Wall -Wfatal-errors 
ALL = identifier
GCC = gcc

all: $(ALL)

identifier: identifier.c identifier.h TestFoo.c TestFoo_Runner.c
	$(GCC) $(GCCFLAGS) -o $@ $@.c
	gcc -std=c99 unity.c identifier.c  TestFoo.c  TestFoo_Runner.c -o test_foo.out


cov: identifier.c
	$(GCC) $(GCCFLAGS) -fprofile-arcs -ftest-coverage -o $@ identifier.c

clean:
	rm -fr $(ALL) *.o cov* *.dSYM *.gcda *.gcno *.gcov

test: all
	bash test
