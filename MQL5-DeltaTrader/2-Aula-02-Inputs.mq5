//+------------------------------------------------------------------+
//|                                               Aula-02-Inputs.mq5 |
//|                                  Copyright 2023, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2023, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property script_show_inputs

   //+------------------------------------------------------------------+
   //|                         INPUTS                                   |
   //+------------------------------------------------------------------+
   input string separador_1 = " ------------------------------ "; // Separador Visual
   
   
   input group "Gestão de Risco "
   input int peridoLonga = 50; // Periodo da Média Longa
   input int periodoCurta = 10; // Periodo da Média Curta
   input double maxLoss = 300; // Máximo de Loss
   
   // --- Inputs strings separador_2 = "------------------------------"; // Gestão de risco
   
   input group "Gestão de Tempo "
   input string eaName = ""; // Nome do robô
   input color panelColor = clrBlack; // Cor do Painel
   input datetime maxtime = D'2019.10.10 00:00:00'; // Data Máxima de negociação
   
   sinput double maxRisk = 4.0;


//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart()
  {
//---
   // Definição
   // Inputs -- > são valores de variáveis inputados pelo usuário no ato 
   //             da inicialização de um programa.
   
   
   // Tipos
   
   // Organização
   Print("periodoCurta :: ", periodoCurta);
   Print("eaName :: ", eaName);
   Print("Fui executado corretamente! ");
  }
//+------------------------------------------------------------------+
