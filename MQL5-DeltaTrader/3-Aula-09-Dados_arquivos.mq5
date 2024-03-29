   //+------------------------------------------------------------------+
   //|                                       Aula-09-Dados_arquivos.mq5 |
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
int fileFlags = FILE_READ|FILE_TXT|FILE_ANSI;
string fileName = "lorem.txt";


   //+------------------------------------------------------------------+
   //| Script program start function                                    |
   //+------------------------------------------------------------------+
void OnStart()
  {
   //+------------------------------------------------------------------+
   //|                    LEITURA DE ARQUIVOS                           |
   //+------------------------------------------------------------------+
   
   if(FileIsExist(fileName))
         {
         
            Print("O arquivo Existe");
            // Abrir o arquivo para leitura
            fileHandle = FileOpen(fileName, fileFlags);
            if(fileHandle != INVALID_HANDLE)
              {
                  Print("O arquivo foi aberto corretamente para leitura! ");
                  
                  // Verificando o tamanho do arquivo
                  ulong fileSize = FileSize(fileHandle);
                  Print("O tamanho do arquivo é de :: ", fileSize, " Bytes");
                  
                  // Faz leitura do conteúdo do arquivo
                  string fileContent = FileReadString(fileHandle);
                  
                  //Imprimir o conteúdo do aquivo
                  Print("fileContent :: ", fileContent);
                  
                  // Fechando o arquivo para leitura (boa prática)
                  FileClose(fileHandle);
              }
         }
   
   
   
   
   //+------------------------------------------------------------------+
   //|                     ESCRITA DE ARQUIVOS                          |
   //+------------------------------------------------------------------+
   
   
   
   
   
   
  }
//+------------------------------------------------------------------+
