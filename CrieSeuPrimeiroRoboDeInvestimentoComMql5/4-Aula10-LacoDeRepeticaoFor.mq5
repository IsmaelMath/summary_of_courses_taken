//+------------------------------------------------------------------+
//|                                        10-LacoDeRepeticaoFor.mq5 |
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
  Print("O tamanho do meu array: ", ArraySize(Array)); // Para Identicar 
                                                       // o Tamanho do array
                                                       // ArraySize();
  for(int i=0;i<ArraySize(Array);i++)
    {
     Print("Array[", i,"] = ", Array[i]);
    } 
   
   Print("------------------------");
   for(int i=3;i>=0;i--)
    {
     Print("Array[", i,"] = ", Array[i]);
    } 
  }
//+------------------------------------------------------------------+

/* Laços de Repetição For


for(int Inicializador; Condição_de_parada; Contador)
  {
      código
  }*/
  
double Array[4] = {3.7, 8.1, 7.2, 8.7};   
  
  