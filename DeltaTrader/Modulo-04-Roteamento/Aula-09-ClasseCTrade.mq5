//+------------------------------------------------------------------+
//|                                Aula-08-EstruturaDeRoteamento.mq5 |
//|                                  Copyright 2023, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2023, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
#include <Trade\Trade.mqh>

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

CTrade trade;

int my_variable;

//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart()
  {
   /*
   bool ok = trade.BuyLimit(0.01, 1.06900, _Symbol, 0, 0, ORDER_TIME_DAY, 0, "Compra a mercado");
   if(ok)
     {
      
      if(trade.ResultRetcode() == 10008 || trade.ResultRetcode() == 10009)
        {
         Print("Ordem enviar | Executada com secesso .");
        }
  
     }*/
   //+------------------------------------------------------------------+
   //|        CANCELAR UMA ORDEM PENDENTE                               |
   //+------------------------------------------------------------------+
   /*
   bool ok = trade.OrderDelete(378615220);
   if(ok)
     {
      
      if(trade.ResultRetcode() == 10008 || trade.ResultRetcode() == 10009)
        {
         Print("Ordem enviar | Executada com secesso .");
        }
  
     }*/
   //+------------------------------------------------------------------+
   //|        FECHAR UMA POIÇÂO ABERTA                                  |
   //+------------------------------------------------------------------+  
   /*
   bool ok = trade.PositionClose(378616651);
   if(ok)
     {
      
      if(trade.ResultRetcode() == 10008 || trade.ResultRetcode() == 10009)
        {
         Print("Ordem enviar | Executada com secesso .");
        }
  
     }*/  
   //+------------------------------------------------------------------+
   //|        MODIFICANDO TP/SL UMA POSIÇÂO ABERTA                      |
   //+------------------------------------------------------------------+  
   /*
   bool ok = trade.PositionModify(378617511, 1.06850, 1.06950);
   if(ok)
     {
      
      if(trade.ResultRetcode() == 10008 || trade.ResultRetcode() == 10009)
        {
         Print("Posição alterada com sucesso.");
        }
  
     }*/  
     
  //+------------------------------------------------------------------+
  //|        ORDER STOP                                                |
  //+------------------------------------------------------------------+  
    /*bool ok = trade.BuyStop(0.01, 1.06950, _Symbol, 0, 0, ORDER_TIME_DAY, 0,"Compra Stop");
    if(ok)
     {
      
      if(trade.ResultRetcode() == 10008 || trade.ResultRetcode() == 10009)
        {
         Print("Posição alterada com sucesso.");
        }
  
     }*/  
      
  //+------------------------------------------------------------------+
  //|        ORDER STOP LIMIT                                          |
  //+------------------------------------------------------------------+  
   
    bool ok = trade.OrderOpen(_Symbol, ORDER_TYPE_BUY_STOP_LIMIT, 0.01, 1.06800,1.07060, 0, 0, ORDER_TIME_DAY, 0, "COMPRA BUY STOP LIMIT");
    if(ok)
     {
      
      if(trade.ResultRetcode() == 10008 || trade.ResultRetcode() == 10009)
        {
         Print("Ordem colocada com sucesso.");
        }
  
     }
  
  }
//+------------------------------------------------------------------+
