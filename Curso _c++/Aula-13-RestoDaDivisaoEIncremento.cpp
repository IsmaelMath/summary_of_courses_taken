// Resto da Divisão
#include <iostream>

int main(){

    int a, b, c;

    a = 10;
    b = 3;

    c = 10%2; // Resto da divisão = 1

    std::cout<<"Resto da divisão: "<<c<<"\n";
    
    // Não existe resto de divisão para números floats

    // Como descobrir se um número é inteiro ou não

    if (c > 0)
    {
        std::cout<<"Este número não é inteiro.\n";
        
    }
    else std::cout<<"Esse numero é inteiro.\n";

    // Incremento

        // Variável += Valor = variável + valor
        // Variável -= Valor = variável - valor
        // Variável *= Valor = variável * valor
        // Variável /= Valor = variável / valor
        

    // Adicionando 1 na minha variável c

    c = 25;
    c = c+1;
    c++; 
    
    c+=3;
    std::cout<<c;
    
    return 0;
}





