//+------------------------------------------------------------------+
//|                                   Aula-04-ContasHedgerParte4.mq5 |
//|                                  Copyright 2023, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2023, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

/*
   1. Enviar uma ordem :: ok
   2. Identificar a posição pelo magic Number :: ok
   3. Fechar a posição pelo magic number :: ok
   4. Enviar uma ordem pelo magic number :: ok
   5. identificar a ordem pelo magic number :: ok
   6. cancelar a ordem pelo magic number :: ok

   7. Fechar a posição pela outra (close By) pelo magic number
*/

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
   //  {
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
      bool comprado = false; // Variáveis para controle de posições
      
      //
      bool vendido = false; // Variáveis para controle de posições
      
      // Variáveis para controle de orders
      bool compraPendente = false;
      
      // Variáveis para controle de orders
      bool vendaPendente = false;
      
      //
      ulong ticketCompra = 0;
      
      //
      ulong ticketVendido = 0;

      //
      ulong ticketCompraPendente = 0;
      
      //
      ulong ticketVendidoPendente = 0;      
      
      // Loop nas posições
      
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
     // --- Loop na ordens   
     int ordersTotal = OrdersTotal();
     
     //
     for(int i=0;i<ordersTotal;i++)
       {
        //
        ulong orderTicket = OrderGetTicket(i);
        
        // caso a ordem tenha sido cancelada com sucesso
        if(OrderSelect(orderTicket))
          {
           //
           ulong orderMagic = OrderGetInteger(ORDER_MAGIC);
           
           //
           string ordersSymbol = OrderGetString(ORDER_SYMBOL);
           
           //
           ENUM_ORDER_TYPE orderType = (ENUM_ORDER_TYPE)OrderGetInteger(ORDER_TYPE);
           
           //
           if(ordersSymbol == _Symbol && orderMagic == MagicNumber)
             {
              //
              if(orderType == ORDER_TYPE_BUY_LIMIT) 
                { 
                 //
                 compraPendente = true;
                 
                 //
                 ticketCompraPendente = orderTicket;
                }
              //
              if(orderType == ORDER_TYPE_SELL_LIMIT) 
                {
                 //
                 vendaPendente = true;
                 
                 //
                 ticketVendidoPendente = orderTicket;
                
                }
             }
          }
       }   
     
     // Não posui nenhuma posição em aberto
     //if(!comprado && !vendido)
     if(!comprado && !vendido && !compraPendente && !vendaPendente)  
       {
        // --- Loop controlado para comprar
        
        // Tentar Comprar 4 vezes
        int Counter = 0;
        
        //
        do
          {
           //
           Counter++;
           
           //
           MqlTick tick;
           
           //
           if(SymbolInfoTick(_Symbol, tick))
             {
              //
              double tickSize = SymbolInfoDouble(_Symbol, SYMBOL_TRADE_TICK_SIZE);
              
              // 10 Ticks abaixo do preço de Bid
              double refPrice = tick.bid - 10*tickSize; 
             
              //
              //bool ok = trade.BuyLimit(lot, refPrice, _Symbol, 0, 0, ORDER_TIME_DAY, 0, "Compra na pedra");
              bool ok = trade.Buy(lot, _Symbol, 0, 0, 0, "Compra a mercado");
              //
              if(ok)
                {
                 //
                 if(trade.ResultRetcode() == 10008 || trade.ResultRetcode() == 10009)
                   {
                    //
                    Print("Posição COMPRADA aberta com sucesso (Conta Hedger)");
                    break;
                   }
                }
             }
          }
        while(Counter < 4);
        
        // --- Loop controlado para vender
        // Tentar Comprar 4 vezes
        int Counter2 = 0;
        
        //
        do
          {
           //
           Counter2++;
           
           //
           MqlTick tick;
           
           //
           if(SymbolInfoTick(_Symbol, tick))
             {
              //
              double tickSize = SymbolInfoDouble(_Symbol, SYMBOL_TRADE_TICK_SIZE);
              
              // 10 Ticks abaixo do preço de Bid
              double refPrice = tick.bid - 10*tickSize; 
             
              //
              //bool ok = trade.BuyLimit(lot, refPrice, _Symbol, 0, 0, ORDER_TIME_DAY, 0, "Compra na pedra");
              bool ok = trade.Sell(lot, _Symbol, 0, 0, 0, "Venda na pedra");
              
              //
              if(ok)
                {
                 //
                 if(trade.ResultRetcode() == 10008 || trade.ResultRetcode() == 10009)
                   {
                    //
                    Print("Posição VENDIDA aberta com sucesso (Conta Hedger)");
                    break;
                   }
                }
             }
          }
        while(Counter < 4);
       }
     
     // Verificar se está comprado e vendido ao mesmo tempo   
     if(comprado && vendido)
       {
        Print("USAR A FUNCIONALIDADE CLOSE BY");
        
        //
        bool ok = trade.PositionCloseBy(ticketCompra, ticketVendido);
           
        //
        if(ok)
          {
           //
           if(trade.ResultRetcode() == 10008 || trade.ResultRetcode() == 10009)
             {
              //
              Print("Posição CORRETAMENTE FECHADAS através da funcionalidade CLOSE BY (Conta Hedger)");
              
             }
          }
       }
     
     
     
     /*
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
                
                }
             }
          }
        //  
        while(Counter < 4);
       }
     // Se não estiver comprado e se houver alguma ordem pendente
     if(!comprado && compraPendente)
       {
        //
        bool ok = trade.OrderDelete(ticketCompraPendente);
        
        //
        if(ok)
          {
           //
           if(trade.ResultRetcode() == 10008 || trade.ResultRetcode() == 10009)
             {  
              //
              Print("Ordem de Compra Buy Limit Fechada com sucesso (conta Hedger)");
              
             }
          }
       }  
       
     */  
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
