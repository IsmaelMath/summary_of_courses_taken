//+------------------------------------------------------------------+
//|                                               Aula-12-Arrays.mq5 |
//|                                  Copyright 2023, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2023, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart()
  {
//---
      // Definição
      // Acesso a elementos
      // Indexação -- > Só funciona para arrays dinamâmicos

//+------------------------------------------------------------------+
//| ARRAYS ESTÁTICOS QUANTIDADE DE ELEMENTOS NÃO MUDA                |
//+------------------------------------------------------------------+      
      // Sequência indexação de valores
      
      int my_arrays[6] = {8, 4, 7, 1, 9, 3};
      Print("O teceiro elemento do meu array é igual :: ", my_arrays[2]);
      Print("O quinto elemento do meu array é igual :: ", my_arrays[4]);
      
      
      
//+------------------------------------------------------------------+
//| ARRAYS DINÂMICOS  Quantidade de elementos não muda               |
//+------------------------------------------------------------------+  
      int new_arrays[];
      ArrayResize(new_arrays, 6);
      
      
       new_arrays[0] = 8;
       new_arrays[1] = 4;
       new_arrays[2] = 7;
       new_arrays[3] = 1;
       new_arrays[4] = 9;
       new_arrays[5] = 3;
      
      // Função que inverte a indexação de um array
      ArraySetAsSeries(new_arrays, true);
      
      Print("Invertendo a ordem do meu array :: ", new_arrays[0]);  
  }   
  
//+------------------------------------------------------------------+
