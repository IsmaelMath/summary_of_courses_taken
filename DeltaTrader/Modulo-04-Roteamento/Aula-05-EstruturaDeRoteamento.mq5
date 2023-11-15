//+------------------------------------------------------------------+
//|                                Aula-05-EstruturaDeRoteamento.mq5 |
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
   //
   MqlTradeRequest requisicao;
  
  // 5 caracteristicas básicas de uma ordem
  // [ok] Tipo
  // [ok] Ativo
  // [ok] Validade
  // [ok] Preço
  // [ok] Quantidade
  
  // Ordem de compra a mercado
  requisicao.action = TRADE_ACTION_DEAL;
  requisicao.type = ORDER_TYPE_BUY;
  requisicao.symbol = _Symbol;
  requisicao.type_time = ORDER_TIME_DAY;
  requisicao.volume = 0.1;
  requisicao.comment = "Compra a mercado";
  requisicao.deviation = 0;
  requisicao.expiration = 0;
  requisicao.magic = 1234;
  requisicao.sl = 0;
  requisicao.tp = 0;
  requisicao.type_filling = ORDER_FILLING_RETURN;
  
  MqlTradeResult result;
  bool res = OrderSend(requisicao, result);
  
  Print("res :: ", res);
  
  }
//+------------------------------------------------------------------+
