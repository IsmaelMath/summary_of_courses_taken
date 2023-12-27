//+------------------------------------------------------------------+
//|                                     04-AdicionarIndicadorIfr.mq5 |
//|                                  Copyright 2023, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2023, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
// ---

// IFR -- RSI
int ifr_Handle; 
double ifr_Buffer[];


//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
   //---
   EventSetTimer(10);
   
   // ---
   ifr_Handle = iRSI(_Symbol, _Period, 7, PRICE_CLOSE);
   
   // ---
   if(ifr_Handle < 0)
     {
      Print("Erro ao carregar handle do indicador - ", GetLastError());
      return -1;
     }
   
   // ---
   ChartIndicatorAdd(0, 1, ifr_Handle);
     
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
   CopyBuffer(ifr_Handle, 0, 0, 3, ifr_Buffer);
   ArraySetAsSeries(ifr_Buffer, true);
   
   Print("Meu indicador RSI: ", ifr_Buffer[0]);
  }
//+------------------------------------------------------------------+
void OnTimer(void)
  {
   
  }
//+------------------------------------------------------------------+
