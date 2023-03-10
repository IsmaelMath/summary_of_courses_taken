# ----------------- O que são Objetos ?----------------- #

# - Objetos em R

# - Vetor: possui 1 dimensão e 1 tipos de dados
# - Vetores
vetor1 <- c(1:10) # Cirnado o vetor
vetor1
length(vetor1) # Tamanho do vetor
mode(vetor1) # Tipo do objeto que estamos trabalhando
class(vetor1) # Qual a classe do objeto
typeof(vetor1) # Informa a mesma coisa que a função class()  


# - Matriz: possui 2 dimensões e 1 tipo de dado
# - Matrizes
matriz1 <- matrix(1:10, nrow=2) # nrow numero de linhas 
matriz1
length(matriz1)
mode(matriz1)
class(matriz1)
typeof(matriz1)

# - Array: possui 2 ou mais dimensões e 1 tipo de dado
array1 <- array(1:5, dim = c(3,3,3))
array1
length(array1)
mode(array1)
class(array1)
typeof(array1)

# - Data Frames: dados de diferentes tipos
# - Maneira mais fácil de explicar data frames: é uma matiz com diferentes tipos de dados

View(iris)
length(iris)
mode(iris)
class(iris)
typeof(iris)

# - Listas: Coleção de diferentes objetos
# - Diferentes tipos de dados são possíveis e comuns
lista1 <- list(a=matriz1, b=vetor1)
lista1
length(lista1)
mode(lista1)
class(lista1)
typeof(lista1)

# - Funções também são vistas como objetos em R
func1 <- function(x) {
  var1 <- x * x
  return(var1)
}

func1(5)
class(func1)

# - Removendo objetos
objects()
rm(array1, func1)
objects()



