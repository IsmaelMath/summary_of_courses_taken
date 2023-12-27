//+------------------------------------------------------------------+
//|                                           VetoresDeVariaveis.mq5 |
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
  for(int i=0;i<5;i++)
  {
   Print("Minha coordenada vetorial da posição: v_1[", i, "] = ", v_1[i], " \n");
   }
  }
//+------------------------------------------------------------------+

// Vetores de Variáveis - Arrays


int v_1[5] = {1, 2, 3, 4, 5};

// Obs: Prestar atenção a indexação das posições do vetores

 