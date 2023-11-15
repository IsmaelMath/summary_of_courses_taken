//+------------------------------------------------------------------+
//|                                   Aula-08-Incluindo_recursos.mq5 |
//|                                  Copyright 2023, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2023, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

//+------------------------------------------------------------------+
//|                    IMPORTANDO OS ARQUIVOS                        |
//+------------------------------------------------------------------+

#resource "\\Images\\dollar.bmp"
#resource "\\Files\\Numb.wav"
//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart()
  {
   // --- Recursos
   // 1) Arquivos de imagem (bmp)
   // 2) Arquivos de som (Wav)
   
   // Arquivos de imagem
   // - Precisam ser gravados no formato BMP de 24 bits
   
   PlaySound("::Files\\Numb.wav");
   ObjectSetString(0, "dollar_img",OBJPROP_BMPFILE, "::Images\\dollar.bmp");
   ObjectCreate(0, "dollar_img", OBJ_BITMAP, 0, TimeCurrent(), 119000);
   ChartRedraw();
  }
//+------------------------------------------------------------------+
