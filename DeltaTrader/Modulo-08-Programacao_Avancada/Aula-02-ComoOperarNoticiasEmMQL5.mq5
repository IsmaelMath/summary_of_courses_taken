//+------------------------------------------------------------------+
//|                             Aula-02-ComoOperarNoticiasEmMQL5.mq5 |
//|                                  Copyright 2023, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2023, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

string currencies[];
MqlRates dailyBar[];

//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart()
  {
   //---
   ArrayResize(currencies, 2);
   currencies[0] = "BRL";
   currencies[1] = "USD";
   
   
   //                                            
   int copied = CopyRates(_Symbol, PERIOD_D1, 0, 1, dailyBar);
   if(copied==1)
     {
      datetime date_start = dailyBar[0].time; // 00:00:00
      datetime date_end = date_start + 24*60*60;
      Print("Horário de inicio :: ", date_start, "| Horário de teminio da noticia :: ", date_end);
      
      //
      for(int i=0;i<ArraySize(currencies);i++)
        {
         //
         MqlCalendarValue data[];
         int data_count = CalendarValueHistory(data, date_start, date_end, NULL, currencies[i]);
         
         //
         Print("Moeda :: ", currencies[i], "| Qt. de dados :: ", data_count);
         
         //
         for(int j = 0; j < data_count; j++)
           {
            ResetLastError();
            MqlCalendarEvent event;
            MqlCalendarValue value;
            
            // Obtenho informações do Eventu
            if(CalendarEventById(data[j].event_id, event))
              {
               // DEBUG
               //Print("Nome do evento :: ", event.name, "| Importancia :: ", event.importance);
               
               // Obtenho informações do Valor
               if(CalendarValueById(data[j].id, value))
                 {
                  // DEBUG
                  //Print("Hora :: ", value.time, "| Atual :: ", value.actual_value, "| Anterior :: ", value.forecast_value);
                 
                  // DEBUG FINAL
                  Print( "Hora :: ", value.time, "|| Nome do evento :: ", event.name, "|| Importancia :: ", event.importance, "|| Atual :: ", value.actual_value, "|| Anterior :: ", value.forecast_value);
                  /*
                  //
                  if(event.name == "IPC FIPE" && (value.actual_value < value.forecast_value)) // dado bom = compra
                    {
                     //SINAL de COMPRA
                     
                    }*/
                 }
              }
           }
        }
     }
   
   
  }
//+------------------------------------------------------------------+
