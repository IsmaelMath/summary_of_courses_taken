//+------------------------------------------------------------------+
//|                                            Aula-11-Variaveis.mq5 |
//|                                  Copyright 2023, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2023, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

// ---

   //+------------------------------------------------------------------+
   //|                       VARIÁVIS GLOBAIS                           |
   //+------------------------------------------------------------------+
   
      // Local de declaração de variáveis globais.
      int gl_positionProfit = 0;
      int gl_positionLoss = 0;
      
   

// ---

//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart()
  {
//---
/*   
  // --- Nomeclatura de Variáveis
            
            camelCase
            PascalCase = UpperCamelCase 
            snake_case
            UPPER_SNAKE_CASE
            kebab-case
   
   
   Variáveis locais
   Variáveis globais
   Variáveis entáticas
   
   inicialização de variáveis
*/ 

   
//+------------------------------------------------------------------+
//|               Nomenclatura de variáveis                          |
//+------------------------------------------------------------------+
   

   // camelCase ---> Utilizado apenas quando trabalhamos com variáveis
   int positionProfit = 0;
   
   // PascalCase ---> Utilizado para nomeclatura de funções
   //int PositionLoss() = 0;
   
   // snake_case ---> Quando trabalhamos com variáveis
   int position_loss = 0;
   
   // UPPER_SNAKE_CASE 
   #define  INDICATOR_DATA
   
   //kebab-case
   //int position-average = 0;
   
   
   //Print("Variável global :: ", gl_positionProfit);
   
   Print("Primeira Chamada : ");
   GetPositionProfit();
   
   Print("Segunda Chamada : ");
   GetPositionProfit();
   
   
   
   
   
  }
//+------------------------------------------------------------------+

   // PascalCase ---> Utilizado para nomeclatura de funções
int GetPositionProfit()
   { 
   static int counter = 0;
   for(int i=0;i<10;i++)
     {
      counter++;
      Print("counter :: ", counter);
     }
     return counter;
   }

// --- 09:12

