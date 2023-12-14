//+------------------------------------------------------------------+
//|                               Aula-05-IndicadorMediaDoVolume.mq5 |
//|                                  Copyright 2023, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
// FALTA ALTERAR TICK_VOLUME PARA VOLUME ---> DEVIDO EU NÂO USAR CORRETORA BRASILEIRA
#property copyright "Copyright 2023, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property indicator_separate_window
#property indicator_minimum 0

//
#property indicator_buffers 2
#property indicator_plots   2

// --- Caracteristicas da primeira plotagem
#property indicator_label1 "Volume"
#property indicator_type1 DRAW_HISTOGRAM
#property indicator_color1 clrGreen
#property indicator_style1 STYLE_SOLID
#property indicator_width1 2

// --- Caracteristicas da segunda plotagem
#property indicator_label2 "Média"
#property indicator_type2 DRAW_LINE
#property indicator_color2 clrBlack
#property indicator_style2 STYLE_SOLID
#property indicator_width2 2

// --- Input
input int IndPeriod = 14;

// --- Buffers
double IndVolume[];
double IndMedia[];


//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
//--- indicator buffers mapping
  SetIndexBuffer(0, IndVolume, INDICATOR_DATA);
  SetIndexBuffer(1, IndMedia, INDICATOR_DATA);  
// --- Inicializar os buffers sem dados
  ArrayInitialize(IndVolume, EMPTY_VALUE);
  ArrayInitialize(IndMedia, EMPTY_VALUE);
  
  //
  ArrayFill(IndVolume, 0, 0, 0.0); 
  ArrayFill(IndMedia, 0, 0, 0.0);


//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Custom indicator iteration function                              |
//+------------------------------------------------------------------+
int OnCalculate(const int rates_total,
                const int prev_calculated,
                const datetime &time[],
                const double &open[],
                const double &high[],
                const double &low[],
                const double &close[],
                const long &tick_volume[],
                const long &volume[],
                const int &spread[])
  {
//---
   
    // Quando for a inicialização -- > loop inicial
    if(prev_calculated==0)
      {   
          // Loop na quantidade total de barras
          for(int i=0; i < rates_total; i++)
            {
               IndVolume[i] = double(tick_volume[i]);
               //
               if(i>=IndPeriod)
                 {
                     double ValorDaMedia = 0;
                     for(int j=IndPeriod-1; j >= 0; j--)
                       {
                        ValorDaMedia += double(tick_volume[i-j]); 
                       }
                     ValorDaMedia /= IndPeriod;
                     IndMedia[i] = ValorDaMedia;      
                 }
            }       
      }
    else
      {
         
         IndVolume[rates_total-1] = double(tick_volume[rates_total-1]);
         
         //
         double ValorDaMedia = 0;
         for(int j=IndPeriod-1; j >= 0; j--)
           {
            ValorDaMedia += double(tick_volume[rates_total-1-j]); 
           }
         ValorDaMedia /= IndPeriod;
         IndMedia[rates_total-1] = ValorDaMedia; 
            
      } 
      
   
//--- return value of prev_calculated for next call
   return(rates_total);
  }
//+------------------------------------------------------------------+
