//+------------------------------------------------------------------+
//|                         Aula-03-CriandoEInteragindoComBotoes.mq5 |
//|                                  Copyright 2023, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2023, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
   //---
   string objName = "Botao_1";
   if(ObjectFind(0, objName) >=0) ObjectDelete(0, objName);
    
   ObjectCreate(0 ,objName, OBJ_BUTTON, 0, 0, 0);
   ObjectSetInteger(0, objName, OBJPROP_XDISTANCE, 5);
   ObjectSetInteger(0, objName, OBJPROP_YDISTANCE, 40);
   ObjectSetInteger(0, objName, OBJPROP_XSIZE, 70);
   ObjectSetInteger(0, objName, OBJPROP_YSIZE, 30);
   ObjectSetString(0, objName, OBJPROP_TEXT, "Compra");
   ObjectSetInteger(0, objName, OBJPROP_CORNER, CORNER_LEFT_LOWER);
   
   objName = "Botao_2";
   if(ObjectFind(0, objName) >=0) ObjectDelete(0, objName);
    
   ObjectCreate(0 ,objName, OBJ_BUTTON, 0, 0, 0);
   ObjectSetInteger(0, objName, OBJPROP_XDISTANCE, 80);
   ObjectSetInteger(0, objName, OBJPROP_YDISTANCE, 40);
   ObjectSetInteger(0, objName, OBJPROP_XSIZE, 70);
   ObjectSetInteger(0, objName, OBJPROP_YSIZE, 30);
   ObjectSetString(0, objName, OBJPROP_TEXT, " Venda");
   ObjectSetInteger(0, objName, OBJPROP_CORNER, CORNER_LEFT_LOWER);
   ChartRedraw();
   //---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//---
   
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
//---
   
  }
//+------------------------------------------------------------------+
//| ChartEvent function                                              |
//+------------------------------------------------------------------+
void OnChartEvent(const int id,
                  const long &lparam, // É a coordenado x do clique no gráfico
                  const double &dparam,
                  const string &sparam)
  {
//---
  if(id==CHARTEVENT_OBJECT_CLICK)
    {
     if(sparam == "Botao_1")
       {
           Print("Botão pressionado! Compra!");
           Sleep(100);
           ObjectSetInteger(0, sparam, OBJPROP_STATE, false);        
       }
     if(sparam=="Botao_2")
       {
           Print("Botão pressionado! Venda!");
           Sleep(100);
           ObjectSetInteger(0, sparam, OBJPROP_STATE, false);
       }  
     
     ChartRedraw();
    }
  
  
  
  
  
  
  
  
  //Print("Olá, estou dentro de OnchartEven !"); 
  }
//+------------------------------------------------------------------+
