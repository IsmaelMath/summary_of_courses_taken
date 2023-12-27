//+------------------------------------------------------------------+
//|                                          01-IntroducaoASecao.mq5 |
//|                                  Copyright 2023, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2023, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"


// --- Declarando Variáveis

MqlRates CandlesTicks[];

MqlTick Ticks;

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
//---
   EventSetTimer(15);
   
   CopyRates(_Symbol, _Period, 0, 10, CandlesTicks);
   ArraySetAsSeries(CandlesTicks, true);
   
   SymbolInfoTick(_Symbol, Ticks);
   
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
   int ind = 0;
   
   string legenda = "Open: "   + DoubleToString(CandlesTicks[ind].open)+"\n"+
                    "Close: "  + DoubleToString(CandlesTicks[ind].close)+"\n"+
                    "High: "   + DoubleToString(CandlesTicks[ind].high)+"\n"+
                    "Low: "    + DoubleToString(CandlesTicks[ind].low)+"\n"+
                    "Time: "   + Ticks.time+"\n"+
                    "Volume: " + DoubleToString(Ticks.volume_real); 
   
   Comment(legenda);
   
   Alert(legenda);
  
  }
//+------------------------------------------------------------------+
// Breve esclarecimento da seção