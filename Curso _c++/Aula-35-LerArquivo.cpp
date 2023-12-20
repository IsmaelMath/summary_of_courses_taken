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

    Cadastro pessoa;
    std::ifstream arq("teste.txt");

    
    if (arq.good())
    {
        std::cout<<"Arquivo aberto com sucesso! ";
    }
    else{
        std::cout<<"Houve algum problema na abertura do arquivo";
    }
    
    //arq >> pessoa.nome >> pessoa.idade ; // Precisa saber como a frase está estruturada
    //getline(arq, pessoa.nome);

    //std::cout << pessoa.nome <<" " << pessoa.idade<<" " <<pessoa.peso<<" \n";
    
    while (arq >> pessoa.idade)
    {
        getline(arq, pessoa.nome);
        
        std::cout << pessoa.nome<< " " << pessoa.idade << std::endl;
    }
    
    arq.close();
    return 0;
}