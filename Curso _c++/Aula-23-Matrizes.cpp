/*
1. O que é uma matriz?

2. Como declarar uma matriz?
    Tipo nome_da_matriz[Linha][coluna]

3. Como preencher uma matriz?

*/

#include <iostream>

int main(){

    /*
    int Matriz_1[2][2] = {1, 2, 3, 4};
    int Matriz_2[2][3] = {10,20, 30, 45, 55, 5};

    int V[5]*/

    int Mat_1[2][2];

    for (int linha = 0; linha < 2; linha++)
    {
        for (int coluna = 0; coluna < 2; coluna++)
        {
            std::cout<<"Mat_1["<<linha<<"]["<<coluna<<"]: ";
            std::cin>>Mat_1[linha][coluna];
        }
        
    }
    
    for (int linha = 0; linha < 2; linha++)
    {
        for (int coluna = 0; coluna < 2; coluna++)
        {
            std::cout<<Mat_1[linha][coluna]<<" ";
        }
        std::cout<<std::endl;
    }
    

    return 0;
}




