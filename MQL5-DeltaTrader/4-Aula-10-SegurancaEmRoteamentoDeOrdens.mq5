//+------------------------------------------------------------------+
//|                        Aula-10-SegurancaEmRoteamentoDeOrdens.mq5 |
//|                                  Copyright 2023, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2023, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
#include  <Trade\Trade.mqh>

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
CTrade trade;

//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart()
  {
//+------------------------------------------------------------------+
//| ORDEM A MERCADO                                                  |
//+------------------------------------------------------------------+

ulong start = GetMicrosecondCount();
bool ok = trade.Buy(0.01, _Symbol, 0, 0, 0, "Compra a Mercado");
   if(ok)
     {
      if(trade.ResultRetcode() == 10008 || trade.ResultRetcode() == 10009)
        {
         double latencia = double(GetMicrosecondCount() - start)/1000;
         Print("Ordem Executada ... Latência :: ", latencia);
        }
     }
 



   
   // 1. IsNewBar -- > mecanismo mais simples seguro de Proteção de uma conta.
   //    Ontick -- > NÃO OPERAR
   
   // 2. Sempre verificar o retorno das funções de roteamento (bool).
   //
   
   // 3. Sempre verificar o RETCODE das operações de roteamentos.
   //
   
   // 4. De preferência para desenvolvimento utilizando conta REAL !!!
   //
   
   // 5. Fazer verificação básicas com frequência 
   // PING Latencia.
   // Perdas de pacote.
   // verificações relacionadas a maquina. (memória e espaço em disco)
   
   // 6. Fazer verificação da latência
   
   
   // Leitura Obrigatoria
  }
//+------------------------------------------------------------------+
