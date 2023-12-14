//+------------------------------------------------------------------+
//|                                                         MACD.mq5 |
//|                             Copyright 2000-2023, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright   "Copyright 2000-2023, MetaQuotes Ltd."
#property link        "https://www.mql5.com"
#property description "Moving Average Convergence/Divergence"
#include <MovingAverages.mqh>

//--- indicator settings
#property indicator_separate_window
#property indicator_buffers 6
#property indicator_plots   3

// --- Caracteristica da plotagem 1
#property indicator_type1   DRAW_LINE//DRAW_HISTOGRAM // Histograma
#property indicator_color1  clrGreen
#property indicator_width1  1
#property indicator_label1  "MACD"

// --- Caracteristica da plotagem 2
#property indicator_type2   DRAW_LINE // LInha
#property indicator_color2  clrBlue
#property indicator_width2  1
#property indicator_label2  "Signal"
#property indicator_style2 STYLE_DOT

// --- Caracteristica da plotagem 2
#property indicator_type3   DRAW_COLOR_HISTOGRAM 
#property indicator_color3  clrDimGray, clrLime, clrGreen, clrRed, clrFireBrick
#property indicator_width3  2
#property indicator_label3  "Histograma"
#property indicator_style3 STYLE_SOLID

// --- input parameters
input int                InpFastEMA=12;               // Fast EMA period
input int                InpSlowEMA=26;               // Slow EMA period
input int                InpSignalSMA=9;              // Signal SMA period
input ENUM_APPLIED_PRICE InpAppliedPrice=PRICE_CLOSE; // Applied price

// --- indicator buffers
double ExtMacdBuffer[];
double ExtSignalBuffer[];
double ExtFastMaBuffer[];
double ExtSlowMaBuffer[];

// --- Buffers adicionados por conta da terceira plotagem
double Histogram[];
double IndColor[];


// --- MA Handles
int    ExtFastMaHandle;
int    ExtSlowMaHandle;
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
void OnInit()
  {
//--- indicator buffers mapping
   SetIndexBuffer(0,ExtMacdBuffer,INDICATOR_DATA);
   SetIndexBuffer(1,ExtSignalBuffer,INDICATOR_DATA);
   SetIndexBuffer(2, Histogram, INDICATOR_DATA); // Alterado
   SetIndexBuffer(3, IndColor, INDICATOR_COLOR_INDEX); // Alterado
   SetIndexBuffer(4,ExtFastMaBuffer,INDICATOR_CALCULATIONS);
   SetIndexBuffer(5,ExtSlowMaBuffer,INDICATOR_CALCULATIONS);

   
//--- sets first bar from what index will be drawn
   PlotIndexSetInteger(1,PLOT_DRAW_BEGIN,InpSignalSMA-1);

//--- name for indicator subwindow label
   string short_name=StringFormat("MACD(%d,%d,%d)",InpFastEMA,InpSlowEMA,InpSignalSMA);
   IndicatorSetString(INDICATOR_SHORTNAME,short_name);

//--- get MA handles
   ExtFastMaHandle=iMA(NULL,0,InpFastEMA,0,MODE_EMA,InpAppliedPrice);
   ExtSlowMaHandle=iMA(NULL,0,InpSlowEMA,0,MODE_EMA,InpAppliedPrice);
  }
//+------------------------------------------------------------------+
//| Moving Averages Convergence/Divergence                           |
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
   if(rates_total<InpSignalSMA)
      return(0);
//--- not all data may be calculated
   int calculated=BarsCalculated(ExtFastMaHandle);
   if(calculated<rates_total)
     {
      Print("Not all data of ExtFastMaHandle is calculated (",calculated," bars). Error ",GetLastError());
      return(0);
     }
   calculated=BarsCalculated(ExtSlowMaHandle);
   if(calculated<rates_total)
     {
      Print("Not all data of ExtSlowMaHandle is calculated (",calculated," bars). Error ",GetLastError());
      return(0);
     }
//--- we can copy not all data
   int to_copy;
   if(prev_calculated>rates_total || prev_calculated<0)
      to_copy=rates_total;
   else
     {
      to_copy=rates_total-prev_calculated;
      if(prev_calculated>0)
         to_copy++;
     }
//--- get Fast EMA buffer
   if(IsStopped()) // checking for stop flag
      return(0);
   if(CopyBuffer(ExtFastMaHandle,0,0,to_copy,ExtFastMaBuffer)<=0)
     {
      Print("Getting fast EMA is failed! Error ",GetLastError());
      return(0);
     }
//--- get SlowSMA buffer
   if(IsStopped()) // checking for stop flag
      return(0);
   if(CopyBuffer(ExtSlowMaHandle,0,0,to_copy,ExtSlowMaBuffer)<=0)
     {
      Print("Getting slow SMA is failed! Error ",GetLastError());
      return(0);
     }
//---
   int start;
   if(prev_calculated==0)
      start=0;
   else
      start=prev_calculated-1;
//--- calculate MACD
   for(int i=start; i<rates_total && !IsStopped(); i++)
      ExtMacdBuffer[i]=ExtFastMaBuffer[i]-ExtSlowMaBuffer[i];
//--- calculate Signal
   SimpleMAOnBuffer(rates_total,prev_calculated,0,InpSignalSMA,ExtMacdBuffer,ExtSignalBuffer);
   
// --- Plotar o Histograma como diferença das linhas
   for(int i=start; i<rates_total && !IsStopped(); i++)
     {
      Histogram[i] = ExtMacdBuffer[i] - ExtSignalBuffer[i];
      
      //
      if(Histogram[i] > 0)
        {
         if(Histogram[i]>Histogram[i-1]) IndColor[i] = 1;
         if(Histogram[i]<Histogram[i-1]) IndColor[i] = 2;  
        }
      else if(Histogram[i] < 0)
        {
         if(Histogram[i]>Histogram[i-1]) IndColor[i] =3;
         if(Histogram[i]<Histogram[i-1]) IndColor[i] =4;         
        }
     else
        {
         IndColor[i] = 0;
        }
      
     }
   
//--- OnCalculate done. Return new prev_calculated.
   return(rates_total);
  }
//+------------------------------------------------------------------+
