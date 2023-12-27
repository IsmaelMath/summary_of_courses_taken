/* Classes e Operators

1. Como utilizar um OPERADOR com uma classe?

    - Método (Dentro e Fora da classe)
    - Função


*/

#include <iostream>


class Add{
    private:

        int Num;
        int A; 
        int B;

    public:
  
        Add(){
            Num = 0;
            A = 0;
            B = 0; 
        }
        
        
        void add(int i){

            Num += i; // Num = Num + i
            A = Num * 2;
            B = Num * 3;

        }

        void dec(int i){
            Num -= i; // Num = Num - i
        }

        // Obj + i -- > num = num+i; obj+1+2, é possível? 
        /*
        void operator+(int i){

            // num+=i;
            add(i);
        }*/
        
        // ob[i] -- > i = 0, retorna A. i = 1, retorna B.
                // Declarar fora da classe 
        //int HOperator[](int i); // Verificar porque está dando errado

        // obj + i -- > retorna o obj, obj+1+2 é possível ?
        Add& operator+(int i){ // Add& ele aponta para indereço
            // num+=i;
            add(i);
            return *this; 
        } // *this ele aponta para o objeto


        void mostrar(){

            std::cout <<"num = " <<Num <<std::endl;
        }

};

/*
int Add::HOperator[](int i){
    if (i == 0)
    {
        return A;
    }
    else if (i == 1)
    {
        return B;
    }
    else
    {
        return 0;
    }
    
}*/

// Criar uma função que chama o método Dec
void operator-(Add obj, int i){
    obj.dec(i);
}




// Não podemos somar algo com métodos de classe e funções sem retorno.

int main(){

    Add obj;

    obj-1;
    obj-2;

    obj.mostrar();


    return 0;
}




// Resumo Inacabado, verificar erros!

