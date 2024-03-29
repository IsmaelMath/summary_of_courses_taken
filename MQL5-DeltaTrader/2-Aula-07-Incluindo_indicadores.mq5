//+------------------------------------------------------------------+
//|                                Aula-07-Incluindo_indicadores.mq5 |
//|                                  Copyright 2023, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2023, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

//+------------------------------------------------------------------+
//|              INCLUIR INDICADORES CUSTOMIZADOS                    |
//+------------------------------------------------------------------+

//#resource "\\Indicators\\PNY_DeltaTrader.ex5"
//#resource "\\Indicators\\PrimeiroIndicador.ex5"

//+------------------------------------------------------------------+
//|                 HANDLER DE INDICADORES                           |
//+------------------------------------------------------------------+

int adxHandle  = INVALID_HANDLE;
int macdHandle = INVALID_HANDLE;
int rsiHandle  = INVALID_HANDLE;
int maHandle   = INVALID_HANDLE;

// ---

// --- Indicadores custommer
   //int pnyHandle = INVALID_HANDLE;
   //int primeiroHandle = INVALID_HANDLE;

//+------------------------------------------------------------------+
//|                 BUFFERS DE INDICADORES                           |
//+------------------------------------------------------------------+



//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart()
  {

   // --- REGRAS
     
      // 1) Todo Handle de Indicador é do Tipo "int"
      // 2) Indicadores podem possuir multiplos buffers
  
  
   // --- INDICADORES NATIVOS
    adxHandle  = iADX(_Symbol,_Period, 14);
    macdHandle = iMACD(_Symbol, _Period, 5, 3, 3, PRICE_CLOSE);
    rsiHandle  = iRSI(_Symbol, _Period, 14, PRICE_CLOSE);
    maHandle   = iMA(_Symbol, _Period, 14, 0, MODE_SMA, PRICE_CLOSE);
                  // 0 --> Deslocamento
    
    
    //if(adxHandle==INVALID_HANDLE) return; // return(INIT_FAILED);
         // Falaremos isso na aula de indicadores.
   
   
   // --- INDICADORES CUSTOMIZADOS
    //pnyHandle = iCustom(_Symbol, _Period, "::Indicators\\PNY_DeltaTrader.ex5", "parametros_do_indicador");
    //primeiroHandle = iCustom(_Symbol, _Period, "::Indicators\\PNY_DeltaTrader.ex5", "parametros_do_indicador");
      // :: --> quer dizer para o copilador usar o arquivo que eu incluir no #resource
  
  
  }
//+------------------------------------------------------------------+
