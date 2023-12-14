# ----------- APRESENTAÇÃO E ASPECTOS INICIAIS DO RSTUDIO ----------- #

# Obejtos (Variáveis): os objetos no R correspondem a uma estrutura que irá receber 
# algum valor. Para criar um objetos deve-se usar o simbolo <-. Todos os objetos
# criados ficam arquivados na aba Environment.

# Exemplo:

x <- 15
x + 5
x * x / 2
2 ^ x
y <- x / 3
y

# Funções: O progrmama já vem configurado com diversas funções outras podem ser 
# instaladas usando os "pacotes".

# Um funções tem dois elementos básicos, o nome e os parâmetros, por exemplo: log(10)
# é uma função que possui um nome e um parâmetro que é o número.

# Algumas funções:
funcoes_R <- c("sum()", "mean()", "var()", "median()", "summary()", "quantile()")
Estatistica <- c("Soma de valores", "Média", "Variância", "Mediana", "Resumo estatístico", "Quantis")

funcoes <- data.frame(funcoes_R, Estatistica)
funcoes

# Exemplo:
vetor.num <- c(1, 2, 5, 8, 1001)

# Soma
1 + 2 + 5 + 8 + 1001
sum(vetor.num)

# Média
(1 + 2 + 5 + 8 + 1001) / 5
mean(vetor.num)

# Variancia
((1 - mean(vetor.num))^2 + (2 - mean(vetor.num))^2 + (5 - mean(vetor.num))^2 + (8 - mean(vetor.num))^2 + (1001 - mean(vetor.num))^2) * 1 / 4
var(vetor.num)

# Pacotes: são conjunto extra de funções do R que podem ser instalados.

# Antes de iniciar um código novo é preciso instalar um pacote usando o comando:
install.packages("Nome do pacote")

# Em seguida para usar o comando devemos usar:
library("Nome do pacote")

# Exemplo:
install.packages("fBasics")
library(fBasics)
basicStats(vetor.num)

# --------------- DEFININDO O LOCAL DOS DADOS ------------------ #
# Como direcionar o R para ler o arquivo que deseja trabalhar, para informar ao
# R qual pasta ele deve ler, utilizar o commando:
setwd("colocar aqui o link da pasta do arquivo")

# Após isso é necessario fazer a leitura do arquivo. O R base possui funções para
# a leitura dos principais tipos de arquivos. Um outro pacote especifico, e muito 
# bom para isso, é o readr.

# Exemplo:
setwd("/home/quant/Documents/Books_Python_I_Books_Finance/R/R_fundamentos")
dados <- read.table("etnias.csv", header = TRUE, sep = ",")
dados

# O head e tail são funções para ver a "cabeça" e o "rabo" dos seus dados, ou seja,
# o começo e o fim das amostras. Essa observação ajuda a identificar erros básicos 
# no carregamento, possibilitando ajustes o quanto antes.

# Outros comandos muito importantes para começar a investigar os dados são o str(), 
# o class() e o summary().

# Para verificar o tipo de objeto, ou seja, sua classe, utilize: class(dados)

# Já para verificar a estrutura do objetos, ou seja, seus campos (quando aplicável),
# insira str(dados).

# Para verificar estatística básicas do objetos (média, mediana, quantis, mínimo, máximo etc.),
# quando aplicáveis: summary(dados).

head(dados)
tail(dados)
class(dados)
str(dados)
summary(dados)
head(dados$Etnia)
head(dados$Idade)
tail(dados$Codigo)










