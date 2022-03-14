#include <stdio.h>

int main(){ 
 int i, numero; //declaração de variáveis 
 srand(time(NULL)); //faz com que os números não se repitam 
 printf("\033[34m %s \033[0m", "Números gerados:\n");//cor azul  
 for(i=1; i<=6; i++){
  numero = rand() % 61;
  megasena(numero);
 } 
 printf("\n"); 
 return(0);  
}

int megasena(int num){ 
 printf("\033[42m \033[37m%d \033[0m | ",num);//cor fundo verde
}
