//+------------------------------------------------------------------+
//|                         Aula-06-Incluindo_bibliotecas_padrao.mq5 |
//|                                  Copyright 2023, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2023, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
//|                   Include Bibliotecas                            |
//+------------------------------------------------------------------+
#include <Trade\Trade.mqh>
#include <Files\File.mqh>

//+------------------------------------------------------------------+
//|          DECLARAR VARIÁVEIS PARA AS BIBLIOTECAS PADRÃO           |
//+------------------------------------------------------------------+
CTrade trade;
CFile file;


//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart()
  {
   
   trade.SetExpertMagicNumber(123456);
   
  }
//+------------------------------------------------------------------+
