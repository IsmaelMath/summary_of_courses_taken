# --------------------- TRABALHANDO COM ARQUIVOS CSV --------------------- # 
getwd()
# Usando o pacote readr
install.packages("readr")
library(readr)

# Abre o promt para escolher o arquivo
meu_arquivo <- read_csv(file.choose())
meu_arquivo <- read_delim(file.choose(), sep="|")

# Importando arquivos
df1 <- read_table("/home/quant/Documents/Books_Python_I_Books_Finance/R/R_fundamentos/temperaturas.txt",
                  col_names = c("DAY", "MONTH", "YEAR", "TEMP"))
head(df1)
str(df1)
read_lines("/home/quant/Documents/Books_Python_I_Books_Finance/R/R_fundamentos/temperaturas.txt", skip=0, n_max=-1L)
read_file("/home/quant/Documents/Books_Python_I_Books_Finance/R/R_fundamentos/temperaturas.txt")

# Exportando e Importando
write_csv(iris, "/home/quant/Documents/Books_Python_I_Books_Finance/R/R_fundamentos/iris.csv")

# col_integer()
# col_double()
# col_logical()
# col_character()
# col_factor()
# col_skip()
# col_date() (alias = "D"), col_datetime() (alias = "T")
attach(iris)
df_iris <- read_csv("/home/quant/Documents/Books_Python_I_Books_Finance/R/R_fundamentos/iris.csv", col_types = list(
  Sepal.Length = col_double(),
  Sepal.Width = col_double(),
  Petal.Length = col_double(),
  Petal.Width = col_double(),
  Species = col_factor(c("setosa", "versicolor", "virginica"))
  ))

dim(df_iris)
str(df_iris)

# Importando
df_cod <- read_csv("diretorio do site aonde esta o arquivo")# Essa função permite que você importe arquivos direto da internet
df_cod <- read_csv("/home/quant/Documents/Books_Python_I_Books_Finance/R/R_fundamentos/cadastro.csv")
head(df_cod)
view(df_cod)
write.csv(df_cod, "/home/quant/Documents/Books_Python_I_Books_Finance/R/R_fundamentos/df_cod_bkp.csv")

# --------------------- TRABALHANDO COM ARQUIVOS CSV PARTE 2 --------------------- # 

library(dplyr)
df_cod <- tbl_df(df_cod)
head(df_cod)

# Importando varios arquivos simultanearmente
list.files()
lista_arquivos <- list.files("/home/quant/Documents/3 - DSA - Formação em Data Science/01. Big Data Analytics com R e Microsoft Azure Machine Learning/Datasets", full.names = TRUE)
class(lista_arquivos)
lista_arquivos

lista_arquivos2 <- lapply(lista_arquivos, read.csv)
problems(lista_arquivos2)

# Parsing
parse_date("01/02/15, %m/%d/%y")
parse_date("01/02/15, %d/%m/%y")
parse_date("01/02/15, %y/%m/%d")

local("en")
local("fr")
local("pt")

# bigmemory
install.packages("bigmemory")
library(bigmemory)
?bigmemory

bigdata <- read.big.matrix(filename="/home/quant/Documents/Books_Python_I_Books_Finance/R/R_fundamentos/cadastro.csv",
                           sep=",",
                           header=TRUE,
                           skip=1)













