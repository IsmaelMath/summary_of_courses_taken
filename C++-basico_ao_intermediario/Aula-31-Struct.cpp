/*
Struct:

1. O que é uma struct?

    É um Tipo que comporta várias variáveis. (Podendo ser de tipos diferentes)

2. Criando uma struct?

    struct Nome_da_Struct(){

        variáveis;
    }
3. Acessando dados da struct?

4. Exemplo: cadastro de pessoa

*/

#include <iostream>
#include <string>

/*EX1
struct Numeros
{
    int numero1;
    float numero2;
};

int main(){

    // Tipo Nome_da_Variável

    Numeros n, y;

    n.numero1 = 10;
    n.numero2 = 2.4;
    y.numero1 = 15;

    std::cout<<n.numero1;
    
    return 0;
}
*/

struct Cadastro
{
    int idade;
    float peso;
    std::string nome;
};

int main(){

    Cadastro pessoa[10]; // Array nome[tamanho];

    pessoa[0].idade = 20;
    pessoa[0].nome = "Joao";
    pessoa[0].peso = 75;

    pessoa[1].idade = 21;
    
    std::cout<<pessoa[0].nome;

    return 0;
}



