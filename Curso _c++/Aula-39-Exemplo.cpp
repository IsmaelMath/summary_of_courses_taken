/*

-- > Classe que representa um robô

    * Atributos: Velocidade, Posição x, Posição y
    * Métodos: Atribuir_velocidade, mostrar_posição 

*/

#include <iostream>

class robot{

    private:

        float Velocidade;
        float posicao_x;
        float posicao_y;

    public:

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
};

void robot::atribuir_velocidade(float velo){

    Velocidade = velo;
}




int main(){
    robot nanook;

    nanook.atribuir_velocidade(10); // Chamando o método atribuir_velocidade();

    std::cout<<nanook.mostrar_velocidade(); // Chamando o método mostrar_velocidade();

    return 0;
}









