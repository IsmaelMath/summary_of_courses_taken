//+------------------------------------------------------------------+
//|                                       Aula-02-Tipos_de_dados.mq5 |
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
//--- create timer
   EventSetTimer(60);
   
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//--- destroy timer
   EventKillTimer();
   
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
//---
   
  }
//+------------------------------------------------------------------+
//| Timer function                                                   |
//+------------------------------------------------------------------+
void OnTimer()
  {
//---
   
  }
//+------------------------------------------------------------------+

/*

 --- TIPOS DE DADOS - BÁSICOS
 
 Inteiros (char, short, int, long, uchar, uint, ulong);
 Lógicos  (bool);
 Literais (ushort);
 Strings  (string);
 Números com pontos flutuantes (double, float);
 Cor (color);
 data e hora (datetime);
 Enumeradores (enum).
 
 --- TIPOS DE DADOS - COMPLEXOS
 
 Struct;
 class.
 
 --- TIPOS PERSONALIZADOS
 
 Typedef.







*/

// --- TIPOS DE DADOS BÁSICOS

   uint distance = 1000;
   //Print("Distância ", distance); // Variável uint é somente para números inteiros
   
   bool result1 = false;
   bool result2 = true;
   
   string name = "Ismael";
   
   double saldo = 1500.25;
   float percentual = 0.958f; // para trucar as casas decimais podemos fazer 0.985f 
   
   color panelColor = clrBlack;
   color bgColor = C'128, 128, 228'; // cinza
   
   datetime worldCupFinalTime = D'2002.07.22 14:00:00'
    
   enum ENUM_DAYS
     {
      DAY_1, // DAY_1
      DAY_2, // DAY_2
      DAY_3, // DAY_3
      DAY_4  // DAY_4
     };