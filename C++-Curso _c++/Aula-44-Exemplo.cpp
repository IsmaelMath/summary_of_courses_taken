// Exemplo SubClasse

#include <iostream>

class Classe_A
{
    protected:
       
        int A;
    
    public:
        // Utilizando o Método this para classes
        Classe_A(int A){
            this -> A = A;
        }
        
        
        
        void armazenar(int a){

            A = a;
        }
        
        int mostrar(){

            return A;
        }
};

class Classe_B{
    
    protected:
       
        int B;
    
    public:
        // Utilizando o Método this para classes
        Classe_B(int B){
            this -> B = B;
        }
        
       
        
        void Armazenar(int b){

            B = b;
        }

        int Mostrar(){

            return B;
        }


        void B_(){
            std::cout<<"Classe B\n";
        }
};

// -- > Subclasse
class Classe_C : public Classe_A, public Classe_B{
    public:
        Classe_C(int A, int B) : Classe_A(A), Classe_B(B){
            std::cout<<"Classe C..."<<std::endl;
        }
        
        // Classe A, B e C tem o mesmo método mostrar(), qual 
        // tem preferência ?

        void mostraR(){
            std::cout<< "A = "<<Classe_A::mostrar()<<std::endl;
            std::cout<< "B = "<<Classe_B::Mostrar()<<std::endl;
        }


};





int main(){
    Classe_C obj(3, 4);
    
    obj.mostraR();

    
    return 0;
}


