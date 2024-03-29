//+------------------------------------------------------------------+
//|                                        13-SencaoOntickParte1.mq5 |
//|                                  Copyright 2023, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2023, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
// ---

enum EstrategiaEntrada
  {
   ApenasMM,  // Apenas Médias Móveis
   ApenasIFR, // Apenas Ifr
   Mm_Ifr     // Médias mais Ifr
  };

// --- Variáveis Inputs
sinput string s0; // ---- Estratégia de Entrada ---- //
input EstrategiaEntrada estrategia      = ApenasMM;       // Estratégia de Entrada

sinput string s1; // ---- Médias Móveis ---- //
input int mm_rapida_periodo             = 12;             // Perído da Média Móvel Rápida    
input int mm_lenta_periodo              = 32;             // Período da Média Móvel Lenta
input  ENUM_TIMEFRAMES mm_tempo_grafico = PERIOD_CURRENT; // Tempo Gráfico
input  ENUM_MA_METHOD mm_metodo         = MODE_EMA;       // Método
input  ENUM_APPLIED_PRICE mm_preco     = PRICE_CLOSE;     // Preço Aplicado

sinput string s2; // ---- IFR ---- //
input int ifr_periodo                   = 5;              // Período do IFR
input ENUM_TIMEFRAMES ifr_tempo_grafico = PERIOD_CURRENT; // Tempo Gráfico
input ENUM_APPLIED_PRICE ifr_preco      = PRICE_CLOSE;    // Preço Aplicado

input int ifr_sobrecompra               = 70;             // Nível de Sobrecompra
input int ifr_sobrevenda                = 30;             // Nível de Sobrevenda

sinput string s3; // ---- Ordem ---- //
input double num_lots                   = 1.0;            // Número de Lotes
input int TK                            = 600;             // Take Profit
input int SL                            = 300;             // Stop Loss

sinput string s4; // ---- Limite de Horário ---- //
input string hora_limite_fecha_op       = "17:40";        // Horário Limite Fecha Posição

// ---- Variáveis para os indicadores

// --- Médias Móveis
// Rápida
int mm_rapida_Handle;      // Handle controlador da média móvel rápida
double mm_rapida_Buffer[]; // Buffer para armazenamento dos dados das médias

// Lenta
int mm_lenta_Handle;       // Handle controlador da média móvel lenta
double mm_lenta_Buffer[];  // Buffer para armazenamento dos dados das médias

// --- IFR
int ifr_Handle;      // Handle controlador para o IFR   
double ifr_Buffer[]; // Buffer para armazenamento dos dados do IFR

// ---- Variável para as funções

int magic_number = 123456; // N° Mágico do Robô

MqlRates CandlesTicks[];   // Variável para armazenar velas
MqlTick Ticks;             // Variável para armazenar ticks
 
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
   //---
   EventSetTimer(15);
   
   // --- Lenta
   mm_rapida_Handle = iMA(_Symbol, mm_tempo_grafico, mm_rapida_periodo, 0,mm_metodo, mm_preco);
   mm_lenta_Handle  = iMA(_Symbol, mm_tempo_grafico, mm_lenta_periodo, 0,mm_metodo, mm_preco);
   
   ifr_Handle = iRSI(_Symbol, ifr_tempo_grafico, ifr_periodo, ifr_preco);
   
   if(mm_rapida_Handle<0 || mm_lenta_Handle<0 || ifr_Handle<0)
     {
      Alert("Erro ao tentar criar Handles para os indicadores - erro: ", GetLastError(), "!");
      return -1;
     }
   /*
   // --- CandlesTicks
   CopyRates(_Symbol, _Period, 0, 4, CandlesTicks);
   ArraySetAsSeries(CandlesTicks, true);
   
   // --- Ticks
   SymbolInfoTick(_Symbol, Ticks);
   */
   
   // Para adicionar no gráfico os indicadores:
   ChartIndicatorAdd(0, 0, mm_rapida_Handle);
   ChartIndicatorAdd(0, 0, mm_lenta_Handle);
   ChartIndicatorAdd(0, 1, ifr_Handle);
   //---
   
   //---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   //--- Aula 07
   IndicatorRelease(mm_rapida_Handle);
   IndicatorRelease(mm_lenta_Handle);
   IndicatorRelease(ifr_Handle);
   // ---
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
   // --- Desenhar Linha Vertical ("LI", Ticks.time, clrRed);
   // --- Copiar um vetor de dados tamanho três para o vetor mm_Buffer
   CopyBuffer(mm_rapida_Handle, 0, 0, 4, mm_rapida_Buffer);
   CopyBuffer(mm_lenta_Handle, 0, 0, 4, mm_lenta_Buffer);
   
   CopyBuffer(ifr_Handle, 0, 0, 4, ifr_Buffer);
   
   // --- Alimentar Buffers das Velas com dados:
   CopyRates(_Symbol, _Period, 0, 5, CandlesTicks);
   ArraySetAsSeries(CandlesTicks, true);
   
   // --- Ordenar o vetor de dados
   ArraySetAsSeries(mm_rapida_Buffer, true);
   ArraySetAsSeries(mm_lenta_Buffer, true);
   ArraySetAsSeries(ifr_Buffer, true);
   
   // --- Alimentar com dados variável de tick
   SymbolInfoTick(_Symbol, Ticks);
   
   // --- Lógica para ativar COMPRA
   bool compra_mm_cros = (mm_rapida_Buffer[0] > mm_lenta_Buffer[0]) &&
                         (mm_rapida_Buffer[2] < mm_lenta_Buffer[2]);
   
   bool compra_ifr = ifr_Buffer[0] <= ifr_sobrevenda;
   
   
   // --- Lógica para ativar Venda
   bool venda_mm_cros = (mm_lenta_Buffer[0] > mm_rapida_Buffer[0]) &&
                         (mm_lenta_Buffer[2] < mm_rapida_Buffer[2]);
   
   bool venda_ifr = ifr_Buffer[0] <= ifr_sobrecompra;
   
   // ---
   bool Compra = false;
   bool Venda = false;
   
   if(estrategia == ApenasMM)
     {
      Compra = compra_mm_cros;
      Venda = venda_mm_cros;
     }
   else if(estrategia == ApenasIFR)
          {
           Compra = compra_ifr;
           Venda  = venda_ifr;
          }
   else
     {
      Compra = compra_mm_cros && compra_ifr;
      Venda  = venda_mm_cros && venda_ifr;
     }
   
   
   // --- Retorna True se tivermos uma nova vela
   bool temosNovaVela = TemosNovaVela(); 
   
   // --- Toda vez que existir uma nova vela entrar nesse 'if'
   if(temosNovaVela)
     {
      // --- Condição de Compra
      if(Compra && (PositionSelect(_Symbol)==false))
        {
         DesenharLinhaVertical("Compra", CandlesTicks[1].time,clrBlue);
         CompraAMercado();
        }
      
      // --- Condição de Venda
      if(Venda && (PositionSelect(_Symbol)==false))
        {
         DesenharLinhaVertical("Venda", CandlesTicks[1].time,clrRed);
         VendaAMercado();
        }
      
     
     }
   
   // ----
   if(TimeToString(TimeCurrent(), TIME_MINUTES) == hora_limite_fecha_op && PositionSelect(_Symbol) == true)
     {
      // ----
      Print(" -- > Fim do tempo Operacional: Encerrar posições abertas!");
      if(PositionGetInteger(POSITION_TYPE) == POSITION_TYPE_BUY)
        {
         FechaCompra();
        }
      else if(PositionGetInteger(POSITION_TYPE) == POSITION_TYPE_SELL)
        {
         FechaVenda();
        }
     }
  }
//+------------------------------------------------------------------+

// FUNÇÕES PARA AUXILIAR NA VISUALIZAÇÃO DA ESTRATÉGIA

void DesenharLinhaVertical(string nome, datetime dt, color cor = clrAliceBlue)
   {
      ObjectDelete(0, nome);
      ObjectCreate(0, nome, OBJ_VLINE, 0, dt, 0);
      ObjectSetInteger(0, nome, OBJPROP_COLOR, cor);
   
   }
   
// AULA 09 - Função Compra a Mercado  
   
void CompraAMercado() // Compra a Mercado
   {
      MqlTradeRequest requisicao; // Requisição
      MqlTradeResult  resposta;   // Resposta
      
      ZeroMemory(requisicao);
      ZeroMemory(resposta);
      
      // --- Características da ordem de compra
      
      requisicao.action                = TRADE_ACTION_DEAL;                                  // Executa ordem a mercado
      requisicao.magic                 = magic_number;                                       // Nº mágico da ordem
      requisicao.symbol                = _Symbol;                                            // Símbolo do ativo
      requisicao.volume                = num_lots;                                           // Nº de Lotes   
      requisicao.price                 = NormalizeDouble(Ticks.ask, _Digits);                // Preço para compra 
      requisicao.sl                    = NormalizeDouble(Ticks.ask - SL * _Point, _Digits); // Preço Stop Loss
      requisicao.tp                    = NormalizeDouble(Ticks.ask + TK * _Point, _Digits);  // Alvo de Ganho - Take Profit
      requisicao.deviation             = 0;                                                  // Desvio Permitido do Preço   
      requisicao.type                  = ORDER_TYPE_BUY;                                     // Tipo da Ordem
      requisicao.type_filling          = ORDER_FILLING_FOK;                                  // Tipo do preemchimento da ordem
      
      /* Aula do Curso -- > Estava aparecendo uma msg de aviso
      OrderSend(requisicao, resposta);
      
      // ---
      if(resposta.retcode == 10008 || resposta.retcode == 10009)
        {
         Print("Ordem de Compra Executada com Sucesso !");
        }
      else
        {
         Print("Erro ao enviar a Ordem a Mercado, erro = ", GetLastError());
         ResetLastError();
        }*/
   
      // --- Forma Correta
      if(!OrderSend(requisicao, resposta))
        {
          PrintFormat ( "OrderSend error %d" , GetLastError ());
        }
      else
        {
         PrintFormat ( "retcode=%u " ,resposta.retcode);
        }
   }   

// AULA 10 - Função Venda a Mercado
void VendaAMercado() // Compra a Mercado
   {
      MqlTradeRequest requisicao; // Requisição
      MqlTradeResult  resposta;   // Resposta
      
      ZeroMemory(requisicao);
      ZeroMemory(resposta);
      
      // --- Características da ordem de compra    
      requisicao.action                = TRADE_ACTION_DEAL;                                  // Executa ordem a mercado
      requisicao.magic                 = magic_number;                                       // Nº mágico da ordem
      requisicao.symbol                = _Symbol;                                            // Símbolo do ativo
      requisicao.volume                = num_lots;                                           // Nº de Lotes   
      requisicao.price                 = NormalizeDouble(Ticks.bid, _Digits);                // Preço para compra 
      requisicao.sl                    = NormalizeDouble(Ticks.bid + SL * _Point, _Digits); // Preço Stop Loss
      requisicao.tp                    = NormalizeDouble(Ticks.bid - TK * _Point, _Digits);  // Alvo de Ganho - Take Profit
      requisicao.deviation             = 0;                                                  // Desvio Permitido do Preço   
      requisicao.type                  = ORDER_TYPE_SELL;                                    // Tipo da Ordem
      requisicao.type_filling          = ORDER_FILLING_FOK;                                  // Tipo do preemchimento da ordem
      
      // ---
      //OrderSend(requisicao, resposta);
      
      // ---
      if(!OrderSend(requisicao, resposta))
        {
          PrintFormat ( "OrderSend error %d" , GetLastError ());
        }
      else
        {
         PrintFormat ( "retcode=%u " ,resposta.retcode);
        }
   
   
   }   

// --- AULA 11 - Função Fecha Compra

void FechaCompra() // Compra a Mercado
   {
      MqlTradeRequest requisicao; // Requisição
      MqlTradeResult  resposta;   // Resposta
      
      ZeroMemory(requisicao);
      ZeroMemory(resposta);
      
      // --- Características da ordem de compra    
      requisicao.action                = TRADE_ACTION_DEAL;                                  // Executa ordem a mercado
      requisicao.magic                 = magic_number;                                       // Nº mágico da ordem
      requisicao.symbol                = _Symbol;                                            // Símbolo do ativo
      requisicao.volume                = num_lots;                                           // Nº de Lotes   
      requisicao.deviation             = 0;                                                  // Desvio Permitido do Preço   
      requisicao.type                  = ORDER_TYPE_SELL;                                    // Tipo da Ordem
      requisicao.type_filling          = ORDER_FILLING_RETURN;                               // Tipo do preemchimento da ordem
      
      /* Codigo do curso possivel erro
      OrderSend(requisicao, resposta);
      
      // ---
      if(resposta.retcode == 10008 || resposta.retcode == 10009)
        {
         Print("Ordem de Compra Executada com Sucesso !");
        }
      else
        {
         Print("Erro ao enviar a Ordem a Mercado, erro = ", GetLastError());
         ResetLastError();
        }*/
      
      // --- Forma correta
      if(!OrderSend(requisicao, resposta))
        {
          PrintFormat ( "OrderSend error %d" , GetLastError ());
        }
      else
        {
         PrintFormat ( "retcode=%u " ,resposta.retcode);
        }
   
   }

void FechaVenda() // Compra a Mercado
   {
      MqlTradeRequest requisicao; // Requisição
      MqlTradeResult  resposta;   // Resposta
      
      ZeroMemory(requisicao);
      ZeroMemory(resposta);
      
      // --- Características da ordem de compra    
      requisicao.action                = TRADE_ACTION_DEAL;                                  // Executa ordem a mercado
      requisicao.magic                 = magic_number;                                       // Nº mágico da ordem
      requisicao.symbol                = _Symbol;                                            // Símbolo do ativo
      requisicao.volume                = num_lots;                                           // Nº de Lotes   
      requisicao.deviation             = 0;                                                  // Desvio Permitido do Preço   
      requisicao.type                  = ORDER_TYPE_BUY;                                     // Tipo da Ordem
      requisicao.type_filling          = ORDER_FILLING_RETURN;                               // Tipo do preemchimento da ordem
      
      /*
      OrderSend(requisicao, resposta);
      
      // ---
      if(resposta.retcode == 10008 || resposta.retcode == 10009)
        {
         Print("Ordem de Compra Executada com Sucesso !");
        }
      else
        {
         Print("Erro ao enviar a Ordem a Mercado, erro = ", GetLastError());
         ResetLastError();
        }*/
      
      // --- Evintando possíveis erros
      if(!OrderSend(requisicao, resposta))
        {
          PrintFormat ( "OrderSend error %d" , GetLastError ());
        }
      else
        {
         PrintFormat ( "retcode=%u " ,resposta.retcode);
        }
   
   } 
   
// --- Para Mudança de Candle

bool TemosNovaVela()
   {
      // --- Memoriza o tempo de abertura da ultima barra (Candlestick) numa variável
      static datetime last_time = 0;
      
      // --- Tempo atual
      datetime lastbar_time = (datetime) SeriesInfoInteger(_Symbol, Period(), SERIES_LASTBAR_DATE);
      
      // Se for a primeira cadada da função:
      if(last_time==0)
        {
         // --- Atribuir valor temporal e sair
         last_time = lastbar_time;
         return (false);
        } 
      
      // --- Se o tempo estiver diferente:
      if(last_time != lastbar_time)
        {
         // --- memorizar esse tempo e retornar true
         last_time = lastbar_time;
         return (true);
        }
      
      // --- Se passarmos desa linha, então a barra não é nova; retorna false
      return (false);
   
   } 