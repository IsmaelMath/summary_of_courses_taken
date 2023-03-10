# -------------- R FUNDAMENTOS PARTE 2 -------------- #

# Fatores e Funções 
# Pacotes 
# Expressões Regulares
# Data
# Gráficos

# Revusão e Aprofundamento

# Interagindo com o sistema operacional
list.files()
.Plotform$Linux.type
.Plotform$File.sep
Sys.Date()
Sys.info()
R.version
?system
system("ls -a")

# Criando um Vetor
vec1 <- c(12, 3, 4, 19, 34)
vec1

# Criando uma Matriz
dados <- c(1:50)
mat1 <- matrix(dados, nrow=5, ncol=5, byrow=T)
mat1

# Criando Listas
lst1 <- list(vec1, mat1)
lst1

# Criando DataFrames 
charac_vec <- c("A", "B", "C")
num_vec <- c(4.5, 3.9, 7.2)
logic_vec <- c(TRUE, TRUE, FALSE)
df1 <- data.frame(charac_vec, num_vec, logic_vec)
df1

# Comparando Vetores e Matrizes
vec1 > 10
mat1 > 20
mat1 == 2
mat1 == 2 | mat1 == 3
mat1 > 2 & mat1 < 4
!mat1 > 2 & mat1 < 4

for (i in length(vec1)){
  if(vec1[i] < 10) {
    Print("Pelo menos um elemento do vetor é maior que 10")
  } else {
    print("Todos os elementos do vetor são menores que 10")
  }
}

# Operações com Listas e Matrizes
lst2 <- list(2, 3, 5, 7, 11, 13)
lst2

for (p in lst2) {
  print(p)
}

for (i in 1:length(lst2)){
  print(lst2[i])
}

mat1
mat2 <- t(mat1)
mat2

for (i in mat1) {
  for (j in mat2) {
    total <- sum(mat2) + sum(mat1)
  }
}
print(total)

# Nomeando Vetores, Matrizes, Listas e DataFrames 
names(vec1) <- c("Col 1", "Col 2", "Col 3", "Col 4", "Col 5")
vec1
dimnames(mat1) = (list(c("Obs 1", "Obs 2", "Obs 3", "Obs 4", "Obs 5")))
mat1
names(lst1) <- c("Vetor",  "Matriz")
lst1
colnames(df1) <- c("Caracteres", "Float", "Inteiros")
rownames(df1) <- c("Obs 1", "Obs 2", "Obs 3")
df1

# Verificando e Convertendo
is.vector(vec1)
is.vector(mat1)

as.vector(mat1) # As funções "as." converte
as.list(mat1)
as.data.frame(mat1)
as.character(mat1)
mat1

df1
as.matrix(df1)
as.numeric(df1)

# Valores NA
mat2 <- matrix(1:90, 10)
mat2
mat2[sample(1:50, 10)] = NA
mat2

? is.na
na_lista <- is.na(mat2)
na_lista

# Operações com objetos 
vec1
sum(vec1)
mat1
rowSums(mat1)
colSums(mat1)
cbind(vec1, mat1)
rbind(vec1, mat1)
mat1 * 3

# Ranking e Ordenamento
a <- c(100, 10, 1000)
order(a)
a[order(a)]

# Slincing
vec1
vec1[2]
mat1
mat1[1:3, 2:4]
lst1 
lst1[[1]]
lst1[[1]][4]
lst1$Matriz

# DataFrames

mtcars
head(mtcars)
tail(mtcars)
str(mtcars)
?str
mtcars[, 5]
mtcars[1:4, 7:9]
mtcars[1:4, "hp"]
mtcars["hp"]
mtcars$hp
subset(mtcars, subset = hp > 170)
library(dplyr)
install.packages("dplyr")
slice(mtcars, 1:4)
order(mtcars)
order(mtcars$mpg)




