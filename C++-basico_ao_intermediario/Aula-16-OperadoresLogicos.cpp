// Operadores Lógicos

/* O que é ? Oegunta, 1 ou 0

    1. AND &&
    2. OR  ||
    3. NOT !

Tabela da Verdade AND

 A AND B -> S

 A  B  S
 0  0  0
 0  1  0
 1  0  0
 1  1  1
AND : Os dois termos precisam ser 1 para a saída/resultado ser 1 

Tabela da Verdade OU

 A OU B -> S

 A  B  S
 0  0  0
 0  1  1
 1  0  1
 1  1  1
OR : Se pelo menos um dos termos forem 1, a saída será 1

Tabela da Verdade NOT

 not A -> S

 A  S
 0  1
 1  0
 

*/

#include <iostream>

int main(){

    // Operador AND &&
    std::cout<<"Operador AND (&&) :"<<"\n";
    std::cout<<(0 && 0)<<"\n";
    std::cout<<(0 && 1)<<"\n";
    std::cout<<(1 && 1)<<"\n";


    // Operador OU ||
    std::cout<<"Operador OU (||) :"<<"\n";
    std::cout<<(0 || 0)<<"\n";
    std::cout<<(0 || 1)<<"\n";
    std::cout<<(1 || 1)<<"\n";

    // Operador OU !
    std::cout<<"Operador NOT (!) :"<<"\n";
    std::cout<<(!0)<<"\n";
    std::cout<<(!1)<<"\n";


    return 0;
}

