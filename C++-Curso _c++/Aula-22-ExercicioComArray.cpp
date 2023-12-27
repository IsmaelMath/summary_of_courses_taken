/*

Exercício:

    Ler N números e depois mostrar eles na tela na ordem inversa ?
        
        1. Ler n números;
        2. Mostrar na Tela;
        3. Mostrar na ordem inversa.

*/

#include <iostream>

int main(){

    int n; // Declarando o Array

    std::cout<<"Informe a quantidade de números: ";
    std::cin>>n;

    int numeros[n];


    for (int indice = 0; indice < n; indice++)
    {
        std::cout<<"Números["<<indice<<"]: ";    
            
        std::cin>>numeros[indice];
    }

    for (int i = 0; i < n; i++)
    {
        std::cout<<numeros[i]<<" ";
    }
    
     std::cout<<"\n";
     
    for (int i = n-1; i > -1; i--)
    {
        std::cout<<numeros[i]<<" ";
    }
    
    
   
    return 0;
}

