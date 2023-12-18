/*
Vetor :

    1. O que é um vetor ?

    2. Como declarar um vetor ?

        std::vector<Tipo> NomeDoVetor(Posição, valor);

    3. Como incializar um vetor ?

            std::vector<Tipo> NomeDoVetor(Posição, Valor);

    
    std::cout<<vec[1];

    4. Como preencher um vetor ?

Métodos :
Nome_Do_Vetor.Método

    push_back(valor)
    pop_back()
    size()

Exercício :

    Ler n números e depois mostrar eles na tela na ordem inversa

*/

#include <iostream>
#include <vector>

int main(){

    std::vector<int> numeros;

    int valor;

    do
    {
        std::cout<<"Digite um número: ";

        std::cin>>valor;

        numeros.push_back(valor);

        std::cout<<"\n(0) Parar: ";
        std::cin>>valor;


    } while (valor != 0);
    

    std::cout<<"Ordem Direta: ";

    for (int indice = 0; indice < numeros.size(); indice++)
    {
        std::cout<<numeros[indice]<<" ";
    }
    
    std::cout<<"\nOrdem inversa: ";

    for (int indice = numeros.size()-1; indice > -1; indice--)
    {
        std::cout<<numeros[indice]<<" ";
    }
    

    return 0;
}