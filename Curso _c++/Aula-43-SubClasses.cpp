/*
Subclasses (Classe dentro de uma Classe)

1. Criação Subclasse
2. Visibilidade
3. Método Declaração (E se os nome forem iguais ?)
4. Associação subclasse com mais de uma classe

      Mae      Visibilidade        Result
+-------------+-------------+-------------------+
| When the    |When the     |The resulting acess|
|component is |class is     |inside the subclass|
|declared as: |inherited as:|is:                |
+-------------+-------------+-------------------+
|Public       |             |      Public       |
|Protected    |   Public    |    Protected      |
|private      |             |      nome         |  
+-------------+-------------+-------------------+
|Public       |             |    Protected      |
|Protected    |  Protected  |    Protected      | 
|private      |             |      nome         |
+-------------+-------------+-------------------+
|Public       |             |      Private      |    
|Protected    |   Private   |      Private      |
|private      |             |      nome         |
+-------------+-------------+-------------------+
*/

#include <iostream>

class Mae{
    protected: // Consigo acessar atraves dos metodos da subclasses
    
    public:
        void mostrar(){
            std::cout<<"Classe Mae\n";
        }
        
};

// ---------------------------------------------------------------
class Filho: public Mae{

    public:
        void mostrar1(){
            std::cout<<"Classe Filho\n";
        }
};

// ---------------------------------------------------------------
class Filha: public Filho{ // Ex Subclasse da subclasse

    public:
        void mostrar2(){
            std::cout<<"Classe Filha\n";
        }
};

// ---------------------------------------------------------------
int main(){

    
    Mae mae;
    Filho filho;
    Filha filha;
    //obj.mostrar(); // Consigo acessar tanto os métodos da filha como mae
    
    filho.Mae::mostrar(); // Outra forma de acesso

    mae.mostrar(); // Consigo acessar apenas Mae

    filha.mostrar1();
    return 0;
}









