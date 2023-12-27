// Estrutura de Repetição (WHILE)

/* O que é uma estrutura de repetição ?

    1. Estrutura WHILE (ENQUANTO)
 
    WHILE(CONDIÇÂO){
        AÇÕES
    }
    Condição 1 ou 0

    2. Loop Finito x Infinito

*/

#include <iostream>

int main(){

    int contador = 5;

    while (contador > 0)
    {
        std::cout<<contador<<std::endl;
        contador--; // contador = contador - 1;
    }
    

    return 0;
}
















