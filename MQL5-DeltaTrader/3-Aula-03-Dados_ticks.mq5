//+------------------------------------------------------------------+
//|                                          Aula-03-Dados_ticks.mq5 |
//|                                  Copyright 2023, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2023, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
MqlTick tick[];

//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart()
  {
//---
   datetime from = D'2023.09.15 14:35:54';
   datetime to = D'2023.09.15 14:37:20';
   
   Print("Data de início em Unix Timestamp :: ", ulong(from));
   Print("Data final em Unix Timestamp :: ", ulong(to));
   
   int copied = CopyTicksRange(_Symbol, tick, COPY_TICKS_ALL, ulong(from)*1000, ulong(to)*1000);
   Print("Dados copiados :: ", copied);
   
   for(int i=0;i<copied;i++)
     {
      string time_msc = IntegerToString(tick[i].time_msc);
      time_msc = StringSubstr(time_msc, StringLen(time_msc)-3, 3);
      Print("HORA :: ", tick[i].time, "| MSC :: ", time_msc, "| BID :: ", tick[i].bid,"| ASk :: ",tick[i].ask,"| LAST :: "
               ,tick[i].last, "| Volume :: ", tick[i].volume, "| FLAG :: ", tick[i].flags, "|");
     }
  }
//+------------------------------------------------------------------+
