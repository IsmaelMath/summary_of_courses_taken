//+------------------------------------------------------------------+
//|                                05-DeclaracaoVariaveisGlobais.mq5 |
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
input int num_lots                      = 100;            // Número de Lotes
input int TK                            = 60;             // Take Profit
input int SL                            = 30;             // Stop Loss

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
  // ---
  EventSetTimer(15);

   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//---
   
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
//---
   
  }
//+------------------------------------------------------------------+
