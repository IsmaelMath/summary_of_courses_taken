//+------------------------------------------------------------------+
//|                                                           BB.mq5 |
//|                             Copyright 2000-2023, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright   "Copyright 2000-2023, MetaQuotes Ltd."
#property link        "https://www.mql5.com"
#property description "Bollinger Bands"
#include <MovingAverages.mqh>
//---
#property indicator_chart_window
#property indicator_buffers 9
#property indicator_plots   4

// Plotagem 1
#property indicator_type1   DRAW_LINE
#property indicator_color1  LightSeaGreen
#property indicator_label1  "Bands middle"

// Plotagem 2
#property indicator_type2   DRAW_LINE
#property indicator_color2  LightSeaGreen
#property indicator_label2  "Bands upper"

// Plotagem 3 
#property indicator_type3   DRAW_LINE
#property indicator_color3  LightSeaGreen
#property indicator_label3  "Bands lower"

// Plotagem 3
#property indicator_type4   DRAW_COLOR_CANDLES
#property indicator_color4  clrLime, clrRed, clrNONE
#property indicator_style4  STYLE_SOLID
#property indicator_width4  1
#property indicator_label4  "PNY"

// --- Adicionando os 5 novos buffers para a quarta plotagem
double IndOpen[]; 
double IndHigh[];
double IndLow[];
double IndClose[];
double IndColor[];

//--- input parametrs
input int     InpBandsPeriod=20;       // Period
input int     InpBandsShift=0;         // Shift
input double  InpBandsDeviations=2.0;  // Deviation
//--- global variables
int           ExtBandsPeriod,ExtBandsShift;
double        ExtBandsDeviations;
int           ExtPlotBegin=0;
//--- indicator buffer
double        ExtMLBuffer[];
double        ExtTLBuffer[];
double        ExtBLBuffer[];
double        ExtStdDevBuffer[];

//+------------------------------------------------------------------+
//|                      GLOBAIS                                     |
//+------------------------------------------------------------------+

int indBegin = InpBandsPeriod+1;
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
void OnInit()
  {
//--- check for input values
   if(InpBandsPeriod<2)
     {
      ExtBandsPeriod=20;
      PrintFormat("Incorrect value for input variable InpBandsPeriod=%d. Indicator will use value=%d for calculations.",InpBandsPeriod,ExtBandsPeriod);
     }
   else
      ExtBandsPeriod=InpBandsPeriod;
   if(InpBandsShift<0)
     {
      ExtBandsShift=0;
      PrintFormat("Incorrect value for input variable InpBandsShift=%d. Indicator will use value=%d for calculations.",InpBandsShift,ExtBandsShift);
     }
   else
      ExtBandsShift=InpBandsShift;
   if(InpBandsDeviations==0.0)
     {
      ExtBandsDeviations=2.0;
      PrintFormat("Incorrect value for input variable InpBandsDeviations=%f. Indicator will use value=%f for calculations.",InpBandsDeviations,ExtBandsDeviations);
     }
   else
      ExtBandsDeviations=InpBandsDeviations;
//--- define buffers
   // Primeiro mapear os INDICATOR_DATA
   SetIndexBuffer(0, ExtMLBuffer, INDICATOR_DATA);
   SetIndexBuffer(1, ExtTLBuffer, INDICATOR_DATA);
   SetIndexBuffer(2, ExtBLBuffer, INDICATOR_DATA);
   SetIndexBuffer(3, IndOpen, INDICATOR_DATA);
   SetIndexBuffer(4, IndHigh, INDICATOR_DATA);
   SetIndexBuffer(5, IndLow, INDICATOR_DATA);
   SetIndexBuffer(6, IndClose, INDICATOR_DATA);
   // Segundo mapear os INDICATOR_COLOR_INDEX
   SetIndexBuffer(7, IndColor, INDICATOR_COLOR_INDEX);
   
   // Terceiro mapear os INDICATOR_CALCULATIONS
   SetIndexBuffer(8, ExtStdDevBuffer, INDICATOR_CALCULATIONS);
   
   
   
//--- set index labels
   PlotIndexSetString(0,PLOT_LABEL,"Bands("+string(ExtBandsPeriod)+") Middle");
   PlotIndexSetString(1,PLOT_LABEL,"Bands("+string(ExtBandsPeriod)+") Upper");
   PlotIndexSetString(2,PLOT_LABEL,"Bands("+string(ExtBandsPeriod)+") Lower");
//--- indicator name
   IndicatorSetString(INDICATOR_SHORTNAME,"Bollinger Bands");
//--- indexes draw begin settings
   ExtPlotBegin=ExtBandsPeriod-1;
   PlotIndexSetInteger(0,PLOT_DRAW_BEGIN,ExtBandsPeriod);
   PlotIndexSetInteger(1,PLOT_DRAW_BEGIN,ExtBandsPeriod);
   PlotIndexSetInteger(2,PLOT_DRAW_BEGIN,ExtBandsPeriod);
//--- indexes shift settings
   PlotIndexSetInteger(0,PLOT_SHIFT,ExtBandsShift);
   PlotIndexSetInteger(1,PLOT_SHIFT,ExtBandsShift);
   PlotIndexSetInteger(2,PLOT_SHIFT,ExtBandsShift);
//--- number of digits of indicator value
   IndicatorSetInteger(INDICATOR_DIGITS,_Digits+1);
  }
//+------------------------------------------------------------------+
//| Bollinger Bands                                                  |
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
   if(rates_total<ExtPlotBegin)
      return(0);
//--- indexes draw begin settings, when we've recieved previous begin
   if(ExtPlotBegin!=ExtBandsPeriod+indBegin)
     {
      ExtPlotBegin=ExtBandsPeriod+indBegin;
      PlotIndexSetInteger(0,PLOT_DRAW_BEGIN,ExtPlotBegin);
      PlotIndexSetInteger(1,PLOT_DRAW_BEGIN,ExtPlotBegin);
      PlotIndexSetInteger(2,PLOT_DRAW_BEGIN,ExtPlotBegin);
     }
//--- starting calculation
   int pos;
   if(prev_calculated>1)
      pos=prev_calculated-1;
   else
      pos=0;
//--- main cycle
   for(int i=pos; i<rates_total && !IsStopped(); i++)
     {
      //--- middle line
      ExtMLBuffer[i]=SimpleMA(i,ExtBandsPeriod,close);
      //--- calculate and write down StdDev
      ExtStdDevBuffer[i]=StdDev_Func(i,close,ExtMLBuffer,ExtBandsPeriod);
      //--- upper line
      ExtTLBuffer[i]=ExtMLBuffer[i]+ExtBandsDeviations*ExtStdDevBuffer[i];
      //--- lower line
      ExtBLBuffer[i]=ExtMLBuffer[i]-ExtBandsDeviations*ExtStdDevBuffer[i];
      
      // ---
      IndOpen[i]  = open[i];
      IndHigh[i]  = high[i];
      IndLow[i]   = low[i];
      IndClose[i] = close[i];
      
      if(high[i]>ExtTLBuffer[i] && close[i]<ExtTLBuffer[i])
        {
         IndColor[i] = 1; // clrRed
        }
      else if(low[i]<ExtBLBuffer[i] && close[i]>ExtBLBuffer[i])
             {
              IndColor[i] = 0; //clrLime
             }
      else
        {
         IndColor[i] = 2; // clrNONE
        } 
      
      
      
      
     }
//--- OnCalculate done. Return new prev_calculated.
   return(rates_total);
  }
//+------------------------------------------------------------------+
//| Calculate Standard Deviation                                     |
//+------------------------------------------------------------------+
double StdDev_Func(const int position,const double &price[],const double &ma_price[],const int period)
  {
   double std_dev=0.0;
//--- calcualte StdDev
   if(position>=period)
     {
      for(int i=0; i<period; i++)
         std_dev+=MathPow(price[position-i]-ma_price[position],2.0);
      std_dev=MathSqrt(std_dev/period);
     }
//--- return calculated value
   return(std_dev);
  }
//+------------------------------------------------------------------+
