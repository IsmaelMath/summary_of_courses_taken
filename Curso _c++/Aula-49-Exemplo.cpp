// Exemplo ENUM

#include <iostream>

enum Dias_da_semana{Domingo, Segunda, Terca, Quarta, 
                    Quinta, Sexta, Sabado};

// Operator +
Dias_da_semana operator+(Dias_da_semana semana, int i){


    return Dias_da_semana((int(semana) + i)%7);
}



int main(){

    Dias_da_semana semana;

    semana = Segunda;
    semana = semana + 9;
    //semana = Dias_da_semana(int(semana)+1);
    std::cout <<"Dia da semana : "<< semana<<std::endl;

    return 0;
}











