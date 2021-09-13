

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include "TFG_aes256.h"



int main(){

  unsigned char *text, *key;
  aes256_context context;

  int chunk;

  int size = 0;

  text = malloc(128*sizeof(unsigned char));
  key = malloc(32*sizeof(unsigned char));

  /*
  printf("Introducir texto a codificar: \n");
  scanf("%[^\n]", text);
  size = strlen((const char *)text);
  */

  //Poner siempre '<' para que el bucle cuente el size
<<<<<<< HEAD
  unsigned char *aux = (unsigned char *) "00000000000000000000000000000000<";
=======
  unsigned char *aux = (unsigned char *) "000000000000000000000000<";
>>>>>>> eb43b8913307e747d2bde18f9d96669baf0ca5e0

  while(aux[size] != '<'){
    text[size] = aux[size];
    size += 1;
  }


  //key = (unsigned char *) "QfTjWnZr4u7x!A%D*G-KaPdSgUkXp2s5";
  key = (unsigned char *) "000102030405060708090a0b0c0d0e0f";

  printf("Texto introducido: %s \n", text);

  aes256_init(&context, key);

  chunk = ceil((float)size/16);
  for(int epoch = 0; epoch < 100000; epoch++){
    for(int i = 0; i < chunk; i++){
        aes256_encrypt_ecb(&context, &text[i*16]);
    }
  }

  printf("Texto encriptado: %s \n", text);
  printf("Texto encriptado (decimal): \n");
  for(int i = 0; i < size; i++)
    printf("%d ", text[i]);
  printf("\n");

  printf("Texto encriptado (hexadecimal): \n");
  for(int i = 0; i < size; i++)
    printf("%x ", text[i]);
  printf("\n");

  for(int epoch = 0; epoch < 100000; epoch++){
    for(int i = 0; i < chunk; i++){
        aes256_decrypt_ecb(&context, &text[i*16]);
    }
  }

  printf("Texto descencriptado: %s \n", text);

}
