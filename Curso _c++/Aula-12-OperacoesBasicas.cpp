// Operações Básicas 
/*
    1. Adição +
    2. Subtração -
    3. Multiplicação *
    4. Divisão / 

    (Obs 1: INT e FLOAT em operações)
    (Obs 2: CAST)

*/

#include <iostream>

int main(){

    int Soma, Var1 = 7, Var2 = 2;
    float Divisao;

    Var1 = Var1 - Var2; // Resultado = -1

    Soma = Var1 + Var2 * Var1;
    
    Divisao = (float)Var1 / Var2; // Utilizando o conseito de cash explícito

    // Não existe divisão por 0
    // Operações INT e INT resulta em um INT
    // Operações INT e FLOAT resulta em FLOAT
    //Operações em FLOAT e FLOAT resulta em FLOAT


    std::cout<<"Resultado da operação Var1 = "<<Var1<<"\n";
    
    std::cout<<"Resultado da operação soma = "<<Soma<<"\n";
    
    std::cout<<"Resultado da operação Divisão = "<<Divisao<<"\n";

    return 0;
}



