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
    /* Ex1
    std::vector<int> vec(3,0); // Vec(0, 0, 0)

    std::cout<<vec[1]; // Acessando a posição do vetor
    */

    /*Ex2
    std::vector<int> vec(2, 12);
    
    std::cout<<vec.size()<<std::endl;
    vec.push_back(23); // Método adciona elemento a ultima posição

    std::cout<<vec[2];
    */

    std::vector<int> vec;
    int valor;

    for (int indice = 0; indice < 5; indice++)
    {
        std::cout<<"Digite um valor : ";
        std::cin>>valor;

        vec.push_back(valor); 
    }
    
    std::cout<<"\nTamanho do Vetor: "<<vec.size()<<std::endl;
    std::cout<<"Elemento do vetor: ";

    for (int indice = 0; indice < vec.size(); indice++)
    {   
        std::cout<<vec[indice]<<" ";
    }
    std::cout<<std::endl;
    return 0;
}





