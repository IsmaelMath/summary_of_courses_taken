//+------------------------------------------------------------------+
//|                                           Aula-01-Introducao.mq5 |
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

 --- PALAVRAS RESERVADAS
   
   bool
   float
   uint
   char
   int
   ulong
   class
   long
   union
   color
   short
   ushort
   datetime
   string
   void
   double
   struct
   enum
   uchar

 --- ESPECIFICADORES DE ACESSO
 
   const 
   private
   virtual
   delete
   protected
   override
   public


 --- CLASSES DE MEMÓRIA
   
   extern
   input
   static 

 --- OPERADORES

   break
   dynamic_cast
   operador
   case
   else
   pack
   continue
   for
   return
   default
   if
   sizeof
   delete
   new
   switch
   do
   offsetof
   while

 --- OUTROS
 
   this
   #define
   #import
   true
   #ifdef
   #include
   false
   #ifndef
   #property
   template
   #else
   group
   typename
   #endif
   namespace
   typedef
 
*/








