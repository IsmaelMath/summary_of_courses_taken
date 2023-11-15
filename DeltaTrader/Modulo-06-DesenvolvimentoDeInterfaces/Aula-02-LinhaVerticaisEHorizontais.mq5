//+------------------------------------------------------------------+
//|                           Aula-02-LinhaVerticaisEHorizontais.mq5 |
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
//---
   ObjectCreate(0, "Linha_vertical_1",OBJ_VLINE, 0, D'2023.09.20 16:40:00', 0);
   ObjectSetInteger(0, "Linha_vertical_1", OBJPROP_COLOR,clrBlue);
   
   ObjectCreate(0, "Linha_vertical_2", OBJ_VLINE, 0, D'2023.09.20 16:00:00',0);
   ObjectSetInteger(0, "Linha_vertical_2", OBJPROP_COLOR, clrRosyBrown);
   
   ObjectCreate(0, "Linha_vertical_3", OBJ_VLINE, 0, D'2023.09.20 16:20:00',0);
   ObjectSetInteger(0, "Linha_vertical_3", OBJPROP_COLOR, clrBlack);
   
   ObjectCreate(0, "Linha_horizontal_1", OBJ_HLINE, 0, D'2023.09.20 16:00:00',1.07160);
   ObjectSetInteger(0, "Linha_horizontal_1", OBJPROP_COLOR, clrMaroon);
   
   ObjectCreate(0, "Linha_horizontal_2", OBJ_HLINE, 0, D'2023.09.20 16:00:00',1.07100);
   ObjectSetInteger(0, "Linha_horizontal_2", OBJPROP_COLOR, clrMaroon);
   ObjectSetInteger(0, "Linha_horizontal_2", OBJPROP_STYLE, STYLE_DASHDOT);
   ObjectSetInteger(0, "Linha_horizontal_2", OBJPROP_WIDTH, 1);
  }
//+------------------------------------------------------------------+
