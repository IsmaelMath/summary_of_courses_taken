/*
MEMÓRIA

1. Comandos new e Delete;
2. Exemplo: Array;

*/

#include <iostream>

int main(){

    int *p = new int[10]; //Nesse ato estou trabalhando com 10 variáveis do tipo int
    
    for (int i = 0; i < 10; i++)
    {
        p += i; // p += i -- > p = p + i  

        *p = 10 + i;

        p -= i; // p -= i -- > p = p - i
    }
    
    for (int i = 0; i < 10; i++)
    {
        p += i; // p += i -- > p = p + i 

        std::cout<<*p<<" ";
        p -= i; // p -= i -- > p = p - i
    }


    /*
    p = new int;

    *p = 10;

    std::cout<<*p;

    delete p; // nessa ato consigo liberar a memória reservada
    */
    delete p;
    return 0;
}


