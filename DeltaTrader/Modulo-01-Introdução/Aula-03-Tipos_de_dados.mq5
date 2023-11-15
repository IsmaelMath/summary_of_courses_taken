//+------------------------------------------------------------------+
//|                                       Aula-03-Tipos_de_dados.mq5 |
//|                                  Copyright 2023, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2023, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
void OnStart()
  {
//--- create timer

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
/*
   int
   uint
   char
   uchar
   long
   ulong
   short
   ushort
*/   
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
/*
   int
   uint
   char
   uchar
   long
   ulong
   short
   ushort
   

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



 --- TIPOS DE DADOS COMPLEXOS
 
   struct
   class
   


   struct STR_PERSON
     {
      
      string nome;
      int idade;
      double peso;
      color cor_cabelo; 
      
     };
     STR_PERSON worker1;
     STR_PERSON worker2;
     
     worker1.nome = "Maria"
     worker1.idade = 25;
     worker1.peso = 75.4;
     worker1.cor_cabelo = clrYellow;
     
     worker1.nome = "Ismael"
     worker1.idade = 29;
     worker1.peso = 95.4;
     worker1.cor_cabelo = clrBlack;     
     
     Print("Idade do trabalhador :: ", worker1.idade);
   
   
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



 --- TIPOS DE DADOS COMPLEXOS
 
   struct
   class
   

*/

   struct STR_PERSON
     {
      
      string nome;
      int    idade;
      double peso;
      color  cor_cabelo; 
      
     };
  
  STR_PERSON worker1;
  
  STR_PERSON worker2;
  
  //
  
  worker1.nome = "Maria";
  worker1.idade = 35;
  worker1.peso = 75.4;
  worker1.cor_cabelo = clrYellow;
  
  //
  
  worker2.nome = "Ismael";
  worker2.idade = 29;
  worker2.peso = 95.4;
  worker2.cor_cabelo = clrBlack;     
  
  Print("Idade do trabalhador :: ", worker1.idade);
  
  
  // --- CLASSES
  //  Declaração de uma variável
   myTrader firstTrader;
   myTrader secondTrader;
//---


   // --- Tipos de Dados Personalizados
   int a = 10;
   int b = 20;
   int c = operation(a, b, addition);
   Print("Resultado da Função :: ", c);
  }

//+------------------------------------------------------------------+


// Definição do Tipo de dados

class myTrader
  {
private:

protected:
  
public:
                     myTrader(void); // Construtor
                    ~myTrader(void); // Destrutor
  };

void myTrader:: myTrader(void)
   {
      Print("Olá, eu sou o construtor. ");
   }
void myTrader::~myTrader(void)
   {
      Print("Olá, eu sou o destrutor. ");  
   }



// ---

typedef int (*MyFunctionType) (int, int);

// Definição de Função
int addition(int a, int b)
   {
      
      return (a+b);
   }
int subtratction(int a, int b)
   {
   
      return (a-b);
   }
int operation(int x, int y, MyFunctionType myFunc)
   {
      int r = myFunc(x, y);
      
      return (r);
   }