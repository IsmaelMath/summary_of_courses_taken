//+------------------------------------------------------------------+
//|                                 Aula-07-Dados_de_Indicadores.mq5 |
//|                                  Copyright 2023, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2023, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
//|                          RESOURCE                                |
//+------------------------------------------------------------------+
#resource "\\Indicators\\Examples\\BB.ex5"


//+------------------------------------------------------------------+
//|                      HANDLERS  BUFFERS                           |
//+------------------------------------------------------------------+
int    pny_handle = INVALID_HANDLE;

double upperBuffer[];
double middleBuffer[]; 
double bottomBuffer[];

double pnyOpen[];
double pnyHigh[];
double pnyLow[];
double pnyClose[];
double pnyColor[];
//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart()
  {
   //---
   ArraySetAsSeries(upperBuffer, true);
   ArraySetAsSeries(middleBuffer, true);
   ArraySetAsSeries(bottomBuffer, true);
   
   ArraySetAsSeries(pnyOpen, true);
   ArraySetAsSeries(pnyHigh, true);
   ArraySetAsSeries(pnyLow, true);
   ArraySetAsSeries(pnyClose, true);
   ArraySetAsSeries(pnyColor, true);
   //---
   
   //input int     InpBandsPeriod=20;       // Period
   //input int     InpBandsShift=0;         // Shift
   //input double  InpBandsDeviations=2.0;  // Deviation
  
   pny_handle = iBands(_Symbol,_Period, "::Indicators\\Examples\\BB.ex5", 20, 0, 2.0);
   if(pny_handle != INVALID_HANDLE)
     {
      int barsToCopy = 5;
      int copied1 = CopyBuffer(pny_handle, 1, 0, barsToCopy, upperBuffer);
      int copied2 = CopyBuffer(pny_handle, 0, 0, barsToCopy, middleBuffer);
      int copied3 = CopyBuffer(pny_handle, 2, 0, barsToCopy, bottomBuffer);
      int copied4 = CopyBuffer(pny_handle, 3, 0, barsToCopy, pnyOpen);
      int copied5 = CopyBuffer(pny_handle, 4, 0, barsToCopy, pnyHigh);
      int copied6 = CopyBuffer(pny_handle, 5, 0, barsToCopy, pnyLow);
      int copied7 = CopyBuffer(pny_handle, 6, 0, barsToCopy, pnyClose);
      int copied8 = CopyBuffer(pny_handle, 7, 0, barsToCopy, pnyColor);
      
      Print("Upper :: ", upperBuffer[0], "| Middle :: ", middleBuffer[0], "| Bottom :: ", bottomBuffer[0]); 
      Print("Low :: ", pnyLow[0], "| Close :: ", pnyClose[0], "| Color :: ", pnyColor[0]); 
     // Exemplo dá aula mais não é assim que se copia as variáveis do indicador banda de bollinger
     }
  
  
  
  
  
  
  
  }
//+------------------------------------------------------------------+
//12min54seg