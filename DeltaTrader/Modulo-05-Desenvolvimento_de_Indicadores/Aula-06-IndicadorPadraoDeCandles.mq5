//+------------------------------------------------------------------+
//|                             Aula-06-IndicadorPadraoDeCandles.mq5 |
//|                                  Copyright 2023, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "DeltaTrader"
#property link      "www.deltatrader.com.br"
#property version   "1.00"
//
#property indicator_chart_window
#property indicator_buffers 1
#property indicator_plots   1

//--- plot Arrows
#property indicator_label1  "Arrows"
#property indicator_type1   DRAW_ARROW
#property indicator_color1  clrYellow
#property indicator_width1  8

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double IndValue[];

//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
//--- indicator buffers mapping
   SetIndexBuffer(0,IndValue,INDICATOR_DATA);
// especificar qual tipo de "arrow" deve ser utilizado
   PlotIndexSetInteger(0,PLOT_ARROW, 149); // 149, 
   PlotIndexSetInteger(0,PLOT_ARROW_SHIFT,0);
   PlotIndexSetDouble(0,PLOT_EMPTY_VALUE,0);
   
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
   // DOJI
   if(prev_calculated==0) // loop inicial
     {
      // open == close
      for(int i=0;i<rates_total;i++)
        {
         // 
         if(open[i]==close[i])
           {
            IndValue[i] = low[i] - _Point*20;
            
           }
         else
           {
            IndValue[i] = 0;
           }
        }
     }
   else // atualiza apenas o candle corrente
     {
      if(open[rates_total-1]==close[rates_total-1])
        {
         IndValue[rates_total-1] = low[rates_total-1] - _Point*20;
        }
      else
        {
         IndValue[rates_total-1] = 0;
        }
     }
   
//--- return value of prev_calculated for next call
   return(rates_total);
  }
  // ---------------------------------------------------------------------- \\