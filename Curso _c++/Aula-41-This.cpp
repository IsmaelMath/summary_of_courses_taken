// This : Representa um ponteiro para nossa classe

#include <iostream>

class robot{

    private:

        float Velocidade;
        float posicao_x;
        float posicao_y;

    public:
        
        // Posso declarar o constructor e crialo fora da classe
        robot();

        robot(float v, float x, float y){ // Constructor (Podemos ter mais de um)

            Velocidade = v;
            posicao_x = x;
            posicao_y = y;

        }
        // --------------------------------

        void atribuir_velocidade(float Velocidade){

            //Velocidade = Velocidade;
            this -> Velocidade = Velocidade; // Utilizando o This
        }
        // --------------------------------

        float mostrar_posicao_x(){

            return posicao_x;
        }
        // --------------------------------

        float mostar_posicao_y(){


            return posicao_y;
        }
        // --------------------------------

        float mostrar_velocidade(){

            return Velocidade;

        }
        // --------------------------------

        ~robot(){ // Destructor
            std::cout<<"Tchauu !";
        }
};


robot::robot(){

    Velocidade = 10;
    posicao_x = 4;
    posicao_y = 5;

}



int main(){
    
    robot nanook; // Se eu não colocar parametros no contructor vai 

    nanook.atribuir_velocidade(12);

    std::cout<<nanook.mostrar_velocidade()<<" km/h \n";

    return 0;
}

