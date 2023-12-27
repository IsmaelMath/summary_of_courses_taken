/*
1. O que é String?
2. Como declarar um String?
3. Como inicializar uma string ? (Duas Formas) 

    std::string Nome_da_string = "INFORMAÇÃO";
    std::string Mome_da_string("INFORMAÇÃO");

4. Como associar alguma informação a String ? (=, + =+)

    Nome_da_string = "INFORMAÇÃO";

5. Como recever uma String ? (getline)
6. Alguns Métodos

    Compare; 
    Size;
    Substr;
    Find (string::npos);
    append;
*/
#include <iostream>
#include <string>

int main(){
    /*
    std::string frase3, frase1 = "Data de Nascimento : 19/04/1998\n"; // declarando/Inicializar uma string
    std::string frase2 = "Nome : Ismael Batista \n";
    
    frase3 = "Brasileiro\n";
    frase1 += frase2;
    std::cout << frase3 + frase1;
    */
    
    //std::string frase;
    //int a;

    /* Não podemos usar cin para fazer o print dá frase digitada
    std::cout<<"Digite uma franse: ";
    std::cin>>frase;
    std::cout<<"\n"<<frase;
    */

    /*
    std::cout<<"Digite uma franse grande: ";
    getline(std::cin,frase); // Forma correta de lidar com string
    std::cout<<frase;
    */

    /*
    std::string senha1, senha2;

    std::cout<<"Digite a senha: ";
    getline(std::cin, senha1);

    std::cout<<"Repita a senha: ";
    getline(std::cin, senha2);

    if (senha2.compare(senha1) == 0)
    {
        std::cout<<"Senha cadastrada com sucesso.";
    }
    else
    {
        std::cout<<"Senha não são iguais.";
    }
    */

    
    std::string frase = "Abacaxi Morango Manga";
    /*
    std::cout<<frase.size()<<"\n"; // Verificando o tamanho da string

    std::cout<<frase.substr(0,7)<<"\n"; // frase.substr(inicio, Q_caracter);

    std::cout<<frase.find("xi")<<"\n";
    
    int indice;

    indice = frase.find("a");

    if (indice == std::string::npos)
    {
        std::cout<<"Elemento não encontrado";

    }
    else{
        std::cout<<indice;
    }
    */

    std::cout<<frase<<"\n";

    frase.append(" Limão");

    std::cout<<frase;

    return 0;
}














