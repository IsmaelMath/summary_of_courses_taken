//+------------------------------------------------------------------+
//|                                           Aula-05-Dados_Book.mq5 |
//|                                  Copyright 2023, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2023, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

//+------------------------------------------------------------------+
//|                    GLOBALS                                       |
//+------------------------------------------------------------------+
MqlBookInfo book[];




//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart()
  {
   // 1. ADICIONAR o book de ofertas ao terminal via código
   MarketBookAdd(_Symbol); // ou MarketBookAdd("EURUSD");
   
   // 2. COPIAR os dados do boook de ofertas
   MarketBookGet(_Symbol, book);
   
   
   // loop do tamanho do array
   long summerSell =0;
   long summerBuy = 0;
   int posMid = -1;
   int size = ArraySize(book);
   for(int i = 0; i < size; i++)
     {
     
     if((ENUM_BOOK_TYPE)book[i].type==BOOK_TYPE_SELL) summerSell += book[i].volume;
     if((ENUM_BOOK_TYPE)book[i].type==BOOK_TYPE_BUY) summerBuy += book[i].volume;
     
      if((i > 0) && (book[i-1].type != book[i].type))
         {
            
            posMid = i;
            //Print("Price :: ", book[i-1].price);
   
            //Print("Volume :: ", book[i].volume);

         } 
        }
    // Meio do book     
    Print("ASK :: ", book[posMid-1].price, " ASK_VOLUME :: ", book[posMid-1].volume);
    Print("BID :: ", book[posMid].price, " BID_VOLUME :: ", book[posMid].volume);
   
   long paredeVenda = book[posMid-1].volume + book[posMid-2].volume;
   Print("Volume na Venda :: ",  summerSell);
   Print("Volume na compra :: ", summerBuy);
   
   
   
   double relacao_venda = (double)summerSell/(double)(summerBuy+summerSell);
   Print("Percentual de vendores :: ", relacao_venda);
   // Tamanho do book de ofertas
   //Print("Tamanho do book de ofertas :: ", ArraySize(book));
   
   //Print("Valor :: ", book[0].price);
   
   // Tamanho do book de ofertas

   
   // 3. FINALIZAR (release) a utilização do book de ofertas
   MarketBookRelease(_Symbol);
   
  }
//+------------------------------------------------------------------+
