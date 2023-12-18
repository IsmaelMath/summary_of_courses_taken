// Estrutura de Repetição (DO WHILE)

/*

1. Estrutura do "DO...WHILE" (Faça....Enquanto)
    do{
        Ação/Ação

    }while(Condição);



    2. Diferença (DO...WHILE) x (WHILE) 

*/
#include <iostream>

int main(){
    /*EX1
    int contador = 5;

    do{
    
        std::cout<<contador<<std::endl;
        contador--;
    
    } while (contador > 0);*/
    
    /*EX2
    int numero;

    do
    {
        std::cout<<"Digite um número inteiro (maior do que 0): "<<std::endl;
        std::cin>>numero;

    } while (numero<0);*/
    
    int numero = -1;
    
    // Nesse exemplo a estrutura nem inicializa por que a variavel foi
    // declarada mais não foi inicializada com atribuição de valores.
    while (numero<0)
    {
        std::cout<<"Digite um número inteiro (maior do que 0): ";
        std::cin>>numero;

    }
    

    return 0;
}
















