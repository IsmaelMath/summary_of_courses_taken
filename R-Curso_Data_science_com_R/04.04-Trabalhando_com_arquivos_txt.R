# --------------------- Trabalhando com arquivos txt  --------------------- #

# Usando as funções base do R (Pacote utils)
search()


# Importando arquivos com read.table()
df1 <- read.table("/home/quant/Documents/Books_Python_I_Books_Finance/R/R_fundamentos/pedidos.txt")
df1
dim(df1)

df1 <- read.table("/home/quant/Documents/Books_Python_I_Books_Finance/R/R_fundamentos/pedidos.txt", 
                  header=TRUE, sep=",")
df1
dim(df1)

df1 <- read.table("/home/quant/Documents/Books_Python_I_Books_Finance/R/R_fundamentos/pedidos.txt", 
                  header = TRUE,
                  sep=",", col.names = c("Var_1", "Var_2", "Var_3"))
df1

df1 <- read.table("/home/quant/Documents/Books_Python_I_Books_Finance/R/R_fundamentos/pedidos.txt",
                  header = TRUE,
                  sep=",", col.names = c("Var_1", "Var_2", "Var_3"),
                  na.strings = c("Zico", "Maradona"))
df1

df1 <- read.table("/home/quant/Documents/Books_Python_I_Books_Finance/R/R_fundamentos/pedidos.txt",
                  header = TRUE,
                  sep=",", col.names = c("Var_1", "Var_2", "Var_3"),
                  na.strings = c("Zico", "Maradona"), stringsAsFactors = FALSE)
df1
str(df1)

# Importando arquivos com read.csv()
df2 <- read.csv("/home/quant/Documents/Books_Python_I_Books_Finance/R/R_fundamentos/pedidos.txt")
df2
dim(df2)

df3 <- read.csv2("/home/quant/Documents/Books_Python_I_Books_Finance/R/R_fundamentos/pedidos.txt")
df3
dim(df3)

df3 <- read.csv2("/home/quant/Documents/Books_Python_I_Books_Finance/R/R_fundamentos/pedidos.txt", sep=",")
df3
dim(df3)

# Importando arquivos com read.delim()
df4 <- read.delim("/home/quant/Documents/Books_Python_I_Books_Finance/R/R_fundamentos/pedidos.txt")
df4

df4 <- read.delim("/home/quant/Documents/Books_Python_I_Books_Finance/R/R_fundamentos/pedidos.txt", sep=",")
df4
dim(df4)

# Importando / Exportando

# Gerando arquivo
write.table(mtcars, file="mtcars.txt")
dir()

dir()
df_mtcars <- read.table("/home/quant/Documents/Books_Python_I_Books_Finance/R/R_fundamentos/mtcars.txt")
df_mtcars
dim(df_mtcars)

write.table(mtcars, file="/home/quant/Documents/Books_Python_I_Books_Finance/R/R_fundamentos/mtcars.txt", sep="|", col.names = NA, qmethod = "double")
list.files()
read.table("/home/quant/Documents/Books_Python_I_Books_Finance/R/R_fundamentos/mtcars.txt")
df_mtcars2 <- read.table("/home/quant/Documents/Books_Python_I_Books_Finance/R/R_fundamentos/mtcars.txt")
df_mtcars2

df_mtcars2 <- read.table("/home/quant/Documents/Books_Python_I_Books_Finance/R/R_fundamentos/mtcars.txt", header = TRUE, sep="|")
df_mtcars2

# Importando arquivos da internet
df_seper_market <- read.table("diretotio do site do arquivo") 
df_seper_market






