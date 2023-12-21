// Ponteiro para o objeto

#include <iostream>

class robot{

    private:

        float Velocidade;
        float posicao_x;
        float posicao_y;

    public:
        
        robot(){

            Velocidade = 10;
            posicao_x = 4;
            posicao_y = 5;

        }
        // --------------------------------

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
            std::cout<<"\nTchauu !\n";
        }
};






int main(){
    /*
    int a;
    int *p;

    p = &a;

    *p = 10;

    std::cout<<a;*/
    /*
    robot *p;

    robot nanook;

    p = &nanook;
    
    // No cado do ponteiro para acessar os métodos da classe 
    // utilizamos -> 
     Ex1
     p-> atribuir_velocidade(25);
     std::cout<<nanook.mostrar_velocidade()<<" km/h";
    */

    /* Ex2
    nanook.atribuir_velocidade(25);
    std::cout<<p->mostrar_velocidade()<<" km/h";
    */
    /* Ex3 
    int *p;

    p = new int;

    *p = 115;

    std::cout<<*p;*/
    
    robot *p;

    // p = new robot; posso usar dessa forma
    // p->atribuir_velocidade(25);
    
    
    p = new robot(12.5, 4, 5);
    
    std::cout<<p->mostrar_velocidade()<<" km/h";

    delete p;

    std::cout<<"\nDepois do Destructor !\n";


    return 0;
}

