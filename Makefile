# Travis example for Identifier created by Rafael Garibotti

GCCFLAGS = -g -Wall -Wfatal-errors 
ALL = identifier
GCC = gcc

all: $(ALL)

identifier: identifier.c identifier.h TestFoo.c  TestFoo_Runner.c
	$(GCC) $(GCCFLAGS) -o $@ $@.c

cov: identifier.c
	$(GCC) $(GCCFLAGS) -fprofile-arcs -ftest-coverage -o $@ src/identifier.c

clean:
	rm -fr $(ALL) *.o cov* *.dSYM *.gcda *.gcno *.gcov

test: all
	bash test
