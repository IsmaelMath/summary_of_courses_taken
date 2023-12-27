//+------------------------------------------------------------------+
//|                 Aula-04-DistribuicaoBibliotecaDeFormaSegura1.mq5 |
//|                                  Copyright 2023, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2023, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
//| IMPORTS                                                          |
//+------------------------------------------------------------------+
#import "Aula-04-DistribuicaoBibliotecaDeFormaSegura2.ex5"
   void SayHello();
   void MyCalc(double TP, double SL);
#import    

//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart()
  {
//---
   //SayHello();
   
   double TP = 100;
   double SL = 250;
   
   
   MyCalc(TP, SL);
   
   
   
   
  }
//+---------MT5|Script!85---------------------------------------------------------+
