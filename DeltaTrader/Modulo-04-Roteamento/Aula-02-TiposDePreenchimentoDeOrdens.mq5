//+------------------------------------------------------------------+
//|                         Aula-02-TiposDePreenchimentoDeOrdens.mq5 |
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
   // FOK --> Fill Or Kill (Imediatamente  E completamente ou nada)
   // Book: 5000 ações
   // Ordem: 10000 ações
   // Executa: 0
   // Pendente: 0 
   
   // IOC --> Imediate Or Cancel (Imediatamente o que for possível sem deixar nada pra trás)
   // Book: 5000 ações
   // Ordem: 10000 ações
   // Executa: 5000
   // Pendente: 0   
   
   // RETURN --> (Imediatamente o que for possível, deixando o saldo no boo de ofertas)
   // Book: 5000 ações
   // Ordem: 10000 ações
   // Executa: 5000
   // Pendente: 0   
   
  }
//+------------------------------------------------------------------+
