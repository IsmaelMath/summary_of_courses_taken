//+------------------------------------------------------------------+
//|                                        Aula-01-TiposDeOrdens.mq5 |
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
   // A MERCADO -- > Execução imediata, porém pode ocorrer slippage
   
   
   // Slippage -- >  Execução da ordem em um preço pior do que originalmente planejado  
   
   
   // LIMIT -- > Ordem onde você especifica o preço | Não existe QUALQUER possibilidade de slipagge
   //            (ou pode até mesmo não ser executada !!!) Especie de ordem pendente               
   
   
   
   // STOP --> É uma ordem A MERCADO !!! | Possui 2 preço relevantes 1. Preço de gatilho 2. Preço de execução 
   //          Pode ter slipagge
   
   
   // STOP LIMIT --> É uma ordem LIMIT !!! | Não tem slipagge! | Possui dois preços relevantes 1. preço de gatilho 2. preço de execução 
   //                Não tem slipagge
   
   
   
   // Regras de herança (aumentos de posição)
   //    Conta netting
   //    Conta hedging
  
  
  
  
  
  }
//+------------------------------------------------------------------+
