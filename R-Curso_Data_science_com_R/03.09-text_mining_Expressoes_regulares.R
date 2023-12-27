# -------------- TEXT MINING E EXPRESSÕES REGULARES -------------- #

# TEXT MINING

# Exemplo 1
search()
install.packages(c("SnowballC", "wordcloud", "RColorBrewer"))
library(tm)
library(SnowballC)
library(wordcloud)
library(RColorBrewer)

# Carregando o datasets
df <- read.csv("/home/quant/Documents/Books_Python_I_Books_Finance/R/R_fundamentos/questoes.csv", 
               stringsAsFactors = FALSE, row.names = 1)
head(df)

# Criando um Corpus
dfCorpus <- Corpus(VectorSource(df$Question))
class(dfCorpus)

# Convertendo Corpus em um documento texto plano
dfCorpus <- tm_map(dfCorpus, PlainTextDocument)

# Remove pontuação
dfCorpus <- tm_map(dfCorpus, removePunctuation)

# Remove palavras específicas do inglês
dfCorpus <- tm_map(dfCorpus, removeWords, stopwords("english"))

# Neste processo, várias versões de uma palabras são convetidas em uma únida palavra
dfCorpus <- tm_map(dfCorpus, stemDocument)

#- Removendo palavras especéficas 
dfCorpus <- tem_map(dfCorpus, removeWords, c("the", "this", stopwords("english")))

# Wordcloud
wordcloud(dfCorpus, max.words = 100, random.order = FALSE)


# Estava dando erro no script curso procurei na net
# -------------------------------------------------------------------
review_corpus <- Corpus(VectorSource(df$Question))
review_corpus <- tm_map(review_corpus, content_transformer(tolower))
review_corpus <- tm_map(review_corpus, removeNumbers)
review_corpus <- tm_map(review_corpus, removePunctuation)
review_corpus <- tm_map(review_corpus, removeWords, c("the", "and", stopwords("english")))
review_corpus <- tm_map(review_corpus, stripWhitespace)
inspect(review_corpus[1])

review_dtw <- DocumentTermMatrix(review_corpus)
inspect(review_dtw[500:505, 500:505])

review_dtw <- removeSparseTerms(review_dtw, 0.99)
inspect(review_dtw)

findFreqTerms(review_dtw, 1000)

freq = data.frame(sort(colSums(as.matrix(review_dtw)), decreasing=TRUE))
wordcloud(rownames(freq), freq[,1], max.words = 50, colors = brewer.pal(1, "Dark2"))
# -------------------------------------------------------------------


# Lendo o  arquivo

arquivo <- "/home/quant/Documents/Books_Python_I_Books_Finance/R/R_fundamentos/jonh_nesh.txt"
texto <- readLines(arquivo)

# Carregando os dados como Corpus

docs <- Corpus(VectorSource(texto))

# Pré procesamento
inspect(docs)
toSpace <- content_transformer(function(x, pattern) gsub(pattern, " ", x))
docs <- tm_map(docs, toSpace, "/") 
docs <- tm_map(docs, toSpace, "@")
docs <- tm_map(docs, toSpace, "\\|")

# Convertendo o texto para minusculas 
docs <- tm_map(docs, content_transformer(tolower))

# Remove números
docs <- tm_map(docs, removeNumbers)

# Removendo as palavras mais comuns do indioma inglês
docs <- tm_map(docs, removeWords, stopwords("english"))

# Vocêpode definir um vetor de palavras (stopwords) a serem removidas do texto
docs <- tm_map(docs, removeWords, c("the", "is"))

# Remove pontuação
docs <- tm_map(docs, removePunctuation)

# Eliminar espaços extras
docs <- tm_map(docs, stripWhitespace)

# Text sterming
docs <- tm_map(docs, stemDocument)

dtm <- TermDocumentMatrix(docs)
m <- as.matrix(dtm)
v <- sort(rowSums(m), decreasing = TRUE)
d <- data.frame(word=names(v), freq=v)
head(d, 10)

# Wordcloud

set.seed(1234)
wordcloud(words = d$word, freq = d$freq, min.freq = 1,
          max.words = 200, random.order = FALSE, rot.per = 0.35,
          colors=brewer.pal(8, "Dark2"))

# Tabela de frquência
findFreqTerms(dtm, lowfreq = 4)
findAssocs(dtm, terms = "freedom", corlimit = 0.3)
head(d, 10)


# Gráfico de barras com as palavras mais frquentes 
barplot(d[1:10,]$freq, las=2, names.org = d[1:10,]$word, 
        col="lightblue", main="Most frequent words", 
        ylabs= "Word frequencies")

