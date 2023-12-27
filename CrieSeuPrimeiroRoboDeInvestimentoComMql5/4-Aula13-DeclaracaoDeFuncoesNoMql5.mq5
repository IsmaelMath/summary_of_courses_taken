//+------------------------------------------------------------------+
//|                                    DeclaracaoDeFuncoesNoMql5.mq5 |
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
   soma(14, 35);
   Div(12.75, 0.412, true);
  }
//+------------------------------------------------------------------+


// Função soma:
void soma(int a, int b, bool imprimir = false){
   
   int operacao;
   
   operacao = a + b;
   
   if(imprimir)
     {
      Print("O Valor da Operação ", a, " + ", b, " = ", operacao);
     }   
}

double Div(double n, double m, bool imprimir = false){
   
   if(m==0)
     {
      Print("Não existe divisão por 0.");
      return 0;
     }
   double operacao = n / m;
   
   if(imprimir)
     {
      Print("O Valor da Operação ", n, " / ", m, " = ", operacao);
     }
   return operacao;
}






