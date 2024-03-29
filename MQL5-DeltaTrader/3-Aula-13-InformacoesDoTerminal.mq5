//+------------------------------------------------------------------+
//|                                Aula-12-InformacoesDoTerminal.mq5 |
//|                                  Copyright 2023, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2023, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

#property script_show_inputs
//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart()
  {
   //
   //TerminalInfoString();
   
   string path = TerminalInfoString(TERMINAL_PATH);
   // Print("Path :: ", path);
   
   string data_path = TerminalInfoString(TERMINAL_DATA_PATH);
   // Print("Data Path :: ", data_path);
   
   //
   //TerminalInfoDouble();
   
   double retransmissions = TerminalInfoDouble(TERMINAL_RETRANSMISSION);
   // Print("Retransmissions :: ", retransmissions);
      
   //
   //TerminalInfoInteger();
   
   int build = TerminalInfoInteger(TERMINAL_BUILD);
   // Print("Build :: ", build);
   
   int num_cpus = TerminalInfoInteger(TERMINAL_CPU_CORES);
   // Print("N° núcleos :: ", num_cpus);
   
   int memory = TerminalInfoInteger(TERMINAL_MEMORY_PHYSICAL);
   // Print("Memória do PC :: ", memory);
   
   int arquitetura = TerminalInfoInteger(TERMINAL_X64);
   // Print("Arquitura do PC :: ", arquitetura);
   
   int ping = TerminalInfoInteger(TERMINAL_PING_LAST);
   // Print("Ping :: ", ping);
   
   int isVPS = TerminalInfoInteger(TERMINAL_VPS);
   // Print("isVPS :: ", isVPS);
   
   int is4k = TerminalInfoInteger(TERMINAL_SCREEN_DPI);
   // Print("RESOULUÇÂO :: ", is4k);
   
   int altura = TerminalInfoInteger(TERMINAL_SCREEN_HEIGHT);
   int largura = TerminalInfoInteger(TERMINAL_SCREEN_WIDTH);
   
   // Print("Altura :: ", altura, "| Largura :: ", largura);
   
   int tradeAllowed = TerminalInfoInteger(TERMINAL_TRADE_ALLOWED);
   Print("TradeAllowed :: ", tradeAllowed);
   
   int MQLtradeAllowed = MQLInfoInteger(MQL_TRADE_ALLOWED);
   Print("MQLTradeAllowed :: ", MQLtradeAllowed);
  }
//+------------------------------------------------------------------+
