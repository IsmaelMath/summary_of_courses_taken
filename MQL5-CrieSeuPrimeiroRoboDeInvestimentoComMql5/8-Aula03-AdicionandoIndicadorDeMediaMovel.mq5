//+------------------------------------------------------------------+
//|                          03-AdicionandoIndicadorDeMediaMovel.mq5 |
//|                                  Copyright 2023, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2023, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
// ---


int mm_Handle; // Manipulador
double mm_Buffer[]; // Variável que ira receber os valores do indicador


//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
   // ---
   EventSetTimer(5);
   
   // --- Fazendo o carregamento do indicador.      
   mm_Handle = iMA(_Symbol, _Period, 21, 0, MODE_SMA, PRICE_CLOSE);
   

   
   
   if(mm_Handle < 0)
     {
      Alert("Erro ao carregar handle do indicador - ", GetLastError());
      return -1;
     }   
   
   // --- Adicionando o indicador ao gráfico
   
   ChartIndicatorAdd(0, 0, mm_Handle);  
   
   // ---
   return(INIT_SUCCEEDED);
  }
  
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   //---
   EventKillTimer();
  }
  
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
   // ---
   CopyBuffer(mm_Handle, 0, 0, 3, mm_Buffer);
   ArraySetAsSeries(mm_Buffer, true);
   
   
   //---
   Print("Média Móvel : ", mm_Buffer[1]);
  }
  
//+------------------------------------------------------------------+
//| Trade function                                                   |
//+------------------------------------------------------------------+
void OnTimer()
  {
   
  }
//+------------------------------------------------------------------+
