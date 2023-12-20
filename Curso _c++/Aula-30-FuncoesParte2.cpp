/*
FUNÇÕES
--------
1. O que é uma função ?

    Um bloco de código, que será executado somente quando chamado.

2. Estrutura de uma função

    Tipod Nome_da_função(Parâmetros){
        bloco de código

        return ...;
    }

3. Função MAIN


4. Exemplo: Função que soma dois números e retorna a soma 
--------
5. Variáveis Globais e Locais
6. Passagem por referência
7. Exemplo: Função soma (Usando passagem por referência)
*/
#include <iostream>
// Variáveis criadas dentro de funções são chamadas Variáveis Locais

void soma(int *numero1, int numero2); // Declarando a função

//int numero = 20;  Variável Global

int main(){

    int n1 = 10; // Variável Local
    int n2 = 15;
    
    soma(&n1, n2); // Chamada da função
    
    std::cout<<n1;
    return 0;
}



// Parâmetros também são considerados variáveis locais
void soma(int *numero1, int numero2){ // Inicializando a função

    // Conteúdo de ...
    *numero1 = *numero1 + numero2;
    
}


