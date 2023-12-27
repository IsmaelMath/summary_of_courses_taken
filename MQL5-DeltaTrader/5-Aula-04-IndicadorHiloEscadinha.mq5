//+------------------------------------------------------------------+
//|                                                         HiLo.mq5 |
//|                                  Copyright 2010, Charly King Her |
//|                                   www.bussinessclubworldwide.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2010, Charly King Her"
#property link      "www.bussinessclubworldwide.com"
#property version   "1.00"
//+------------------------------------------------------------------+
#property indicator_chart_window
#property indicator_buffers 11
#property indicator_plots   2

//+------------------------------------------------------------------+
// Escadinha de Alta
#property indicator_type1   DRAW_BARS
#property indicator_color1  clrGreen
#property indicator_style1  STYLE_SOLID
#property indicator_width1  2
#property indicator_label1  "Hilo Up"

//+------------------------------------------------------------------+
// Escadinha de Baixa
#property indicator_type2   DRAW_BARS
#property indicator_color2  clrRed
#property indicator_style2  STYLE_SOLID
#property indicator_width2  2
#property indicator_label2  "Hilo Down"

//+------------------------------------------------------------------+
// Input Parameters
input int      InpPeriod=10; // Periodo
input ENUM_MA_METHOD InpMethod=MODE_SMMA; // Method 

//+------------------------------------------------------------------+
// Buffers
double  MaHighBuffer[], MaLowBuffer[], TrendBUffer[]; //ColorBuffer[], GannBuffer[]

//+------------------------------------------------------------------+
// Buffers de Alta
double Up_Open[];
double Up_High[];
double Up_Low[];
double Up_Close[];

// Buffers de Baixa
double Down_Open[];
double Down_High[];
double Down_Low[];
double Down_Close[];
//+------------------------------------------------------------------+
// GLOBAIS VARS
int ma_high_handle,ma_low_handle, period;
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
   // --- Check Period
   period = (int)fmax(InpPeriod,2);
   
   // --- OHLC de Alta
   SetIndexBuffer(0, Up_Open,  INDICATOR_DATA);
   SetIndexBuffer(1, Up_High,  INDICATOR_DATA);
   SetIndexBuffer(2, Up_Low,   INDICATOR_DATA);
   SetIndexBuffer(3, Up_Close, INDICATOR_DATA);
   

   // --- OHLC de Baixa
   SetIndexBuffer(4, Down_Open,  INDICATOR_DATA);
   SetIndexBuffer(5, Down_High,  INDICATOR_DATA);
   SetIndexBuffer(6, Down_Low,   INDICATOR_DATA);
   SetIndexBuffer(7, Down_Close, INDICATOR_DATA);
   
   // --- Demais Buffers
   SetIndexBuffer(8, MaHighBuffer,  INDICATOR_CALCULATIONS);
   SetIndexBuffer(9, MaLowBuffer,   INDICATOR_CALCULATIONS);
   SetIndexBuffer(10, TrendBUffer,   INDICATOR_CALCULATIONS);
   
   
   // --- Set direction
   ArraySetAsSeries(Up_Open, true);
   ArraySetAsSeries(Up_High, true);
   ArraySetAsSeries(Up_Low, true);
   ArraySetAsSeries(Up_Close, true);
   
   
   ArraySetAsSeries(Down_Open, true);
   ArraySetAsSeries(Down_High, true);
   ArraySetAsSeries(Down_Low, true);
   ArraySetAsSeries(Down_Close, true);

   //ArraySetAsSeries(GannBuffer, true);
   //ArraySetAsSeries(ColorBuffer, true);
   ArraySetAsSeries(MaHighBuffer, true);
   ArraySetAsSeries(MaLowBuffer, true);
   ArraySetAsSeries(TrendBUffer, true);
   
   // --- Get Handles 
   ma_high_handle= iMA(NULL, 0, period, 0, InpMethod, PRICE_HIGH);
   ma_low_handle = iMA(NULL, 0, period, 0, InpMethod, PRICE_LOW);
   if(ma_high_handle==INVALID_HANDLE || ma_low_handle==INVALID_HANDLE)
     {
      Print("Unable to create handle for iMA");
      return INIT_FAILED;
     }
  
  // --- Set Indicator Propertiles
  string short_name = StringFormat("Gain High-Low Activate SSL (%u, %s)", period, StringSubstr(EnumToString(InpMethod), 5));
  IndicatorSetString(INDICATOR_SHORTNAME, short_name);
  IndicatorSetInteger(INDICATOR_DIGITS, _Digits);
  
  // --- Set Label
  short_name = StringFormat("GHL (%u, %s)", period, StringSubstr(EnumToString(InpMethod), 5));
  PlotIndexSetString(0, PLOT_LABEL, short_name);
  
  // --- done
  return INIT_SUCCEEDED;
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

   if(rates_total<period+1) return(0);
   ArraySetAsSeries(close, true);
   // ---
   int limit;
   if(rates_total<prev_calculated || prev_calculated <=0)
     {
      limit = rates_total - period-1;
      
      ArrayInitialize(Up_Open, EMPTY_VALUE);
      ArrayInitialize(Up_High, EMPTY_VALUE);
      ArrayInitialize(Up_Low, EMPTY_VALUE);
      ArrayInitialize(Up_Close, EMPTY_VALUE);
      
      
      ArrayInitialize(Down_Open, EMPTY_VALUE);
      ArrayInitialize(Down_High, EMPTY_VALUE);
      ArrayInitialize(Down_Low, EMPTY_VALUE);
      ArrayInitialize(Down_Close, EMPTY_VALUE);
      
      
      
      
      //ArrayInitialize(GannBuffer, EMPTY_VALUE);
      //ArrayInitialize(ColorBuffer, 0);
      ArrayInitialize(MaHighBuffer, 0);
      ArrayInitialize(MaLowBuffer, 0);
      ArrayInitialize(TrendBUffer, 0); 
     } 
   else
      limit=rates_total - prev_calculated;
     
   
   // --- Get MA
   if(CopyBuffer(ma_high_handle, 0, 0, limit+1, MaHighBuffer) != limit + 1)return 0;
   if(CopyBuffer(ma_low_handle, 0, 0, limit+1, MaLowBuffer) != limit + 1)return 0; 
   
   // --- Main Cycle
   for(int i=limit;i>=0 && !_StopFlag;i--)
     {
      TrendBUffer[i]=TrendBUffer[i+1];
      
      // ---
      if(NormalizeDouble(close[i], _Digits)>NormalizeDouble(MaHighBuffer[i+1], _Digits)) TrendBUffer[i] = 1;
      if(NormalizeDouble(close[i], _Digits)<NormalizeDouble(MaLowBuffer[i+1], _Digits)) TrendBUffer[i] = -1;
      
      // --- Escadinha de Baixa
      if(TrendBUffer[i]<0)
        {
         //GannBuffer[i] = MaHighBuffer[i];
         //ColorBuffer[i] = 1;
         if(MaHighBuffer[i] < MaHighBuffer[i])
           {
               Down_Open[i] = MaHighBuffer[i+1];
               Down_High[i] = MaHighBuffer[i+1];
               Down_Low[i] = MaHighBuffer[i];
               Down_Close[i] = MaHighBuffer[i];            
           }
          else
            {
               Down_Open[i] = MaHighBuffer[i+1];
               Down_High[i] = MaHighBuffer[i];
               Down_Low[i] = MaHighBuffer[i+1];
               Down_Close[i] = MaHighBuffer[i];
            } 
         
        }
      
      // --- Escadinha de Alta
      if(TrendBUffer[i]>0)
        {
         //GannBuffer[i] = MaLowBuffer[i];
         //ColorBuffer[i] = 0;
         if(MaLowBuffer[i]> MaLowBuffer[i+1])
           {
               Up_Open[i] = MaLowBuffer[i+1];
               Up_High[i] = MaLowBuffer[i];
               Up_Low[i] = MaLowBuffer[i+1];
               Up_Close[i] = MaLowBuffer[i];
           }
         else
           {
               Up_Open[i] = MaLowBuffer[i+1];
               Up_High[i] = MaLowBuffer[i];
               Up_Low[i] = MaLowBuffer[i+1];
               Up_Close[i] = MaLowBuffer[i];
           }  
               
        }
        }
        
      // --- Done
      return rates_total;
      
      }
//+------------------------------------------------------------------+
