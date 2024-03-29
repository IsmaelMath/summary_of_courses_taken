//+------------------------------------------------------------------+
//|                           Aula-12-InformacoesDeUmAtivoParte2.mq5 |
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
   
   // Scanner de Opções
   string ativoBase = "PETR"; // AtivoBase Indenticador
   
   // Array pelo nome
   string  symbols[];
   
   // loop nos ativos da corretora
   for(int i=0;i<total2;i++)
     {
      //
      string symbolName = SymbolName(i, true);
      
      // filtrando pelo nome 
      if(StringSubstr(symbolName, 0, 4) == ativoBase)
        {
        // 
         int size = ArraySize(symbols);
         ArrayResize(symbols, size+1);
         symbols[size] = symbolName;
         
         // Adicionar o ativo na observação de Mercado
         SymbolSelect(symbolName, true);
        
         
         
        }
      Print("Capiturando Informações ...");
      Sleep(5000);
      //REST
      }
      
  int size2 = ArraySize(symbols);    
  for(int i=0;i<size2;i++)
    {
      ENUM_SYMBOL_OPTION_MODE optionMode = (ENUM_SYMBOL_OPTION_MODE)SymbolInfoInteger(symbols[i], SYMBOL_OPTION_MODE);
      ENUM_SYMBOL_OPTION_RIGHT optionRight = (ENUM_SYMBOL_OPTION_RIGHT)SymbolInfoInteger(symbols[i], SYMBOL_OPTION_RIGHT);
   
      // Informações do tipo Double
      double bid = SymbolInfoDouble(symbols[i], SYMBOL_BID);
      double ask = SymbolInfoDouble(symbols[i], SYMBOL_ASK);
      
  // Crinado um filtro básico de liquidez
  if(bid>0 || ask>0)
    {
      Print("Nome do Ativo :: ", symbols[i], "| Mode :: ", EnumToString(optionMode), "| Right :: ", EnumToString(optionRight), "| Bid :: ", bid, "| Ask :: ", ask);
    
    // Removendo o ativo da observação de mercado
    SymbolSelect(symbols[i], false);  
    }

  
     }
  }
  
  
  
  
//+------------------------------------------------------------------+
