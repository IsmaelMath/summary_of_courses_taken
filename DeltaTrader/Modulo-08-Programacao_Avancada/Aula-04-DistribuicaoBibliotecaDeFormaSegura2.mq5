//+------------------------------------------------------------------+
//|                 Aula-04-DistribuicaoBibliotecaDeFormaSegura2.mq5 |
//|                                  Copyright 2023, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property library
#property copyright "Copyright 2023, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void SayHello() export
   {
    //
    Print("Hello World");
   
   }
void MyCalc(double TP, double SL) export
   {
    //
    MqlTick tick;
    
    //
    SymbolInfoTick(_Symbol, tick);
    
    //
    Print("A relação de TP/SL que você está utilizando :: ", TP/SL);
    Print("Dado o último preço :: ", tick.last, "| A sua relação está incorreta .");
   }   
   