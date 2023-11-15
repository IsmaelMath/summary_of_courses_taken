//+------------------------------------------------------------------+
//|                                          Aula-01-Dados_preco.mq5 |
//|                                  Copyright 2023, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2023, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+

MqlRates candles[];
MqlTick ticks;









//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart()
  {
  // --- Invertendo a posição dos candles Ultimo candle [0]
  ArraySetAsSeries(candles, true);
  
//--- CopyRates -->
   // Erro na copia dos dados
   //int candlestick = CopyRates(_Symbol, _Period, 0, 6, candles);
   
   int barsToCopy = 15;
   
   int copied = CopyRates(_Symbol, _Period, 0, barsToCopy, candles);
   Print("copied :: ", copied);
   
   // ---
   if(copied==barsToCopy)
     {
         //
         Print("Executar lógica operacional ... ");
     
         //
         
         Print("Preço de Fechamento :: ", candles[1].close);
         
         //
         
         Print("Preço de Fechamento atual ::", candles[0].close);
     }
     
//+------------------------------------------------------------------+
//|             FORMAS ATERNATIVAS PARA CAPITURAR OS PREÇOS          |
//+------------------------------------------------------------------+   
   Print("Outra forma de capiturar o preço :: ",  iClose(_Symbol, _Period, 0));
   
   //iOpen();
   //iHigh();
   //iLow();
   //iVolume();
   //iTickVolume();
   //iSpread();
   
   
  }
//+------------------------------------------------------------------+
