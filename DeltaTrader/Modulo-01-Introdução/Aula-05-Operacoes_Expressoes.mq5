//+------------------------------------------------------------------+
//|                                 Aula-05-Operacoes_Expressoes.mq5 |
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

   - Expressoões;
   - Operações Aritmédicas;
   - Operações de Atribuição;
   - Operações de Relação;
   - Operações de Booleanos;
   - Operações Binárias;
   - Outras Operações;
   - Regras de Precedência.


 - EXPRESSÕES NUMÉRICAS
 - EXPRESSÕES ALGÉBRICAS
 
   (2 + 2 x 2) = 6 --- > Ex. Num.
   (x + 10) = 15 --- > Ex. Alg.
   
 - OPERAÇÕES ARITMÉDICAS
   + - * /


*/
   double a = 10;
   double b = 20;
   
   // resultados
   double    c = a + b;
   double    d = a - b;
   double    e = a * b;
   double    f = a / b;
   
   Print("Soma = ", c);
   Print("Subtração = ", d);
   Print("Multiplicação = ", e);
   Print("Divisão = ", f);
   
   // 
   
   int contador = 0;
   Print("Contador :: ", contador);
   contador++;
   Print("Contador :: ", contador);
   contador++;
   Print("Contador :: ", contador);
   
   int x = 3;
   int y = x;
   
   int z = y;
   z += x; // Operação Arientmédica e de atribuição
   z -= x; // Operação subtração e de atribuição
   z *= x; // Operação de Multiplicação e de atribuição
   z /= x; // Operação de Divisão e de atribuição
   Print("Valor de z :: ", z);
   
   bool resp = (x == y);
   bool dif = (x != y);
   
   Print("x é igual a y :: ", resp);
   Print("x é diferente de y :: ", dif);
   
   // --- OPERAÇÕES BOLEANAS
   
   bool comprado = false;
   bool vendido = true;
   
   // OU = ||
   bool posicionado = comprado || vendido;
   
   Print("Posicionado :: ", posicionado);
   
   // E = &&
   bool tem_erro = comprado && vendido;
   
   Print("Tem erro :: ", tem_erro);
   
   // --- OUTRAS OPERAÇÕES
   // () --> isola cálculo matémático OU chamadas de função
   // [] --> Referênciar o elemento de um array
   // . --> Acessar alementos de uma função
  
  }
  
//+------------------------------------------------------------------+


























