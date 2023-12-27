/*
    Array

        1. O que é um array ?

               0     1     2     3     4     < -- Indice 
            +-----+-----+-----+-----+-----+
            |  2  |  5  |  6  |  8  |  9  |  < -- Array          
            +-----+-----+-----+-----+-----+
        
        2. Como declarar um array ?

            Tipo Nome[Tamanho];

        3. Como inicializar uma array ?

            Tipo Nome[] = {Elemento_1, Elemento_2, Elemento_3, ..., Elemento_5};
        
        4. Como preencher uma array ?

    Exercício:

        Ler N números e depois mostrar eles na tela na ordem inversa ?



*/

#include <iostream>

int main(){

    int V[5]; // Declarando o Array
    
    int V1[] = {2, 5, 6, 8, 10}; // Declarando e inicializando *

    int valor;

    // Declarando de outra forma mais que resulta na mesma forma da anterior
    V[0] = 2;
    V[1] = 5;
    V[2] = 6;
    V[3] = 8;
    V[4] = 10;

    for (int indice = 0; indice < 5; indice++)
    {
            
        std::cout<<"Digite um valor : ";
        std::cin>>valor;

        V[indice] = valor;
    }

    for (int i = 0; i < 5; i++)
    {
        std::cout<<V[i]<<" ";
    }
    
    
    std::cout<<"\n";
    return 0;
}

