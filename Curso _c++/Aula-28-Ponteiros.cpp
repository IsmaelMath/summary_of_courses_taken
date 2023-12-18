/*
Ponteiros:

1. O que é um ponteiro ?

    Ponteiros armazenam endereço de memória

2. Como declarar um ponteiro ?

    Tipo *nome;

    Tipo *Nome_ponteiro = &Nome_variavel

3. Como associar um ponteiro com uma variável ?

    Nome_do_ponteiro = &Nome_variável

4. Como acessar os valores da variável pelo ponteiro ?

    Utilizando o *
    *nome_ponteiro = novo_valor :: Caso eu queira mudar o valor
    ou
    *Nome_ponteiro :: Acessando o valor

*/

#include <iostream>

int main(){
    
    int numero = 10; // Endereço de Memória vai localizar 
                     // nossa variável na memória.
    int *p; // int p* = &numero;
    
    // * --> Conteúdo de ...
    // & --> Endereço de ...
    // *p = 15; tanto p será modificado quanto número

    p = &numero; // Estou fazendo o ponteiro apontar para uma
                 // variavel (uma associação)

    std::cout<<p;


    return 0;
}



