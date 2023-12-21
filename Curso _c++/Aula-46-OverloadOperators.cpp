/* Overload Operators

1. O que são OPERATORS eo que é OVERLOAD ?

    Exemplo: +, <<, -, [], ....
        
        1 + 2 = 3
    
        std::cout<<"...";
        
        std::cin>> ;
        
        1 - 2 = -1
        
        int arr[3];
        
        arr[0] = 1;

    (Tabela)

2. Regras

    - Utilizaremos OVERLOAD OPERATORS com:

        1. Classes
        2. Enumerated Types


*/
#include <iostream>

class A{
    private:

        int valor;

    public:


    int soma(int n, int m, bool print = false){

        int soma;
        soma = n + m;
        if (print)
        {
            std::cout<<"O resultado da soma é: "<<soma<<std::endl;
        }
        
        

        return soma;
    }
};


int main(){
    int opearacao;

    A obj1, obj2; // Vamos aprender como somar: 
                  // valor.obj1 + valor.obj2


    obj1.soma(25, 45);

    opearacao = obj1.soma(12,57, true) - obj2.soma(14, -32);
    std::cout<<"O valor da operação entre funções: "<< opearacao;
    return 0;
}