// ----------------------------------------------------------------
// ESPECIFICAÇÃO: O programa deve determinar se um identificador
// é ou não válido. Um identificador válido deve começar com uma
// letra e conter apenas letras ou dígitos. Além disto, deve ter
// no mínimo 1 caractere e no máximo 6 caracteres de comprimento
// ----------------------------------------------------------------

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int valid_s(char ch) {
  if (((ch >= 'A') && (ch <= 'Z')) || ((ch >= 'a') && (ch <= 'z')))
    return 1;
  else
    return 0;
}

int valid_f(char ch) {
  if (((ch >= 'A') && (ch <= 'Z')) || ((ch >= 'a') && (ch <= 'z')) || ((ch >= '0') && (ch <= '9')))
    return 1;
  else
    return 0;
}

int funcTeste(char *teste) {
  char achar;
  int valid_id,tamanho,i;
  printf("Identificador: ");

  tamanho = strlen(teste);
  achar = teste[0];
  valid_id = valid_s(achar);
  achar = teste[0];
  
  for(i=0;i<=tamanho;i++) {
    if(!(valid_f(achar))) {
      valid_id = 0;
    }
    achar = teste[i];
    i++;
  }
  if (valid_id && (tamanho >= 1) && (tamanho <= 6)) {
    printf("Valido\n");
    return 0;
  }
  else {
    printf("Invalido\n");
    return 1;
  }
}
