//+------------------------------------------------------------------+
//|                                          11-TipoEspecialEnum.mq5 |
//|                                  Copyright 2023, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2023, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
// ---

#define  PI 3.1415
#define  NOME_EMPRESA "QUANTDEV"

// ENUM
enum Estacoes_ano
  {
   Primavera, 
   Verao, 
   Outono, 
   Inverno
  };



//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart()
  {
//---
   Estacoes_ano estacao;
   
   estacao = Verao * Outono;
   Print("Valor correspondente: ", estacao);
  }
//+------------------------------------------------------------------+
