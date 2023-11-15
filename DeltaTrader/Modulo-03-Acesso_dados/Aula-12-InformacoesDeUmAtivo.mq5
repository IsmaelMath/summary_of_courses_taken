//+------------------------------------------------------------------+
//|                                 Aula-12-InformacoesDeUmAtivo.mq5 |
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
   // Quantidade de ativos na observação de mercado
   int total = SymbolsTotal(true);
   Print("Quantidade de ativos na Obs. de Mercado :: ", total);
   
   // Quantidade de ativos na observação de mercado
   int total2 = SymbolsTotal(false);
   Print("Quantidade de ativos na base da corretora :: ", total2);
   
   // loop nos ativos da corretora
   for(int i=0;i<total2;i++)
     {
      //
      string symbolName = SymbolName(i, true);
      
      
      // Informações do tipo String
      string desc = SymbolInfoString(symbolName, SYMBOL_DESCRIPTION);
      
      // Informações do tipo Double
      double bid = SymbolInfoDouble(symbolName, SYMBOL_BID);
      double ASk = SymbolInfoDouble(symbolName, SYMBOL_ASK);
      // Informações do tipo INT
      
      // DEBUG
      Print("Nome do ativo :: ", symbolName, "| Descrição :: ", desc, "| Bid :: ", bid, "| ask :: ", ASk);
      
     }
  }
//+------------------------------------------------------------------+
