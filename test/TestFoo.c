#include "identifier.h"
#include "unity.h"
#include <stdio.h>

void test_warmpUp1(void)
{
  char teste[6] = "sabcgg";
  TEST_ASSERT_EQUAL_INT(0, funcTeste(teste));
}

void test_warmpUp2(void)
{
  char teste[7] = "ssabcgg";
  TEST_ASSERT_EQUAL_INT(1, funcTeste(teste));
}

void test_warmpUp3(void)
{
  char teste[0] = "";
  TEST_ASSERT_EQUAL_INT(1, funcTeste(teste));
}

void test_warmpUp4(void)
{
  char teste[6] = "abc101";
  TEST_ASSERT_EQUAL_INT(0, funcTeste(teste));
}

void test_warmpUp5(void)
{
  char teste[3] = "abc";
  TEST_ASSERT_EQUAL_INT(0, funcTeste(teste));
}

void test_warmpUp6(void)
{
  char teste[4] = "12bd";
  TEST_ASSERT_EQUAL_INT(0, funcTeste(teste));
}



