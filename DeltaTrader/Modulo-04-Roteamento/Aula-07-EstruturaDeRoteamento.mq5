//+------------------------------------------------------------------+
//|                                Aula-07-EstruturaDeRoteamento.mq5 |
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
  requisicao.type_filling = ORDER_FILLING_IOC;
  // requisicao.type_filling = ORDER_FILLING_RETURN; Estava dando erro Obs: Talves por conta do tipo de mercado 
  MqlTradeResult result;
  bool ok = OrderSend(requisicao, result);
  Print("res :: ", ok);
  
  
  // Caso a ordem tenha sido enviada para corretora
  if(ok)
    {
         // Tratar o código de retorno
         if(result.retcode == 10008 || result.retcode == 10009) // Ok = ordem colocada / ordem executada
           {
                      
            Print("Ok --> Ordem colocada / executada com sucesso !");
            Print("Preço de execução :: ", result.price, "| Volume executado :: ", result.volume);
           }
          else
            {
              ResetLastError();
              Print("Erro --> erro :: ", result.retcode);
              
              // Enviar um e-mail
              //SendMail();
              
              // Enviar uma notificação
              //SendNotification();
              
              // upload de arquivo de log
              //SendFTP();
              
              // Postar em API o código de erro
              //WebRequest();
              
              //
              //FileSave();
              
              // Requote
              if(result.retcode == 10004)
                {
                 // Tenta enviar a ordem novamente 4x
                 
                }
              
              // Execução Parcial  
              if(result.retcode == 10010)
                {
                 // 
                }
            } 
    } 
   else
     {
      ResetLastError();
      Print("Erro --> erro :: ", GetLastError(), "| Result.retcode :: ", result.retcode);
     }
  }
//+------------------------------------------------------------------+
