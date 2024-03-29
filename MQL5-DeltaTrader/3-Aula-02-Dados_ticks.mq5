//+------------------------------------------------------------------+
//|                                          Aula-02-Dados_ticks.mq5 |
//|                                  Copyright 2023, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2023, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
//|             Identificado do Tick                              |
//+------------------------------------------------------------------+
MqlTick tick;



//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart()
  {
//---
   if(SymbolInfoTick(_Symbol,tick))
     {
         Print("ask :: ", tick.ask, " Bid :: ", tick.bid);
         Print("A hora do ultimo negócio :: ", tick.time);
     }
   
   // Agressão compradora
   if(tick.last>=tick.ask)
        {
         Print("Agressão Compradora");
        }
   // Agressão vendedora
   else if(tick.last<=tick.bid)
        {
         Print("Agressão Vendedora");
        }
   else
     {
      Print("Negócio direto");
     }
     
//+------------------------------------------------------------------+
//|                   Trabalhando com flags                          |
//+------------------------------------------------------------------+ 
     
    Print("Flag do untimo negócio :: ", tick.flags);

    Print("TICK_FLAG_BID :: ", TICK_FLAG_BID);
    Print("TICK_FLAG_ASK :: ", TICK_FLAG_ASK);
    Print("TICK_FLAG_LAST :: ", TICK_FLAG_LAST);
    Print("TICK_FLAG_VOLUME :: ", TICK_FLAG_VOLUME);
    Print("TICK_FLAG_BUY :: ", TICK_FLAG_BUY);
    Print("TICK_FLAG_SELL :: ", TICK_FLAG_SELL);
    
//+------------------------------------------------------------------+
//|                          Bitmasks                                |
//+------------------------------------------------------------------+    
    /*
    int val1 = 1; // 2^0 
    int val2 = 2; // 2^1
    int val3 = 4; // 2^2
    int val4 = 8; // 2^3
    int val5 = 16; // 2^4
    int val6 = 32; // 2^5
    
    FLAG = 4
    */
  }// 
//+------------------------------------------------------------------+
