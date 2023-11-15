//+------------------------------------------------------------------+
//|                                   Aula-01-TrabalhandoComJSON.mq5 |
//|                                  Copyright 2023, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2023, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
//| INCLUDES                                                         |
//+------------------------------------------------------------------+
#include <JAson.mqh>


//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart()
  {
   //+------------------------------------------------------------------+
   //| SERIALIZAR JSON                                                  |
   //+------------------------------------------------------------------+
   //CJAVal msg;
   //msg["chave"] = "valor";
   //Print(msg.Serialize());
   
   // ("chave" : "valor")
   
   
   //CJAVal msg, content;
   
   //content["chave"] = "valor";
   //content["chave2"] = "teste";
   //msg["arg"].Set(content);
   //Print(msg.Serialize());
   // {"args": {"chave":"valor", "chave": "tester"} }
   
   // EXEMPLO 3
   
   //CJAVal msg;
   
   //msg["time"] = TimeToString(TimeCurrent());
   //msg["open"] = 27.50;
   //msg["high"] = 27.60;
   //msg["low"] = 24.40;
   //msg["close"] = 27.50;
   //msg["tick_volume"] = 1000;
   //msg["spread"] = 0.01;
   //msg["real_volume"] = 100000;
   //Print(msg.Serialize());
   //+------------------------------------------------------------------+
   //| PARSE JSON                                                       |
   //+------------------------------------------------------------------+
   string messagem1 = "{\"key\":\"valor\",\"key1\":\"valor1\",\"key2\":\"valor2\",\"key3\":[\"value3\",\"valor4\"]}";
   
   //
   CJAVal msg;
   
   //
   bool isValid = msg.Deserialize(messagem1);
   
   //
   if(isValid)
     {
      //
      Print("formato JSON válido encontrado.");
      
      // PARSE da mensagem
      int size = msg.Size();
      for(int i=0;i<size;i++)
        {
         //Print("O valor da chave ", IntegerToString(i), " :: ", msg[i].Serialize());
         CJAVal msg2;
         bool isValid2 = msg2.Deserialize(msg[i].Serialize());
         
         //
         if(isValid2)
           {
            Print("O valor da chave é um formato JSON válido ...");
            if(msg2.Size()>1)
              {
               for(int j=0;j<msg2.Size();j++)
                 {
                  Print("O valor j = ", IntegerToString(j)," da chave ", IntegerToString(i), " :: ", msg2[j].Serialize());
                 }
              }
             else
               {
                Print("O valor da chave ", IntegerToString(i), " :: ", msg[i].Serialize());
               } 
           }
        }
      
     }
    else
      {
       //
       Print("Essa mensagem não possui formato JSON.");
      }
  }
//+------------------------------------------------------------------+
