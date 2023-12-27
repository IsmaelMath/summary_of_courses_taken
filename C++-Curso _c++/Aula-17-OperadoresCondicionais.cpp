// Condicionais

/* O que é uma condição?

    1. IF
    2. ELSE 
    3. ELSE IF

Uma condição permite eu escolher em alguma posibilidade.
Exemplo: Se chover eu levo guarda-chuva
Condição: Chover
Ação: Eu levo o guarda-chuva

Estrutura do IF:
Condição Verdadeira = 1
COndição Falsa = 0
if(Condição){
    Ação
}

Estrutura do ELSE:

-- > Para utilizar o ELSE precisamos do IF
if(Condição){
    Ação
}
else{
    Ação
}

Estrutura do ELSE IF: 

-- > Para utilizar o ELSE IF, precisamos do IF
if(Condição){
    Ação
}
else if(Condição){
    Ação
}
else{
    Ação
}

*/
#include <iostream>

int main(){

    int x = 2;

    // A condição precisa ser verdadeira para o bloco
    // de códigos ser executado
    if (x > 2) 
    {
        std::cout<<"X é maior do que 2.\n";
    }
    else if (x < 2)
    {
        std::cout<<"X é menor do que 2.\n";
    }
    else{
        std::cout<<"X é igual a 2."<<std::endl;
    }
    
    std::cout<<"Fim da estrutura condicional."<<std::endl;

    return 0;
}







