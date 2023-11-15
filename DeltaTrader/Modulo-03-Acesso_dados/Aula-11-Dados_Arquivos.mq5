//+------------------------------------------------------------------+
//|                                       Aula-11-Dados_Arquivos.mq5 |
//|                                  Copyright 2023, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2023, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

#include <Files\File.mqh>
#include <Files\FileTxt.mqh> // TXT (.txt)
#include <Files\FileBin.mqh> // BIN (.dat)


//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart()
  {
//---
   string fileName = "teste.txt";
   
   // Declara a variável "file" do tipo CfileText
   CFileTxt file;
   
   // OPCIONAL
   /*
   if(file.IsExist(fileName)) // Caso arquivo exista
     {
         file.Delete(fileName); // Apague o arquivo
     }
   */
   
   // Flags do Arquivo
   // int fileFlags = FILE_WRITE|FILE_ANSI; // Flags para escrita de arquivo
   int fileFlags = FILE_READ|FILE_ANSI; // Flags para leitura do arquivo
   // 
   int fileHandle = file.Open(fileName, fileFlags);
   
   // Verificar se o arquivo foi aberto corretamente
   if(fileHandle != INVALID_HANDLE)
     {
      // Posicionar o cursor no inicio do arquivo
      file.Seek(0, SEEK_SET);
      
      // Caso Escrita
      // Print("Gravando no arquivo ...");
      // file.WriteString("Estamos utilizando a Classe Cfile !!");
      
      // Caso Leitura
      Print("Lendo o arquivo ...");
      Print("Conteúdo do arquivo :: ", file.ReadString());
      
      // FLUSH
      file.Flush(); // Método para escrever no arquivo
      
      // CLOSE
      file.Close();
      
     }
  }
//+------------------------------------------------------------------+

// OnInit
// OnTick
// OnDeinit

