# -------------- LISTAS -------------- #

# Listas

# Use list() para criar listas 
lista_caracter = list("A", "Bem-vindo", "DSA")
lista_caracter

# Lista númerica inteira 
lista_inteiros = list(2,3,4)
lista_inteiros

# Lista Float
Lista_numerico = list(1.90, 45.3, 300.5)
Lista_numerico

# Lista de números complexos 
lista_complexos = list(5.2+3i,2.4+8i)
lista_complexos

# Lista de valores lógicos
lista_logicos = list(TRUE, FALSE, FALSE)
lista_logicos

# Lista Compostas
lista_composta1 = list("A", 3, TRUE)
lista_composta1

lista1 <- list(1:10, c("Maria", "João", "Alfredo"), rnorm(10))
lista1

?rnorm

# Slicing da lista 
lista1[1]
lista1[c(1,2)]
lista1[2]
lista1[[2]][1]
lista[[2]][1] = "Monica"
lista1

# Para nomear os elementos - lista Nomeadas 
names(lista1) <- c("Inteiro", "Caracteres", "Numéricos")
lista1

vec_num <- 1:4
vec_char <- c("A", "B", "C", "D")

lista2 <- list(Numeros = vec_num, letras = vec_num)
lista2

# Nomear os elementos diretamente
lista2 <- list(elemento1=3:5, elemento2=c(7.2,3.5))
lista2

# Trabalando com elementos específicos da lista
names(lista1) <- c("Inteiros", "Caracteres", "Numéricos")
lista1

lista1$Caracteres
length(lista1$Inteiros)
lista1$inteiros
# Verisicar o comprimento da lista
length(lista1)

# Trabalando extrair um elemento espcífico dentro de cada nível da lista
lista1$Caracteres[2]

# Mode dos elementos
mode(lista1$Numéricos)
mode(lista1$Caracteres)

# Combinando 2 listas 
lista3 <- c(lista1, lista2)
lista3

# Tranformando um vetor em lista
v = c(1:3)
v
l = as.list(v)
l

# Unindo 2 elementos em uma lista
mat = matrix(1:4, nrow = 2)
mat
vec = c(1:9)
vec
lst = list(mat, vec)
lst


























