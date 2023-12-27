/*
Criando um arquivo TXT

1. Biblioteca
2. Open e Close
3. Good

*/

#include <iostream>
#include <fstream>

//std::ofstream nome; -- > Escrever Informação e cria o arquivo se
                        // ele não existir.
//std::ifstream nome; -- > Ler informação

int main(){
    
    std::ofstream arq; // Criação da variável arquivo

    arq.open("teste.txt"); // Abrindo o arquivo

    if (arq.good())
    {
        std::cout<<"Arquivo foi aberto com sucesso!"<<std::endl;
    }
    else{ 
        std::cout<<"Problema na abertura do arquivo!"<<std::endl;
        }
    
    // arq.close(); para fchar o arquivo

    return 0;
}




