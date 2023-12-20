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



/*EX1
#include <iostream>

// Área de criação da função
// Tipo nome(parâmetro){bloco de código}

int soma(int a, int b){

    int soma_numeros;

    

    soma_numeros = a + b;

    return soma_numeros;
}




int main(){

    int a, b;

    std::cout<<"Informe o valor de a: ";
    std::cin>>a;

    std::cout<<"\nInforme o valor de b: ";
    std::cin>>b;

    std::cout<<std::endl<<"O valor da Operação: "<<soma(a, b)<<"\n";

    return 0;
}*/

// EX2
#include <iostream>

// Funções Void() são funções que não possui nenhum tipo de retorno

// Forma de declarar uma função
void menu1();
void menu2();

void menu2(){

    std::cout<<"MENU 1 :"<<std::endl;
    std::cout<<"1.  Bomba R$ 5,00 "<<std::endl<<"2. Pastel R$ 4,50 "<<std::endl;

}

void menu1(){


    menu2();

    std::cout<<"MENU 2 : "<<std::endl;
    std::cout<<"3. Suco R$ 2,50"<<std::endl<<"4. Bolo recheado R$ 3,50"<<std::endl;

}

int main(){

    
    menu1();

    return 0;
}