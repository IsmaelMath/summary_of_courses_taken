/*
FRIEND

1. O que é o "Friend" ?
2. Declaração do Friend
3. Regras:
    - Uma classe pode ser amiga de diversas classes
    - Uma classe pode ter Diversos amigos
    - Um amigo do meu amigo não é meu amigo
    - Amizade não é passado com a herança (subclasse).

4. FUNÇÂO E MÉTODO AMIGOS

*/

#include <iostream>

class A{

    friend class B;

    friend class C;
    friend void associar(A *a);
    private:
        int Valor;
    
    protected:
        void mostrar(){
            std::cout <<"Mensagem protegida. Valor = " <<Valor <<std::endl;
        }


};

class C{
    public:
        void decrementar(A *a);

};

void C::decrementar(A *a){
    a -> Valor --;
}

class B{
    friend class C;
    public:
        void mostrar(A *a){
            a -> mostrar();
            //std::cout<<a -> Valor;
        }

};

void associar(A *a){
    a -> Valor = 99;
}


int main(){

    A a;
    B b;
    C c;

    associar(&a);

    b.mostrar(&a);
    c.decrementar(&a);
    b.mostrar(&a);


    return 0;
    
}


