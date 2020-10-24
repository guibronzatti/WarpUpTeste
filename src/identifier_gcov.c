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

int main(void){
  char teste1[6] = "sabcgg";
  char teste2[7] = "ssabcgg";
  char teste3[0] = "";
  char teste4[6] = "abc101";
  char teste5[3] = "abc";
  char teste6[4] = "12bd";
  funcTeste(teste1);
  funcTeste(teste2);
  funcTeste(teste3);
  funcTeste(teste4);
  funcTeste(teste5);
  funcTeste(teste6);
  
  return 0;
}