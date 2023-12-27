# -------------- MATRIZES-------------- #
# Criandp Matrizes 


# Número de linhas
matrix(c(1,2,3,4,5,6), nr=2)
matrix(c(1,2,3,4,5,6), nr=3)
matrix(c(1,2,3,4,5,6), nr=6)

# Número de colunas
matrix(c(1,2,3,4,5,6), nc=2)

# Help
?matrix
class("matrix")
help("matrix")
typeof("matrix")

# Número precisam ter um número par de valores
matrix(c(1,2,3,4,5), nc=2)

# Criando matrizes a partir de vetores e preenchendo a partir de vetores
meus_dados = c(1:10)
matrix(data = meus_dados, nrow=5, ncol=2, byrow = T)

# Fatiando a Matriz
mat <- matrix(c(2,3,4,5), nr=2)
mat
mat[1,2]
mat[2,2]
mat[1,3]
mat[,2]

# Criando uma matriz diagonal
vetor = 1:3
diag(vetor)

# Extraindo vetor de uma matriz diagonal
vetor = diag(matriz)
diag(vetor)

# Transporta da matriz
w <- matrix(c(2,4,8,12), nr=2, ncol = 2)
w
t(w)
u <- t(w)
u

# Obtendo uma matriz inversa
solve(w)

# Multiplicação de matrizes
mat1 <- matrix(c(2,3,4,5), nr=2)
mat1
mat2 <- matrix(c(6,7,8,9), nr=2)
mat2

mat1 * mat2
mat1 / mat2
mat1 + mat2
mat1 - mat2

# Multiplicando a matriz com vetor 
x = c(1:4)
x
y <- matrix(c(2,3,4,5), nr=2)
x * y

# Nomeando a metriz
mat3 <- matrix(c("Futebol", "Natação", "Campo", "Piscina"), nr=2)
mat3
dimnames(mat3) = (list(c("Linha 1", "Linha 2"), c("Coluna 1", "Coluna 2")))
mat3

# Combinando Matrizes
mat4 <- matrix(c(2,3,4,5), nr=2)
mat4
mat5 <- matrix(c(6,7,8,9), nr=2)
mat5
cbind(mat4, mat5) # concatenar duas matrizes em relção a sua linha
rbind(mat4, mat5) # concatenar duas matrizes em relação a sua  coluna

# Desconstruindo uma Matriz
c(mat4)






