# -------------- DATAFRAMES -------------- #

# - Criando DataFrames:
# read.xls() - Excel
# read.mtp() - Minitab
# read.spss() - SPSS
# read.table() - Arquivo txt
# read.csv() - Arquivo csv
# read.delim() - Leitura de arquivo delimitados

# Criando um dataframe vazio

df <- data.frame()
class(df)

# Criando vetores vazios
nomes <- character()
idade <- numeric()
datas <- as.Date(character())
codigos <- integer()

df <- data.frame(c(nomes, idade, datas, codigos))
df

# Criando Vetores
pais = c("EUA", "Dinamarca", "Holanda", "Espanha", "Brasil")
nome = c("Maurício", "Pedro", "Aline", "Beatriz", "Marta")
altura = c(1.78, 1.72, 1.63, 1.59, 1.63)
codigos = c(5001, 2183, 4702, 7965, 8890)

# Adicionando um dataframe de diversos Vetores
Pesquisa = data.frame(pais, nome, altura, codigos)
Pesquisa

# Adicionando um novo vetor a um dataframe existente
olhos = c("verde", "azul", "azul", "castanho", "castanho")
pesq = cbind(Pesquisa, olhos)
pesq

# Informação sobre o dataframe
str(pesq)
dim(pesq)
length(pesq)

# Obtenha um vetor de um dataframe
pesq$pais
pesq$nome

# Extraindo um unico valor
pesq[1,1]
pesq[3,2]

#Número de linhas e Colunas
nrow(pesq)
ncol(pesq)

# Primeiros elementos do dataframe
head(pesq)
tail(mtcars)

# Data Frames built-in do R
?mtcars
mtcars

# Filtro oara um subset de dados que atendem a um critério
pesq[altura<1.60,]
pesq[altura < 1.60, c("codigos", "olhos")]
pesq

colnames(pesq) <- c("var 1", "var 2", "var 3", "var 4", "var 5")
rownames(pesq) <- c("Obs 1", "Obs 2", "Obs 3", "Obs 4", "Obs 5")
pesq

# Importando arquivos
# read.xls() - Excel
# read.mtp() - Minitab
# read.spss() - SPSS
# read.table() - Arquivo txt
# read.csv() - Arquivo csv
# read.delim() - Leitura de arquivo delimitados

?read.csv
df2 <- data.frame(read.csv(file = '/home/quant/Documents/Books_Python_I_Books_Finance/R/R_fundamentos/dframe.csv', header = TRUE, sep=","))
head(df2)
summary(df2)

df2$Diabete
df2$status # somente por obs 
df2$Status
df2$Admdate

plot(df2$Admdate)

summary(mtcars$mpg)
plot(mtcars$mpg, mtcars$disp)
plot(mtcars$mpg, mtcars$wt)


# Combinando dataframes 
df3 <- merge(pesq, df2)
df3







