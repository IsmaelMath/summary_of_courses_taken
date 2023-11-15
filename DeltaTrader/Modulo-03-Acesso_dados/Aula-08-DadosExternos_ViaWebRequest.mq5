//+------------------------------------------------------------------+
//|                          Aula-08-DadosExternos_ViaWebRequest.mq5 |
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
  // https://httpbin.org/get?chave=valor&chave2=teste
  string cookie=NULL, headers;
  char data[], result[]; // Arrays de Char
  //string url = "https://httpbin.org/get";
  //string query = "?chave=valor&chave2=test";
  
  string url = "https://www.bitmex.com/api/v1/trade";
  string query = "?filter={%22side%22%3A%22Buy%22}&count=5";
  ResetLastError();
  
  int res = WebRequest("GET", url+query, cookie, NULL, 5000, data, 0, result, headers);
  if(res==-1)
    {
     Print("Aqui tem erro. Erro :: ", GetLastError());
    }
   else
     {
      Print("Aqui não tem erro !");
      //ArrayPrint(result);
      string texto = CharArrayToString(result);
      Print(texto);
     }
  }
//+------------------------------------------------------------------+
