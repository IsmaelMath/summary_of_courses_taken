//+------------------------------------------------------------------+
//|                                       Aula-05-PainelAvancado.mq5 |
//|                                  Copyright 2023, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2023, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

#include <Controls\Dialog.mqh>
#include <Controls\Label.mqh>
#include <Controls\Panel.mqh>
#include <Controls\Edit.mqh>
#include <Controls\Button.mqh>
// --- 
CAppDialog myPanel;

// bid-ask objects
CLabel myBid;
CEdit myAsk;
CButton myButton;
CButton myButton1;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int panelWidth = 300;
int panelHeight = 300;
int panelXpos = 20;
int panelYpos = 20;

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
//---
   myPanel.Create(0, "Painel_1", 0, panelXpos, panelYpos, panelXpos+panelWidth, panelYpos+panelHeight);
   
   // Acrecentar objetos dentro do painel 
   myBid.Create(0, "BID_1", 0, panelXpos, panelYpos+170, panelXpos+30, panelYpos+30);
   myBid.Text("Texto");
   myBid.Color(clrGreen);
   myBid.ColorBackground(clrSilver);
   myPanel.Add(myBid);
   
   //
   int xPos = panelXpos+120;
   int yPos = panelYpos-8;
   int width = 60;
   int height = 30;
   myAsk.Create(0, "ASK_1", 0, xPos+140, yPos, xPos+width, yPos+height);
   myAsk.Text("Venda");
   myAsk.Color(clrRed);
   myAsk.ColorBackground(clrSilver);
   myAsk.ReadOnly(true);   
   myPanel.Add(myAsk);
   
   
   // Button
   xPos = panelXpos+160;
   yPos = panelYpos+190;
   width = 100;
   height = 50;
   myButton.Create(0, "BUTTON_1", 0, xPos, yPos, xPos+width, yPos+height);
   myButton.Text("CALL");
   myButton.Color(clrWhite);
   myButton.ColorBackground(clrDarkGreen);   
   myPanel.Add(myButton);


   xPos = panelXpos-10;
   yPos = panelYpos+190;
   width = 100;
   height = 50;
   myButton1.Create(0, "BUTTON_2", 0, xPos, yPos, xPos+width, yPos+height);
   myButton1.Text("PUT");
   myButton1.Color(clrWhite);
   myButton1.ColorBackground(clrDarkRed);   
   myPanel.Add(myButton1);   
   // Utilizar o método Run()
   
   
   myPanel.Run();
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//---
   myPanel.Destroy();
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
//---
   MqlTick tick;
   SymbolInfoTick(_Symbol, tick);
   
   myBid.Text("BID = "+DoubleToString(tick.bid, _Digits));
  
   
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
   myPanel.ChartEvent(id, lparam, dparam, sparam);
   if(id==(ON_CLICK+CHARTEVENT_CUSTOM) )
     {
      if(lparam == myButton1.Id())
        {
         Print("Venda Efetuada com Sucesso !");
        }
      if(lparam == myButton.Id())
        {
         Print("Compra Efetuada com Sucesso !");
        }  
      
     }
  }
//+------------------------------------------------------------------+
