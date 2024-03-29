//+------------------------------------------------------------------+
//|                                              Aula-08-Funcoes.mq5 |
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
// ---
   /*
         Tipo de uma função
         Escopo de uma função
         
         Função sem retorno
         Função com retorno
         
         Funções sem argumentos 
         Funções com argumentos
         Funções de tipo void
         Passagem de parâmetros
   */
   
   //+------------------------------------------------------------------+
   //|                   Chamada de uma função                          |
   //+------------------------------------------------------------------+
   
   //FuncaoCom();  
   //FuncaoSem();
   
   
   //+------------------------------------------------------------------+
   //|         Capturar o retorno das funções sem retornos              |
   //+------------------------------------------------------------------+
   
   //int resultado = FuncaoCom();
   //Print("Resultado :: ", resultado);
   
   
   //int var1 = 10;
   //int var2 = 20;
   
   //int resultado = FuncaoComArgRet(var1,var2);
   //Print("Resultado :: ", resultado);
   //FuncaoComArgVoid(var1,var2);
     
     
     //int var3 = 10;
     
     //Print("Antes da execução da função, var3 = ", var3);
     
     //FuncaoQueSoResebe(var3);
     
     //Print("Apos a execução da função, var3 = ", var3);
     
     
     int var3 = 10;
     
     Print("Antes da execução da função, var3 = ", var3);
     
     FuncaoQueResebeEAltera(var3);
     
     Print("Apos a execução da função, var3 = ", var3);
     
   }

   // --- Função SEM argumentos
      // --- Funções com Retornos
         
         // Inteiros (char, short, int, long, ushort, uint, ulong);
         // Lógicos (bool);
         // Literais (ushort);
         // Strings (strings);
         // Números com Ponto Flutuante (double, float);
         // Cor (color);
         // data e hora(datetime);
// ---
void FuncaoQueSoResebe(int arg1)
   {
         arg1 = 20;  
         Print("Arg1 :: ", arg1);
   }      

// ---
void FuncaoQueResebeEAltera(int &arg1)
   {
         arg1 = 20;
         Print("Arg1 :: ", arg1);
   }      
// ---


          
int FuncaoCom()   
   {
   
   
   Print("Estou dentro da função COM retorno !");
   int calculo = 15;
   //calculo = calculo * 2; // ou
   calculo *= 2;
   return calculo;
   }


  
      // --- Funções sem Retornos

         // void
         

void FuncaoSem()
   {
   
   Print("Estou dentro da função SEM retorno");
   }
   
  
   // --- Função COM Argumentos   
   // --- Função COM Retorno
int FuncaoComArgRet(int arg1, int arg2)
   {
   
    Print("Estou dentro da função com argumento.");
    Print("Argumento 1 :: ",  arg1);
    Print("Argumento 2 :: ",  arg2);
      
    return arg1 + arg2;
   }
   
   // --- Função SEM Retorno
void FuncaoComArgVoid(int arg1, int arg2)
   {
    int soma = arg1 + arg2;
    Print("Dentro da função SEM retorno, eu calculei que soma :: ", soma);  
   }










// ---    
  
//+------------------------------------------------------------------+
