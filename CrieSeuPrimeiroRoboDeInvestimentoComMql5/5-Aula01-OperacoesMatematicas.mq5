//+------------------------------------------------------------------+
//|                                       1-OperacoesMatematicas.mq5 |
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
   Print("Adição : ", VarA, "| Multiplicação : ", VarE,"| Divisão : ", 
          VarF, "| Divisão int :", VarG);
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
//| Trade function                                                   |
//+------------------------------------------------------------------+
void OnTrade()
  {
//---
   
  }
//+------------------------------------------------------------------+


// --- Operações Matemáticas

// ---
// Adição

int VarA = 2 + 3;

double VarB = 2.5 + VarA;

double Varc = VarA - VarB;

// --- 
// Multiplicação

int VarD = 2 * 3;
double VarE = 2.5 * VarD;


// ---
// Divisão

double VarF = 5/2;

int VarG = 5/2;
