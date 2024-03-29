//+------------------------------------------------------------------+
//|                         Aula-06-CalculoDeTpSlRegrasTemporais.mq5 |
//|                                  Copyright 2023, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2023, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

//+------------------------------------------------------------------+
//| OBJETIVOS DA AULA                                                |
//+------------------------------------------------------------------+
// 1.  Robô de Média Móveis  

// 2.  Inserir um lógica de TP e SL
// 2.1 Ticks
// 2.2 Moeda
// 2.3 ATR

// 3.  Inserir uma lógica de gerenciamento temporal
//
//+------------------------------------------------------------------+
//| INCLUDES                                                         |
//+------------------------------------------------------------------+
#include <Trade\Trade.mqh>

//+------------------------------------------------------------------+
//| ENUMS                                                            |
//+------------------------------------------------------------------+

enum ENUM_CALC_MODE
  {
   MODE_TICKS,
   MODE_CURRENCY,
   MODE_ATR
  };

//+------------------------------------------------------------------+
//| INPUTS                                                           |
//+------------------------------------------------------------------+
input double lot = 0.1;                      // Lote de Operação
input ulong MagicNumber = 123456;            // Magic Number
input int PeriodoMA1 = 9;                    // Periodo da Média Móvel Rapida
input int PeriodoMA2 = 21;                   // Periodo da Média Móvel Lenta
input int Periodrsi = 14;                    // Periodo do Indicador RSI

//
input double Tp = 0;                         // Take Profit
input double Sl = 0;                         // Stop Loss
input ENUM_CALC_MODE calcMode = MODE_TICKS;  // Modo de Cálculos
input int periodAtr = 14;                    // Periodo do indicador atr
//
input uint horInicial = 9;                    // Horário Inicial de Operações  
input uint minInicial = 5;                    // Minutos Inicial de Operação
input uint horFinal = 17;                     // Horário Final de Operações
input uint minFinal = 30;                     // Minuto Final das operações

 
//+------------------------------------------------------------------+
//| GLOBALS                                                          |
//+------------------------------------------------------------------+
CTrade trade;


//+------------------------------------------------------------------+
//| VARIÁVEIS PARA CONTROLE DE POSIÇÕES                              |
//+------------------------------------------------------------------+
bool comprado = false; // Variáveis para controle de posições

//
bool vendido = false; // Variáveis para controle de posições

// Variáveis para controle de orders
bool compraPendente = false;

// Variáveis para controle de orders
bool vendaPendente = false;

//
ulong ticketCompra = 0;

//
ulong ticketVendido = 0;

//
ulong ticketCompraPendente = 0;

//
ulong ticketVendidoPendente = 0;

// Variáveis globais para controle de indicadores
int ma1_handle = INVALID_HANDLE;
int ma2_handle = INVALID_HANDLE;
int atr_handle = INVALID_HANDLE;

double ma1_Buffer[];
double ma2_Buffer[];
double atr_Buffer[];
// Variável Tick
MqlTick ticks;

int ifr_Handle = INVALID_HANDLE;

double ifr_Buffer[];
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
   // ---
   if(!CheckInputsErrors())
     {
      //
      return INIT_FAILED; // ou INIT_PARAMETERS_INCORRECT
     }   
   
   // ---
   if(!InitializeIndicator())
     {
      //
      return INIT_FAILED;
     }
   
   //  
   trade.SetExpertMagicNumber(MagicNumber);
   

   
   // ---  
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//---
  DeleteAllIndicator();
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
   //---
   if(IsNewBar())
     {
      //
      if(GetData())
        {
         //  
         if(CheckPositionsAndOrders())
           {
            if(!TradeLogic())
              {
               // Lógica operacional
               Print("Lógica operacional não realizada com sucesso ! ");
               
              }
           }
        }
     }
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//| FUNÇÕES AUXILIARES                                               |
//+------------------------------------------------------------------+

// 1. IsNewBar -- > Função para verificação de novas barras

bool IsNewBar()
   {
   // --- Memorize the of opening of the last bar in the static variable
   static datetime last_time = 0;
   
   // --- Current Time
   datetime lastBar_time = (datetime)SeriesInfoInteger(Symbol(), Period(), SERIES_LASTBAR_DATE);
   
   // --- If it is the first call of the function
   if(last_time == 0)
     {
      //
      last_time = lastBar_time;
      
      //
      return false;
     }
   
   // --- If the time differs
   if(last_time != lastBar_time)
     {
      // --- Memorize the time and return true
      last_time = lastBar_time;
      
      //
      return true;
     }
   // If we passed to this line, then the bar is not new; return false
   return false;  
   }
   
// ------------------------------------------------------------------------------------------------------- \\
// 2. CheckPositionsAndOrders() -- > Função para verificação de ordens e posições 

bool CheckPositionsAndOrders()
   {
    comprado = false; // Variáveis para controle de posições

    //
    vendido = false; // Variáveis para controle de posições
   
    // Variáveis para controle de orders
    compraPendente = false;
   
    // Variáveis para controle de orders
    vendaPendente = false;
   
    //
    ticketCompra = 0;
   
    //
    ticketVendido = 0;
   
    //
    ticketCompraPendente = 0;
   
    //
    ticketVendidoPendente = 0;     
      
   // Loop nas posições
   
   // Caso não tenha posição aberta -- > compra a mercado
   int positionsTotal = PositionsTotal();
   
   //
   for(int i = 0 ; i < positionsTotal; i++)
     {
      //
      ulong posTicket = PositionGetTicket(i);
      
      //
      if(PositionSelectByTicket(posTicket))
        {
         //
         ulong posMagic = PositionGetInteger(POSITION_MAGIC);
         
         //
         string posSymbol = PositionGetString(POSITION_SYMBOL);
         
         //
         ENUM_POSITION_TYPE posType = (ENUM_POSITION_TYPE)PositionGetInteger(POSITION_TYPE);
         
         //
         if(posSymbol == _Symbol && posMagic == MagicNumber)
           {
            //
            if(posType == POSITION_TYPE_BUY)
               {
                //
                comprado = true;
                
                //
                ticketCompra = posTicket;
               }
            // 
            if(posType == POSITION_TYPE_SELL) 
               {
                //
                vendido = true;
               
                //
                ticketVendido = posTicket;
               } 
              
           }
        }
       else
         {
          //
          Print("ERRO :: Posição não selecionada com sucesso ");
          
          //
          return false;
         }
     }
    // --- Loop na ordens   
     int ordersTotal = OrdersTotal();
     
     //
     for(int i=0;i<ordersTotal;i++)
       {
        //
        ulong orderTicket = OrderGetTicket(i);
        
        // caso a ordem tenha sido cancelada com sucesso
        if(OrderSelect(orderTicket))
          {
           //
           ulong orderMagic = OrderGetInteger(ORDER_MAGIC);
           
           //
           string ordersSymbol = OrderGetString(ORDER_SYMBOL);
           
           //
           ENUM_ORDER_TYPE orderType = (ENUM_ORDER_TYPE)OrderGetInteger(ORDER_TYPE);
           
           //
           if(ordersSymbol == _Symbol && orderMagic == MagicNumber)
             {
              //
              if(orderType == ORDER_TYPE_BUY_LIMIT) 
                { 
                 //
                 compraPendente = true;
                 
                 //
                 ticketCompraPendente = orderTicket;
                }
              //
              if(orderType == ORDER_TYPE_SELL_LIMIT) 
                {
                 //
                 vendaPendente = true;
                 
                 //
                 ticketVendidoPendente = orderTicket;
                
                }
             }
          }
       
        else
          {
           //
           Print("ERRO :: ORDEM não selecionada com sucesso ");
           //
           return false;
          }  
       }     
    //
    return true;
   }
   
// ------------------------------------------------------------------------------------------------------- \\
// 3. GetData() -- > Função para capturar os dados necessários para lógica operacional
bool GetData()
   {
    //
    int barsToCopy = 5;
    
    //
    int copied1 = CopyBuffer(ma1_handle, 0, 0, barsToCopy, ma1_Buffer);
    int copied2 = CopyBuffer(ma2_handle, 0, 0, barsToCopy, ma2_Buffer);
    int copied3 = CopyBuffer(ifr_Handle, 0, 0, barsToCopy, ifr_Buffer);
    int copied4 = (calcMode == MODE_ATR) ? CopyBuffer(atr_handle, 0, 0, barsToCopy, atr_Buffer): barsToCopy;
    //
    if(copied1 != barsToCopy || copied2 != barsToCopy || copied3 != barsToCopy || copied4 != barsToCopy)
      {
       //
       Print("ERRO -- > Dados de indicadores não foram copiados corretamente.");
       
       //
       return false;
      }
    //
    if(!SymbolInfoTick(_Symbol, ticks))
      {
       //
       Print("ERRO -- > Dados de Tick não foram copiados corretamente.");
       
       //
       return false;
      
      }
    //
    return true;
   }

// ------------------------------------------------------------------------------------------------------- \\
// 4. TradeLogic() -- > Função de gerenciamento da lógica operacional
bool TradeLogic()
   {
    //
    bool sinalCompra = false;
    bool sinalVenda = false;
    
    //
    bool filtroCompra = false;
    bool filtroVenda = false;
    
    //Se cruzar a média móvel  -- > sinal de compra
    if(ma1_Buffer[2] < ma2_Buffer[2] && ma1_Buffer[1] > ma2_Buffer[1])
      {
       //
       sinalCompra = true;
       
      } 
    
    // Se cruzar a média móvel  -- > sinal de Venda
    if(ma1_Buffer[2] > ma2_Buffer[2] && ma1_Buffer[1] < ma2_Buffer[1])
      {
       //
       sinalVenda = true;
       
      }
    
    //
    if(ifr_Buffer[1] > 50)
      {
       //
       filtroCompra = true;
      }
     
     if(ifr_Buffer[1]<50)
       {
        //
        filtroVenda=true;
       } 
    
    // --- Lógica de abertura de ordens dentro do intervalo de horas definido
    if(TimeAllwed())
      {
     
       // 
       if(!comprado && !vendido && !compraPendente && !vendaPendente)
         {
            
          // --- LÓGICA OPERACIONAL PARA COMPRA
          if(sinalCompra && filtroCompra)
            {
             //
             double sl = GetSl(true);
             double tp = GetTp(true);
             
             bool ok = trade.Buy(lot, _Symbol, 0, sl, tp, "Compra a mercado");
             //
             
             if(ok)
               {
                //
                if(trade.ResultRetcode() == 10008 || trade.ResultRetcode() == 10009)
                  {
                   //
                   Print("Posição COMPRADA aberta com sucesso (Conta Hedger)");
                  }
                else
                  {
                   //
                   Print("Erro -- > Retorno inesperado do servidor ");
                   
                   //
                   return false;
                  }
                }
             else
               {
                //
                Print("ERRO -- > Erro ao enviar trade.Buy");
                
                //
                return false;
               }  
            }
          
          // --- LÓGICA OPERACIONAL PARA VENDA
          if(sinalVenda && filtroVenda)
            {
             //
             double sl = GetSl(false);
             double tp = GetTp(false);
             
             //
             bool ok = trade.Sell(lot, _Symbol, 0, sl, tp, "Venda a mercado");
             
             //
             if(ok)
               {
                //
                if(trade.ResultRetcode() == 10008 || trade.ResultRetcode() == 10009)
                  {
                   //
                   Print("Posição VENDIDA aberta com sucesso (Conta Hedger)");
                  }
                else
                  {
                   //
                   Print("Erro -- > Retorno inesperado do servidor ");
                   
                   //
                   return false;
                  }
                }
             else
               {
                //
                Print("ERRO -- > Erro ao enviar trade.Sell");
                
                //
                return false;
               }  
            }  
          
        }
     else
       {
        //
        if(comprado || vendido)
          {
           //
             ulong ticket = (comprado) ? ticketCompra: ticketVendido;
             bool ok = trade.PositionClose(ticket);
             //
             
             if(ok)
               {
                //
                if(trade.ResultRetcode() == 10008 || trade.ResultRetcode() == 10009)
                  {
                   //
                   Print("Posição VENDIDA aberta com sucesso (Conta Hedger)");
                  }
                else
                  {
                   //
                   Print("Erro -- > Retorno inesperado do servidor ");
                   
                   //
                   return false;
                  }
                }
          }
       }   
   }
    //
    return true;
   }
// ------------------------------------------------------------------------------------------------------- \\
// 5. CheckInputsErrors() -- > Função de verificação de erros de inputs

bool CheckInputsErrors()
   {
    // Volume Minimo
    double minLot = SymbolInfoDouble(_Symbol, SYMBOL_VOLUME_MIN);
    
    // Volume Máximo
    double maxLot = SymbolInfoDouble(_Symbol, SYMBOL_VOLUME_MAX);
    
    if(lot < minLot)
      {
       //
       Print("Erro :: Lote escolhido pelo usuário é inferior ao lote mínimo");
       
       //
       return false;
      }
    
    // Lote maior que o lote máximo 
    if(lot > maxLot)
      {
       //
       Print("Erro :: Lote escolhido pelo usuário ultrapassa o maximo permitido.");
       
       //
       return false;
      }
    
    // Todas as verificações foram feitas com sucesso :: Não tem erro de input
    return true;
    
    
    
   }
// ------------------------------------------------------------------------------------------------------- \\
// 6. InitializeIndicator()

bool InitializeIndicator()
   {
    // Inversão de indexação de buffers de indicadores
    ArraySetAsSeries(ma1_Buffer, true);
    ArraySetAsSeries(ma2_Buffer, true);
    ArraySetAsSeries(ifr_Buffer, true);
    ArraySetAsSeries(atr_Buffer, true);
    //
    ma1_handle = iMA(_Symbol, _Period, PeriodoMA1, 0, MODE_SMA, PRICE_CLOSE);
    ma2_handle = iMA(_Symbol, _Period, PeriodoMA2, 0, MODE_EMA, PRICE_CLOSE);
    atr_handle = iATR(_Symbol, _Period, periodAtr);
    
    ifr_Handle = iRSI(_Symbol, _Period, Periodrsi, PRICE_CLOSE);
    //
    if(ma1_handle == INVALID_HANDLE || ma2_handle == INVALID_HANDLE || ifr_Handle == INVALID_HANDLE || atr_handle == INVALID_HANDLE)
      {
       //
       Print("Falha na inicialização dos meus indicadores");
       
       //
       return false;
      }
    
    // Colocar os indicadores no gráfico
    if(!ChartIndicatorAdd(0, 0, ma1_handle) || !ChartIndicatorAdd(0, 1, ifr_Handle) || !ChartIndicatorAdd(0, 0, ma2_handle))
      {
      //
       Print("Falha em adicionar indicadores ao gráfico");
       
       //
       return false;
      
      }
    //
    if(calcMode==MODE_ATR)
      {
       if(!ChartIndicatorAdd(0,2, atr_handle))
          {
           //
           Print("Falha em adicionar indicadores ao gráfico");
       
           //
           return false;
          }
      }
    //
    return true;
   }


// 7. DeleteAllIndicator() -- > Deletando indicadores do gráfico

bool DeleteAllIndicator()
   {
   int subWindows = (int)ChartGetInteger(0, CHART_WINDOWS_TOTAL);
   
   //
   for(int i = subWindows - 1; i >= 0; i--)
     {
      //
      int inds = ChartIndicatorsTotal(0, i);
      
      //
      if(inds >= 1)
        {
         //
         for(int j = inds; j >= 0; j--)
           {
            //
            string indName = ChartIndicatorName(0, i, j);
            
            //
            ChartIndicatorDelete(0, i, indName);
           }
        }
     }
   //
   return true;
   }

// --- 8. TimeAllowed()

bool TimeAllwed()
   {
    // StringSubstr -- > Proibido -- > Torna o backtest extremamente lento. 
    // datetime tempoInicial = TimeToString(TimeCurrent());
    
    //
    MqlRates dailyBar[];
    int copied = CopyRates(_Symbol, PERIOD_D1, 0, 1, dailyBar);
    
    //
    if(copied == 1)
      {
       //
       //datetime dataStart = dailyBar[0].time; // '2023.11.15 00:00:00'
       datetime tempoInicial = dailyBar[0].time + (horInicial*60*60)+(minInicial*60); 
       datetime tempoFinal = dailyBar[0].time + (horFinal*60*60)+(minFinal*60);;
       datetime timeNow = TimeCurrent();
       
       //
       if(timeNow >= tempoInicial && timeNow < tempoFinal)
         {
          //
          return true; 
         }
      }
    else
      {
       
       //
       return false;
      }  
    //
    //horInicial = 9;                                                     
    //minInicial = 5;                                                  
    //horFinal   = 17;     
    //minFinal   = 30;           
   
    //
    return false; 
   }


// GetSL
double GetSl(bool isBuy)
  {
   double sl = 0;
   if(Sl==0) return(0);
   //
   switch(calcMode)
     {
      // MODE_CURRENCY
      case MODE_CURRENCY :
        {
         if(isBuy)
           {
            sl = NormalizeDouble(ticks.ask - Sl,_Digits);
           }
         else
           {
            sl = NormalizeDouble(ticks.bid + Sl,_Digits);
           }
         break;
        }
      // MODE_ATR
      case MODE_ATR :
        {
         if(isBuy)
           {
            sl = NormalizeDouble(ticks.ask - Sl*atr_Buffer[1],_Digits);
           }
         else
           {
            sl = NormalizeDouble(ticks.bid + Sl*atr_Buffer[1],_Digits);
           }
         break;
        }
      // MODE_TICKS
      default :
        {
         double tickSize = SymbolInfoDouble(_Symbol,SYMBOL_TRADE_TICK_SIZE);
         if(isBuy)
           {
            sl = NormalizeDouble(ticks.ask - Sl*tickSize,_Digits);
           }
         else
           {
            sl = NormalizeDouble(ticks.bid + Sl*tickSize,_Digits);
           }
         break;
        }
     }
   //
   return(sl);
  }

//
double GetTp(bool isBuy)
   {
    double tp = 0;
   if(Sl==0) return(0);
   //
   switch(calcMode)
     {
      // MODE_CURRENCY
      case MODE_CURRENCY :
        {
         if(isBuy)
           {
            tp = NormalizeDouble(ticks.ask + Tp,_Digits);
           }
         else
           {
            tp = NormalizeDouble(ticks.bid - Tp,_Digits);
           }
         break;
        }
      // MODE_ATR
      case MODE_ATR :
        {
         if(isBuy)
           {
            tp = NormalizeDouble(ticks.ask + Tp*atr_Buffer[1],_Digits);
           }
         else
           {
            tp = NormalizeDouble(ticks.bid - Tp*atr_Buffer[1],_Digits);
           }
         break;
        }
      // MODE_TICKS
      default :
        {
         double tickSize = SymbolInfoDouble(_Symbol,SYMBOL_TRADE_TICK_SIZE);
         if(isBuy)
           {
            tp = NormalizeDouble(ticks.ask + Tp*tickSize,_Digits);
           }
         else
           {
            tp = NormalizeDouble(ticks.bid - Tp*tickSize,_Digits);
           }
         break;
        }
     }
   //  
    //
    return tp;
   }










