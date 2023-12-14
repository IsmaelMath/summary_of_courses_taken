//+------------------------------------------------------------------+
//|                                       Aula-10-Dados_arquivos.mq5 |
//|                                  Copyright 2023, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2023, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int fileHandle = INVALID_HANDLE;
int fileFlag = FILE_READ|FILE_CSV|FILE_ANSI;
string fileName = "EURUSD.csv";



//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart()
  {
   // Caso o arquivo exista, abre o aquivo para leitura
   if(FileIsExist(fileName))
     {
      Print("O arquivo existe");
      fileHandle = FileOpen(fileName, fileFlag, ',');
     
      if(fileName != INVALID_HANDLE)
        {
         Print("O arquivo foi aberto com sucesso !");
         
         // Enquanto não atingir o final do arquivo, continue lendo
         while(!FileIsEnding(fileHandle) && !IsStopped())
           {
               string fileCurrent = FileReadString(fileHandle);
               Print("fileCurrent :: ", fileCurrent);
               
               /*
               string values[];
               int ret = StringSplit(fileCurrent, ',', values); // Aqui no delimitador é apenas ''
               Print("A quantidade de elementos :: ", ret);
               
               for(int i=0;i<ret;i++)
                 {
                  Print("O valor :: ", values[i]);
                 }
               */
               
               
               
                 
           }
         
         
         FileClose(fileName);
         Print("O arquivo foi fechado com sucesso !");
        }
     }
   
  }
//+------------------------------------------------------------------+
