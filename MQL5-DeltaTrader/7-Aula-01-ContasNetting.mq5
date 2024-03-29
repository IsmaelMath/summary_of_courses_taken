//+------------------------------------------------------------------+
//|                                        Aula-01-ContasNetting.mq5 |
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
   
   //Print("Ordens abertas :: ", OrdersTotal());
   
   //
   MqlRates dailyBar[];
   int copie = CopyRates(_Symbol, PERIOD_D1, 0, 1, dailyBar);
   
  if(copie == 1)
     {
      datetime initTime = D'2023.09.20 00:00:00'; 
      datetime endTime = initTime + 86399;
      //Print("initTime :: ", initTime, " | endTime :: ", endTime);
      //GetOrdersHistory(initTime, endTime);
      GetDealsHistory(initTime, endTime);
     }
   //GetOrdersHistory(initTime, endTime);
   
  }
//+------------------------------------------------------------------+
//--- Ordens
   // São ordens de compra e venda que podem ounão ser executadas
   // Historico de ordens

void GetOrdersHistory(datetime _initTime, datetime _endTime)
   {
      // As ordens abertas
      int ordersTotal = OrdersTotal();
      
      // As ordens Fechadas -- >Executada ou Canceladas
      if(HistorySelect(_initTime, _endTime)) // caso o historico tenha sido carregado
        {
         int historyOrdersTotal = HistoryOrdersTotal();
         Print("Total de Ordens :: ", historyOrdersTotal);
         
         // Loop no historico de Ordens
         for(int i=0;i<historyOrdersTotal;i++)
           {
            //HistoryOrderGetDouble();
            //HistoryOrderGetInteger();
            //HistoryOrderGetString();
           
            
            ulong orderTicket = ulong(HistoryOrderGetTicket(i));
            
            // 
            datetime orderTime = datetime(HistoryOrderGetInteger(orderTicket, ORDER_TIME_SETUP));
            ENUM_ORDER_TYPE orderType = (ENUM_ORDER_TYPE)HistoryOrderGetInteger(orderTicket, ORDER_TYPE);
            double orderPrice = HistoryOrderGetDouble(orderTicket, ORDER_PRICE_OPEN);   
            
            
            Print("i :: ", i, "| Horas :: ", orderTime, "| Type :: ", EnumToString(orderType), "| OrderPrice :: ", orderPrice);              
           }
        }
      
   
   }  

// DEALS (NÉGOCIOS)
// Quando uma ordem é executada, ela imediatamente se transforma em um negócio
void GetDealsHistory(datetime _initTime, datetime _endTime)
      {
      
       if(HistorySelect(_initTime, _endTime))
         {
          int historyDealsTotal = HistoryDealsTotal();
          Print("Total de ordens executadas :: ", historyDealsTotal);
          for(int i=0;i<historyDealsTotal;i++)
            {
              ulong dealsTicks =  HistoryDealGetTicket(i);
              
              //
              datetime dealTime = datetime(HistoryDealGetInteger(dealsTicks, DEAL_TIME));
              ENUM_DEAL_TYPE dealType = (ENUM_DEAL_TYPE)HistoryDealGetInteger(dealsTicks, DEAL_TYPE);
              ENUM_DEAL_ENTRY dealEntry = (ENUM_DEAL_ENTRY)HistoryDealGetInteger(dealsTicks, DEAL_ENTRY);
              double dealVolume = HistoryDealGetDouble(dealsTicks, DEAL_VOLUME);
              double dealPrice = HistoryDealGetDouble(dealsTicks, DEAL_PRICE);   
            
              Print("i :: ", i, "| Horas :: ", dealTime, "| Type :: ", EnumToString(dealType), "| OrderPrice :: ", dealPrice, "| dealEntry :: ", EnumToString(dealEntry), "| Volume :: ", dealVolume);
            }
          
          
         
         }
      
      }
// POSIÇÕES
// Uma negócio pode ABRIR ou FECHAR uma posição 

void GetPositionsHistory(datetime _initTime, datetime _endTime) 
   {
    if(HistorySelect(_initTime, _endTime))
      {
       
       
       
      }
    
    
    
    
   }






