/*

Criação do Objeto

1. Declaração

    Nome_da_classe Nome_objeto;

2. Utilizar Atributos


3. Utilizar Métodos

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

        saldo = 0;
        saldo += valor; // saldo = saldo + valor

    }

    void Transferencia(float valor); // Declaração
};

// Nome_da_Classe::Nome_da_funcao(parametros){}
void Conta_banco::Transferencia(float valor)
{
    saldo -= valor;

}

int main(){

    Conta_banco cliente;

    cliente.marcador = 10;
    //std::cout << cliente.visualizar_saldo();

    cliente.depositar(50.42);
    cliente.Transferencia(32.09);
    std::cout<<"Meu saldo atual: R$ "<<cliente.visualizar_saldo()<<std::endl;

    return 0;
}
