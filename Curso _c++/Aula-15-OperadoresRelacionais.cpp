// Operadores Relacionais

/* O que é ?

    Relação, entre dois termos
    Pergunta, sim(1) ou não(0)

    Operadores:
    1. Maior >              x > y 
    2. Maior e Igual >=     x >= y
    3. Menor <              x < y
    4. Menor e Igual <=     x <= y
    5. Comparação == ou /=  x == y e x /= y

*/

#include <iostream>

int main(){

    int x = 6; // O operador "=" é um operador de atribuição
    
    std::cout<<"X é maior que 15 :: "<<(x>15)<<"\n"; // Comparando

    int y = 15 >= x;

    std::cout<<"Y é menor que x :: "<<y<<"\n"; // Comparando

    return 0;
}


