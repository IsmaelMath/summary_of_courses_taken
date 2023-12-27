//+------------------------------------------------------------------+
//|                                   14-VariaveisLocaisEGlobais.mq5 |
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
   funcTest();
   sunfunc();
   Print("Soma : ", operacaoSoma);
  }
//+------------------------------------------------------------------+
// --- Váriáveis Locais e Globais

void funcTest(){
   int np1 = 7;
   int np2 = 5;
   
   Print("A operação entre: ", np1, " * ", np2, " = ", np1*np2);
   
} // Variável declarada dentro (ou no escopo) da função 
  // é uma variável Local.
  
int operacaoSoma = 15;
  
int sunfunc(){
   int a = 15;
   int b = 17;
   
   // Prestação atenção no uso operacaoSoma <- a + b; Quando usado
   // dentro da função não há modificação da variável
   operacaoSoma = a + b;
   
   Print("Soma: ", a, " + ", b, " = ", operacaoSoma);
   return operacaoSoma;
   }  
  // Variáveis declaradas fora da função e escopo. É uma
  // variável global.

