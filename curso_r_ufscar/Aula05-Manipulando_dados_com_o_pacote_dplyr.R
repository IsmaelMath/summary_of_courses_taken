# ------------------- MANIPULANDO DADOS COM PACOTE DPLYR  ------------------- #

# PACOTE DPLYR - Ao carregar o pacote tidyverse, você já carregará automatizamente o pacote dplyr.
# O forte do pacote dplyr é a sintaxe semples e concisa, o que facilita o aprendizado e
# torna o pacote um dos preferidos para as tarefas do dia a dia. Também conta como ponto
# forte sua otimização de performance para manipulação de dados.

# As funções do dplyr reproduzem as principais tarefas da manipulação, de forma bastante
# intuitiva.

# Oselect() é uma função mais semples de ser entendida. É usada para selecionar variáveis 
# (coluna, campos, features...) do seu data frame. Pode ser feito também uma "seleção negativa",
# ou seja, escolher as colunas que não quer.

setwd("/home/quant/Documents/Books_Python_I_Books_Finance/R/R_fundamentos")
dados <- read.table("etnias.csv", header = TRUE, sep = ",")
dados

# Exemplo:
install.packages("tidyverse")
library(dplyr)
library(tidyverse)
dados.1<-dados%>%select(Idade, Sexo) 
head(dados.1)

dados.1<-dados%>%select(-Idade, -Sexo) 
head(dados.1)

# Além de escolher apenas alguns campos, apenas algumas linhas, utilizando alguma condição
# como filtragem. Para isso, basta utilizar a função filter. Exemplo 19:

dados1 <- dados %>%
  select(Idade, Peso, Sexo, Etnia) %>%
  filter(Sexo == "M" & Etnia =="Branco")
dados1

# Para criar novos campos, podemos usar o mutate. Exemplo 20:
# obs <- Sexo == "M" & Etnia == "Branco" como eu poderia implemantar isso nesse racional

dados1 <- dados %>%
  select(Idade, Peso, Sexo, Etnia) %>%
  mutate(Sexo == "M" & Etnia == "Branco")
dados1

# GROUP BY E SUMMARISE
# O group_by() e o summarise() são operações que trabalham na geração dos dados, ou seja, um dados mais 
# detalhado passa a ser um dado mais agregado e agrupado, em consequência disso, menos detalhes.

# O agrupamento de dados geralmente é trabalhado em conjunção com sumarizações, que usam funções
# matemáticas do tipo soma, média, desvio padrão etc. Enquanto o group_by() "separa" seus dados
# nos grupos que você selecionar, o summarise() faz operações de agregação de linhas limitadas
# a esse grupo.
 
install.packages("nycflights13")
library(nycflights13)
library(tidyverse)
data("flights")
str(flights)

# Vamos obter a média de atrase da chegada e da partida para cada mês. Para isso, primeiro
# agrupamentos no nível necessário e depois sumarizamos. Exemplo:
media <- flights %>%
  group_by(month) %>%
  summarise(arr_delay_media = mean(arr_delay, na.rm = TRUE),
            dep_delay_media = mean(dep_delay, na.rm = TRUE))
media

# O operador %>% é usado para encadeamento das manipulação, ou seja, informar que um resultado
# da operação anterior será a entrada para a nova operação.

# A função arrange() serve para organizar os dados em sua ordenação. Costuma ser uma das últimas 
# operações, normalmente usada para organizar os dados e facilitar visualizações ou criação de relatório.
# Utilizando o exemplo anterior, gostariamos de ordenar os meses pelas menores médias de decolagem (para
# ordens decrecentes basta usar o sinal de menos -). Exemplo:

media <- flights %>%
  group_by(month) %>%
  summarise(arr_delay_media = mean(arr_delay, na.rm = TRUE),
            dep_delay_media = mean(dep_delay, na.rm = TRUE)) %>% arrange(dep_delay_media)
media






