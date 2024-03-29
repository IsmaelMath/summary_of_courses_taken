//+------------------------------------------------------------------+
//|                                          Aula-10-Processador.mq5 |
//|                                  Copyright 2023, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2023, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

//+------------------------------------------------------------------+
//|                      DEFINES                                     |
//+------------------------------------------------------------------+

#define VERSION "1.00" // Pode ser definido antes tb do #propety
#define DEBUG 1 // 0 = debug desligado | 1 = debug LIGADO | 2 = debug de OnDeinit

#define MACD_ON 0 
//#define RSI_ON 0 
#define PSAR_ON 0 
//+------------------------------------------------------------------+
//|                          Variáveis globais                       |
//+------------------------------------------------------------------+
#ifdef MACD_ON
   int macdHandle = INVALID_HANDLE;
#endif  

#ifdef RSI_ON
   int rsiHandle= INVALID_HANDLE;
#endif    

#ifdef PSAR_ON
   int psarHandle= INVALID_HANDLE;
#endif    
//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart()
  {
//---

/*
   #define
   #property
   #include
   #import
   #ifdef
   #ifndef
      #else
      #endif


   Print("A versão atual desse arquivo é :: ", VERSION);
   if(DEBUG>0) Print("Esse print só está sendo mostrado porque o DEBUG está ligado !!!");
   
   int handle = INVALID_HANDLE;
   if(Type == "MACD")
     {
      handle = iMACD();
     }
    if(Type == "IFR")
      {
       handle = iRSI();
      }

*/
 #ifdef MACD_ON
   macdHandle = iMACD(_Symbol, _Period, 5, 3, 3, PRICE_CLOSE);
 #endif 
 
 
 #ifdef RSI_ON
   rsiHandle = iRSI(_Symbol, _Period, 14, PRICE_CLOSE);
 #endif 
 
  
 #ifdef  PSAR_ON
   psarHandle = iSAR(_Symbol, _Period, 2, 20);
 #endif 
 
 
 // Lógica de Tralling stop    
   #ifndef  PSAR_ON
      double mytraillingStop = 0;
   #endif
   
   /*
   #ifdef PSAR_ON
      psarHandle = iSAR(_Symbol, _Period, 2, 20);
   #else 
      double mytraillingStop = 0;
   #endif 
   */
   
   
    
  }
//+------------------------------------------------------------------+
