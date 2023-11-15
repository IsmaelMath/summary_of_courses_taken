//+------------------------------------------------------------------+
//|                                 Aula-06-Dados_de_Indicadores.mq5 |
//|                                  Copyright 2023, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2023, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
//|                     HANDLES E BANFFERS                           |
//+------------------------------------------------------------------+
// --- Indicador Média Móvel
int maHandle = INVALID_HANDLE;
double maBuffer[];

// --- Indicador RSI
int rsiHandle = INVALID_HANDLE;
double rsiBuffer[];

//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart()
  {
   //---
   // Inverter as posições da variável
   ArraySetAsSeries(maBuffer, true);
   ArraySetAsSeries(rsiBuffer, true);  
   
   // Definindo o manipulador (handler) do indicador
   maHandle = iMA(_Symbol, _Period, 20, 0, MODE_SMA, PRICE_CLOSE);
   rsiHandle = iRSI(_Symbol, _Period, 14,PRICE_CLOSE);
   
   // Se o handler foi corretamente inicializado.
   if(maHandle!=INVALID_HANDLE && rsiHandle!=INVALID_HANDLE)
     {
      int barsToCopy = 5;
      
      // copia os dados do handle para variável buffers
      int copiedma = CopyBuffer(maHandle, 0, 0, barsToCopy, maBuffer);
      int copiedrsi = CopyBuffer(rsiHandle, 0, 0, barsToCopy, rsiBuffer);
      
      //
      if(copiedma == barsToCopy && copiedrsi == barsToCopy)
        {
        
         Print("Valor atual da Média Móvel :: ", maBuffer[0]);
         Print("Valor atual da RSI :: ", rsiBuffer[0]);
        }
       }
    
   
  }
//+------------------------------------------------------------------+
