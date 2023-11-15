//+------------------------------------------------------------------+
//|                                  Aula-04-CriandoPaineisNoMT5.mq5 |
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
   // --- OBJ_TEXT
   /*
   string objName = "text_1";
   if(ObjectFind(0, objName) >=0) ObjectDelete(0, objName);
   ObjectCreate(0 ,objName, OBJ_TEXT, 0, D'2023.09.20 21:15:00', 120505);
   ObjectSetString(0, objName, OBJPROP_TEXT, "TEXTO");
   ObjectSetInteger(0, objName, OBJPROP_CORNER, CORNER_LEFT_LOWER);
   */
   
   //
   int numLinhas = 10;
   int numColunas = 3;
   
   //
   int altura = 35;
   int largura = 65;
   
   for(int i=0;i<numLinhas;i++)
     {
      for(int j=0;j<numColunas;j++)
        {
            string objName = "label_"+IntegerToString(i)+"_"+IntegerToString(j);
            int x = 20 + j*largura;
            int y = 80 + i*altura;
         
         //
         if(j==0)
           {
            CreatEdit(objName, x, y, largura, altura);
           }   
          else
            {
             CreatLabel(objName, x, y, largura, altura);
            }
        }
     }
 
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//---
   ObjectsDeleteAll(0, 0);
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
//---
   int total = ObjectsTotal(0,0);
   
   for(int i=0;i<total;i++)
     {
      string objName = ObjectName(0, i, 0, OBJ_EDIT);
      string ativo = ObjectGetString(0, objName,OBJPROP_TEXT);
      if(ativo != " - ")
        {
         //Print("Nome do Objeto: ", objName, "| Texto: ", ObjectGetString(0, objName, OBJPROP_TEXT));
         MqlTick tick; 
         
         if(SymbolInfoTick(ativo, tick))
           {
            // Se os dados foram corretamente capturados
            string objName2 = StringSubstr(objName, 0, StringLen(objName)-1);
            
            // BID
            int decimalPlaces = int( SymbolInfoInteger(ativo,SYMBOL_DIGITS) );
            objName2 += "1";
            ObjectSetString(0, objName2, OBJPROP_TEXT,DoubleToString(tick.bid, decimalPlaces));
            
            // ASK
            objName2 = StringSubstr(objName, 0, StringLen(objName)-1);
            objName2 += "2";
            
            //
            ObjectSetString(0, objName2, OBJPROP_TEXT,DoubleToString(tick.ask, decimalPlaces));
           }
        
        }
     }
   
  }
//+------------------------------------------------------------------+
//| ChartEvent function                                              |
//+------------------------------------------------------------------+
void OnChartEvent(const int id,
                  const long &lparam,
                  const double &dparam,
                  const string &sparam)
  {
//---
   
  }
//+------------------------------------------------------------------+

bool CreatLabel(string objName, int x_dist, int y_dist, int largura, int altura)
   {
       // --- OBJ_LABEL
      
      if(ObjectFind(0, objName) >=0) ObjectDelete(0, objName);
       
      ObjectCreate(0 ,objName, OBJ_EDIT, 0, 0, 0);
      ObjectSetInteger(0, objName, OBJPROP_XDISTANCE, x_dist);
      ObjectSetInteger(0, objName, OBJPROP_YDISTANCE, y_dist);
      ObjectSetInteger(0, objName, OBJPROP_XSIZE, largura);
      ObjectSetInteger(0, objName, OBJPROP_YSIZE, altura);
      ObjectSetString(0, objName, OBJPROP_TEXT, "-");
      ObjectSetString(0, objName, OBJPROP_FONT, "Consolas");
      ObjectSetInteger(0, objName, OBJPROP_FONTSIZE, 8);
      ObjectSetInteger(0, objName, OBJPROP_COLOR, clrWhite);
      ObjectSetInteger(0, objName, OBJPROP_BGCOLOR, clrDarkBlue);
      ObjectSetInteger(0,objName,OBJPROP_ALIGN,ALIGN_CENTER);
      ObjectSetInteger(0, objName, OBJPROP_SELECTABLE, false);
      ObjectSetInteger(0, objName, OBJPROP_READONLY, true);
      
      ObjectSetInteger(0, objName, OBJPROP_CORNER, CORNER_LEFT_LOWER);
      
   
      return true;
   }

bool CreatEdit(string objName, int x_dist, int y_dist, int largura, int altura)
   {
      // --- OBJ_EDIT
      
      if(ObjectFind(0, objName) >=0) ObjectDelete(0, objName);
       
      ObjectCreate(0 ,objName, OBJ_EDIT, 0, 0, 0);
      ObjectSetInteger(0, objName, OBJPROP_XDISTANCE, x_dist);
      ObjectSetInteger(0, objName, OBJPROP_YDISTANCE, y_dist);
      ObjectSetInteger(0, objName, OBJPROP_XSIZE, largura);
      ObjectSetInteger(0, objName, OBJPROP_YSIZE, altura);
      ObjectSetString(0, objName, OBJPROP_TEXT, " - ");
      ObjectSetString(0, objName, OBJPROP_FONT, "FreeMono");
      ObjectSetInteger(0, objName, OBJPROP_FONTSIZE, 8);
      ObjectSetInteger(0, objName, OBJPROP_COLOR, clrBeige);
      ObjectSetInteger(0, objName, OBJPROP_BGCOLOR, clrBlack);
      ObjectSetInteger(0, objName, OBJPROP_ALIGN, ALIGN_CENTER);
      ObjectSetInteger(0, objName, OBJPROP_CORNER, CORNER_LEFT_LOWER);
      
   
      return true;
   }



















