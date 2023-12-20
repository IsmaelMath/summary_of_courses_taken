// Escrevendo no arquivo

#include <iostream>
#include <fstream>
#include <string>

struct Cadastro
{
    int idade;
    float peso;
    std::string nome;
};

int main(){

    std::string msg, msg2;
    int a = 25;
    msg = "Ismael Batista";
    msg2 = "Quant finance";
    msg = "teste.txt";

    std::ofstream arq(msg.c_str());

    
    if (arq.good())
    {
        std::cout<<"Arquivo aberto com sucesso! ";
    }
    else{
        std::cout<<"Houve algum problema na abertura do arquivo";
    }
    
    // Escrever no arquivo: Nome_variável << valor/mensage;

    /* Primeira forma de escrever no arq
    arq << "Meu Primeiro texto"<<std::endl;
    arq << "em um arquivo."<<std::endl;
    arq << 10 <<std::endl;
    */

    Cadastro pessoa;

    pessoa.nome = "Ismael";
    pessoa.idade = 16;
    pessoa.peso = 75;

    arq << "Nome: " << pessoa.nome << "\nIdade: " << pessoa.idade << " anos\nPeso: " << pessoa.peso<<" kg";
    
    
    arq.close();
    return 0;
}