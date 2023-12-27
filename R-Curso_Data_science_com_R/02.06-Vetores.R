# -------------- VECTOR-------------- #

# Vetor de caracter
vetor_caracter = c("Olá", "DSA")
vetor_caracter

# Vetor Floats
vetor_numeric = c(1.90, 45.3, 300.5)
vetor_numeric

# Vetor de valores complexos
vetor_complexo = c(5.2+3i, 3.8+4i)
vetor_complexo

# Vetor de valores lógicos
vetor_logico = c(TRUE, FALSE, TRUE, FALSE, FALSE)
vetor_logico

# Vetor de números inteiros
vetor_integer = c(2, 4, 6)
vetor_integer

# utilizando seq()
vet1 = seq(1:10)
vet1
is.vector(vet1)

# Utilazando rep()
vet2 = rep(1:50)
vet2

# Indexação de vetores
a <- c(1, 2, 3, 4, 5)
a
a[1]
a[6]

b <- c("Data", "Science")
b
b[1]

# Combinando vetores
v1 = c(2, 3, 5)
v2 = c("aa", "bb", "cc", "dd", "ee")
c(v1,v2)

# Operações com vetores
x = c(1, 3, 5, 7)
y = c(2, 4, 6, 8)

x * 5
x + y
x - y
x * y
x / y

# Somando vetores com números diferentes de elementos
alfa = c(10, 20, 30)
beta = c(1, 2, 3, 4, 5, 6, 7, 8, 9)
alfa + beta

# Vetor Nomeado
v = c("Barack", "Obama")
v
names(v) = c("Nome", "Sobrenome")
v
v["Nome"]













