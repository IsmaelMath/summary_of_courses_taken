/*
Enumerated Types

1. O que são ?
2. Declaração e Inicialização
3. Regras

    - Os nomes seguem as mesma regras de nomes de variáveis
    - Não podemos ter duas variáveis com o mesmo valor
    - Não podemos ter duas variáveis com o mesmo nome,
      mesmo em Enumerated Types diferentes.

4. Utilizando ENUM como int
5. Percorrendo o ENUM

*/

#include <iostream>

enum estacao{primavera, // 0 
             verao,     // 1 
             outono,    // 2 
             inverno};  // 3

int main(){

    estacao ano;
   
    ano = outono;
    std::cout<<ano<<std::endl;

    ano = estacao(3);
    std::cout<<ano;

    return 0;
}





