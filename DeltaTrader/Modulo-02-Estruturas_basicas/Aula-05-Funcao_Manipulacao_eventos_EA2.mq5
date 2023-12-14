//+------------------------------------------------------------------+
//|                       Aula-05-Funcao_Manipulacao_eventos_EA2.mq5 |
//|                                  Copyright 2023, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2023, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
//--- create timer

   // Liga a função OnTimer
   EventSetTimer(3); // OU EventSetMillisecondTimer(500);
   //EventSetMillisecondTimer(500);
//---
   // Liga a função OnBookEvent
   MarketBookAdd(_Symbol);
   
   
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//--- destroy timer
   
   // Deslida a função OnTimer
   EventKillTimer();
   
   // Desliga a função OnBookEvent
   MarketBookRelease(_Symbol);
   
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
//---
   
  }
//+------------------------------------------------------------------+
//| Timer function :: Função de manipulação de eventos               |
//+------------------------------------------------------------------+
void OnTimer()
  {
//---
   //Print("A função OnTimer foi executada !");
  }
//+------------------------------------------------------------------+
//| Trade function                                                   |
//+------------------------------------------------------------------+
void OnTrade()
  {
//---
   Print("A função OnTrade foi executada !");
  }
//+------------------------------------------------------------------+
//| TradeTransaction function                                        |
//+------------------------------------------------------------------+
void OnTradeTransaction(const MqlTradeTransaction& trans,
                        const MqlTradeRequest& request,
                        const MqlTradeResult& result)
  {
//---
   //Print("A função OnTradeTransaction foi executada !");
  }
//+------------------------------------------------------------------+
//| ChartEvent function                                              |
//+------------------------------------------------------------------+
void OnChartEvent(const int id,
                  const long &lparam,
                  const double &dparam,
                  const string &sparam)
  {
//---
   //Print("A função OnChartEvent foi executada !");
  }
//+------------------------------------------------------------------+
//| BookEvent function                                               |
//+------------------------------------------------------------------+
void OnBookEvent(const string &symbol)
  {
//---
   Print("A função OnBookEvent foi executada !");
  }
//+------------------------------------------------------------------+
