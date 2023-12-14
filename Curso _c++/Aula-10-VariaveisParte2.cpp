/* O que é uma variável?

    - Variável armazenar (na memória) informação

*/

/* Tipos de Variáveis (int, float, bool, char, double, ...)

    int    - Tipo inteiro (1, 5, 8);
    float  - Armazena números reais (1.2, 2.5, 3.25); 
    char   - Caracter : Pode ser em forma de String;
    bool   - Valores boleanos (True, False);
    double - Número em forma de disma periodica;

*/

// Declaração de Variáveis (O que fazer e não fazer)

#include <iostream>

int main(){

    // Tipo Nome; -- > Declarar
    int Var1, Var2, Var3 = 45; // Outra forma de declarar variável
    bool Var4 = true;
    int soma;

    // Nome = Valor;
    Var1 = 10;
    Var2 = 15; 

    soma = Var1 + Var2;
    Var4 = Var1 >= Var2; // Na resposta 
    // std::cout<<Nome_da_variavel;
    std::cout<<"A soma dos valores : "<<soma<<"\n";
    std::cout<<"O valor da Var1 é maior que Var2 : "<<Var4<<"\n";

    return 0;
}
/* Atribuições de Valores

    // Nome = Valor;

*/

/* Mostrar Valores Cout (Uma variável e mais de uma)



*/
