//+------------------------------------------------------------------+
//|                                           Aula-04-Dados_Book.mq5 |
//|                                  Copyright 2023, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2023, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
//|                      GLOBALS                                     |
//+------------------------------------------------------------------+
MqlBookInfo book[];



//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart()
  {
   // 1. ADICIONAR o book de ofertas ao terminal via código
   MarketBookAdd(_Symbol); // ou MarketBookAdd("EURUSD");
   
   // 2. COPIAR os dados do boook de ofertas
   MarketBookGet(_Symbol, book);
   
   
   // Tamanho do book de ofertas
   //Print("Tamanho do book de ofertas :: ", ArraySize(book));
   
   //Print("Valor :: ", book[0].price);
   
   // Tamanho do book de ofertas
   Print("Valor :: ", EnumToString(book[0].type));
   
   Print("Valor :: ", EnumToString(book[0].type));
   
   // 3. FINALIZAR (release) a utilização do book de ofertas
   MarketBookRelease(_Symbol);
   
  }
//+------------------------------------------------------------------+
