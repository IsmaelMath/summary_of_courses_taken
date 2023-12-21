/*
Constructor e Destructor

1. Constructor (Sem parâmetros, Com parâmetros)

    Nome_da_Classe(){
        Mensagem
    }
2. Destructor;

*/


#include <iostream>

class robot{

    private:

        float Velocidade;
        float posicao_x;
        float posicao_y;

    public:
        
        // Posso declarar o constructor e crialo fora da classe
        robot();
        /*
        robot(){ // Exemplo de constructor
            Velocidade = 10;
            posicao_x = 4;
            posicao_y = 5;
        }*/


        robot(float v, float x, float y){ // Constructor (Podemos ter mais de um)

            Velocidade = v;
            posicao_x = x;
            posicao_y = y;

        }
        void atribuir_velocidade(float velo);
        
        float mostrar_posicao_x(){



            return posicao_x;
        }

        float mostar_posicao_y(){


            return posicao_y;
        }

        float mostrar_velocidade(){


            return Velocidade;
        }
        ~robot(){ // Destructor
            std::cout<<"Tchauu !";
        }
};
robot::robot(){

    Velocidade = 10;
    posicao_x = 4;
    posicao_y = 5;

}

void robot::atribuir_velocidade(float velo){

    Velocidade = velo;
}




int main(){
    
    robot nanook; // Se eu não colocar parametros no contructor vai 
                           // aparecer o que já definimos no primeiro constructor

    /*nanook.atribuir_velocidade(10); // Chamando o método atribuir_velocidade();
    */
    std::cout<<nanook.mostrar_velocidade()<<" km/h\n"; // Chamando o método mostrar_velocidade();

    std::cout<<nanook.mostrar_posicao_x()<<" km \n";

    return 0;
}














