//+------------------------------------------------------------------+
//|                                          Robô estudo de Candles  |
//|                                  Copyright 2023, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2023, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
// ---

MqlRates CandlesTick[]; // Declarando a Variável CandlesTick




//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
//---
   EventSetTimer(10);
   
   
   CopyRates(_Symbol, _Period, 0, 10, CandlesTick); // Inicializando
   // a Variável CandlesTick[] para capitura dos valores de preço.
   
   ArraySetAsSeries(CandlesTick, true); // Função responsavel para 
   // Ordenar os valores da posição do array
   
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//---
   
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
//---
   
  }
//+------------------------------------------------------------------+
//| Trade function                                                   |
//+------------------------------------------------------------------+
void OnTimer()
  {
   //---
   int indice = 2;   
   
   Print("| Open : ",  CandlesTick[indice].open, 
         "| High : ",  CandlesTick[indice].high,
         "| Low : ",   CandlesTick[indice].low, 
         "| Close : ", CandlesTick[indice].close);
   Print("Tamanho do candle : ", ArraySize(CandlesTick));
  }
//+------------------------------------------------------------------+
