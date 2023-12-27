/*

-- > Estrutura de uma Classe :

    * Exemplo: Conta Bancária
    -- > Classe: Conta_banco
    -- > Métodos: visualizar_saldo(), depositar(), Transferencia(), ....
    -- > Atributos: saldo, nome, senha, .... 

1. Declaração
2. Marcadores (Public e Private)
3. Atributos
4. Método (Criando dentro e fora da classe)
5. Exemplo

*/

#include <iostream>
#include <string>


class Conta_banco
{
private:
    
    float saldo;
    std::string nome;
    std::string senha;

public:
    int marcador;
    
    float visualizar_saldo(){


        return saldo;
    }

    void depositar(float valor){


    }

    void Transferencia(float valor); // Declaração
};

// Nome_da_Classe::Nome_da_funcao(parametros){}
void Conta_banco::Transferencia(float valor)
{


}


