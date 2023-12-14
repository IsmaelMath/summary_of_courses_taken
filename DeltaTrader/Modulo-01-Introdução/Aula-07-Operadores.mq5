//+------------------------------------------------------------------+
//|                                           Aula-07-Operadores.mq5 |
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
/*
   - Operadores composto {}
   - Operador de Expressão (;)
   - return operador
   - if-else operador condicional
   - ?: operador condicional
   - switch operador de seleção
   - while operador de loop
   - for operador de loop
   - break operador
   - continue operador
   - new operador
   - delete operador



   
   
   return
   if
   else
   switch
   while
   do
   break
   continue
   new
   delete


   // --- OPERADOR RETURN
   
   Print("Estou na linha 47");
   return;
   Print("Estou na linha 49");
   
   // --- OPERADOR IF
   
   if(false)
     {
      Print("Estou na linha 55");
     }
   Print("Estou na linha 55");
   

   // --- ELSE --> Apenas funciona em conjunto com um operador if
   
   if(true)
     {
      Print("Estou na linha 64");
     }   
   else
     {
      Print("Estou na linha 68");
     }

   int idade = 30;
   
   if(idade==10)
     {
      Print("Você não pode operar na bolsa);
     }
   else if(idade == 20)
          {
           Print("Você ainda n tem dinheiro na bolsa");
          }
   else if(idade == 30)
          {
           Print("Você já tem um pocu de dinheiro para operar na bolsa");
          }
   else
     {
      Print("Agora sim você tem dinheiro para operar na bolsa");
     }
   
   // --- Switch -- > Mesma coisa que varios ifs concatenado....Exemplo acima e abaixo
   
   switch(idade)
     {
      
      case 10:
        Print("Você não pode operar na bolsa);
        break;
      
      case 20:
         Print("Você ainda n tem dinheiro na bolsa");
         break;
      
      case 30:
         Print("Você já tem um pocu de dinheiro para operar na bolsa");
         break;     
      
      default:
        Print("Agora sim você tem dinheiro para operar na bolsa");
        break;
     }



   // --- OPERADOR WHILE
   int contador = 0;
   while(contador < 10)
     {
     contador++;
      Print("Estou na linha 119. contador :: ", contador);
      
     }


   int cont = 0;
   do
     {
     cont++;
      Print("Estou na linha 127. contador :: ", cont);
     }
   while(cont < 10);
   


   // --- Break
   int contador = 0;
   while(true)
     {
      contador++;
      Print("Estamos na linha 139. contador :: ", contador);
      //
      if(contador ==10)
        {
         break;
        }
     }
   
   // --- Continue
   int contador = 0;
   while(true)
     {
      contador++;
      Print('Estou na linha 151. Contador :: ', contador);
      
      if(contador < 10)
        {
         continue;
        }
     } else
         {
          
          break;
         }
*/

   for(int contador=0; contador < 10; contador++)
     {
      Print("Estou na linha 151. Contador :: ", contador);
      
     }

   // --- for loop com continue
   
   for(int cont = 0; cont < 10; cont++)
     {
      
      if(cont < 5)
        {
         Print("Estou na linha 157. Contador :: ", cont);
         continue;
        }
     }
   
  }
//+------------------------------------------------------------------+
