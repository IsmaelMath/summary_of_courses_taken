# -------------- STRINGS -------------- #

# String
texto <- "Isso é uma string!"
texto

x = as.character(3.14)
x
class(x)

# Concatenando Strings
nome = "Barack"; sobrenome = "Obama"
paste(nome, sobrenome)

# Formatando a saída
sprintf("%s governa os EUA há %d anos", "Barack Obama", 8)

# Extraindo parte de string

texto <- "Isso é uma string!"
substr(texto, start=12, stop = 17) # Cortando uma string
?substr

# Contando o números de caracteres
nchar(texto) # Tamanho da string

# Alterando a capitalização
tolower("Histograma e Elementos de Dados") # Convertendo para minusculo
toupper("Histogramas e Elementos de Dados") # Convertendo para maiúsculo

# Usando Stringr
library(stringr)

# Dividindo uma string em caracteres
strsplit("Histogramas e Elementos de Dados", NULL)
?strsplit

# Dividindo uma string em caracteres, após a caracter espaço
strsplit("Histograma e Elementos de Dados", " ")

# Trabalhando com strings
string1 <- c("Esta é a primeira parte da minha string e será a primeira parte do meu vetor",
             "Aqui a minha string continua, mas será transformada no segundo vetor")
string1

string2 <- c("Precisamos testar outras strings - @???!$",
             "Análise de Dados em R")
string2

# Adicionando 2 strings
str_c(c(string1, string2, sep=""))

# Podemos contar quantas vezes um caracter aparece no texto
str_count(string2, "s")

# Localiza a primeira e ultima posição em que o caracter aparece
str_replace(string2, "\\s", "")

# Substitui todos as ocorrencias de um caracter
str_replace_all(string2, "\\s", "")

# Detectando padrões nas strings
string1 <- "23 mai 2000"
string2 <- "1 mai 2000"
padrao <- "mai 20"

grep(pattern = padrao, x = string1)
padrao <- "mai20"
grep(pattern = padrao, x = string1)

# importando arquivos txt
# http://www.gutenberg.org/cache/epub/100/pg100.txt

arquivo <- read.csv("http://www.gutenberg.org/cache/epub/100/pg100.txt")
head(arquivo)
tail(arquivo)

str_count(arquivo, "7")
str_locate_all(arquivo, "7")

# Criando funções para manipular strings
strtail <- function(s, n=1) {
  if(n<0)
    substring(s, 1-n)
  else
    substring(s, nchar(s)-n+1)}

strtail("String de teste", 6)


