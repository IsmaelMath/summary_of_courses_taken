//+------------------------------------------------------------------+
//|                                    Aula-03-ContaHedgerParte2.mq5 |
//|                                  Copyright 2023, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2023, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

// --- Imports de Classes
#include <Trade\Trade.mqh> 
CTrade trade;

// --- Inputs
input int MagicNumber = 0; // Magic Number 
input double lot = 0.1; // Tamanho do lote

//+------------------------------------------------------------------+
//| Expert Initialization Function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
   //---
   trade.SetExpertMagicNumber(MagicNumber);
   
   //--- Caso exista um magic Number no terminal, impedir a inicialização desse robo
   //if(/* Já tem um magic Number no terminal*/)
     //{
      // Imepede a inicialização
      
      // return (INIT_FAILED);
     //}
   
   //---
   
   
   
   //---
   
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+



//+------------------------------------------------------------------+
//| Expert deinitialization Function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   //---

   
   //---
   
   
   //---
   
   
   //---
  }
//+------------------------------------------------------------------+




//+------------------------------------------------------------------+
//| Expert tick Function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
   //---
   if(IsNewBar())
     {
      //
      bool comprado = false;
      
      //
      bool vendido = false;
      
      //
      ulong ticketCompra = 0;
      
      //
      ulong ticketVendido = 0;
      
      // Caso não tenha posição aberta -- > compra a mercado
      int positionsTotal = PositionsTotal();
      
      //
      for(int i = 0 ; i < positionsTotal; i++)
        {
         //
         ulong posTicket = PositionGetTicket(i);
         
         //
         if(PositionSelectByTicket(posTicket))
           {
            //
            ulong posMagic = PositionGetInteger(POSITION_MAGIC);
            
            //
            string posSymbol = PositionGetString(POSITION_SYMBOL);
            
            //
            ENUM_POSITION_TYPE posType = (ENUM_POSITION_TYPE)PositionGetInteger(POSITION_TYPE);
            
            //
            if(posSymbol == _Symbol && posMagic == MagicNumber)
              {
               //
               if(posType == POSITION_TYPE_BUY)
                  {
                   //
                   comprado = true;
                   
                   //
                   ticketCompra = posTicket;
                  }
               // 
               if(posType == POSITION_TYPE_SELL) 
                  {
                   //
                   vendido = true;
                  
                   //
                   ticketVendido = posTicket;
                  } 
                 
              }
           }
        }
     
     // Não posui nenhuma posição em aberto
     if(!comprado && !vendido)
       {
        // Tentar Comprar 4 vezes
        int Counter = 0;
        
        //
        do
          {
           //
           Counter++;
          
           //
           bool ok = trade.Buy(lot, _Symbol, 0, 0, 0, "Compra a mercado");
           
           //
           if(ok)
             {
              //
              if(trade.ResultRetcode() == 10008 || trade.ResultRetcode() == 10009)
                {
                 //
                 Print("Posição ABERTA com sucesso (Conta Hedger)");
                 break;
                }
             }
          }
        while(Counter < 4);
       
       }
     
     // Caso esteja comprado, fechar a posição
     if(comprado)
       {
         // Tentar fechar posição 4 vezes
        int Counter = 0;
        
        //
        do
          {
           //
           Counter++;
          
           //
           bool ok = trade.PositionClose(ticketCompra);
           
           //
           if(ok)
             {
              //
              if(trade.ResultRetcode() == 10008 || trade.ResultRetcode() == 10009)
                {
                 //
                 Print("Posição FECHADA com sucesso (Conta Hedger)");
                 
                 //
                 break;
                }
             }
          }
        //  
        while(Counter < 4);
       }
     }   
   
   //---
   
   
   //---
   
   
   //---
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|   Function 1 IsNewBar                                            |
//+------------------------------------------------------------------+
bool IsNewBar()
   {
   // --- Memorize the of opening of the last bar in the static variable
   static datetime last_time = 0;
   
   // --- Current Time
   datetime lastBar_time = (datetime)SeriesInfoInteger(Symbol(), Period(), SERIES_LASTBAR_DATE);
   
   // --- If it is the first call of the function
   if(last_time == 0)
     {
      last_time = lastBar_time;
      return false;
     }
   
   // --- If the time differs
   if(last_time != lastBar_time)
     {
      // --- Memorize the time and return true
      last_time = lastBar_time;
      return true;
     }
   // If we passed to this line, then the bar is not new; return false
   return false;  
   }
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|   Function 2                                                     |
//+------------------------------------------------------------------+




//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|   Function 3                                                     |
//+------------------------------------------------------------------+






//+------------------------------------------------------------------+
