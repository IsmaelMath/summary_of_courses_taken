# ------------------------- MANIPULAÇÂO DE DADOS ------------------------- #

# A manipulção de dados é como ato de tranformar, limpar, agregar e juntar os   
# dados.

# Existe diversos tipos de objetos, e cada tipo "armazena" um conteudo diferente
# desde de tabelas de dados recém-carregada, texto, números, ou simplesmente 
# afimação de verdade ou falso.


# Usaremos a função class() para verificar o tipo de cada variavel:
    # Numeric - Para valores inteiros ou decimais
    # Character - Para valores textuais
    # Logical - Para valores lógicos (Verdadeiro ou falso)
      

inteiro <- 828
outro.inteiro <- 5e2 # Mesma coisa 500 notação cientifica 5e2
decimal <- 182.98
caracter <- "esportação"
logico <- TRUE
outro.logico <- FALSE

class(inteiro)
class(logico)
outro.inteiro

# Além dos tipos básicos existem também os tipos "complexo" que são vetor, matriz,
# lista, data.frame e fator.

# A função matrix cria uma matriz com os valores do argumento data. O número de linhas
# e colunas são definidos pelos argumentos nrow e ncol.

# Exemplo:
minha.matriz <- matrix(data = 1:12, nrow = 3, ncol = 4)
minha.matriz

# Data.frame é o mais utilizado, nele é armazenado conjunto de dados estruturados
# em linhas e colunas

# Vetor também é muito usado e nele estão sequencia unidimensionais de valores de 
# um mesmo tipo, podendo ser feita as seguintes atirbuições:
# Exemplo:

vetor.chr <- c("Tipo 1", "tipo 2", "tipo 3", "tipo 4")
vetor.num <- c(1, 2, 5, 8, 1001)
vetor.num.repetidos <- c(rep(2, 50))# usando função para repetir números
vetor.num.sequencia <- c(seq(from=0, to=100, by=5))# usando função para criar sequências
vetor.logical <- c(TRUE, TRUE, TRUE, FALSE, FALSE)

vetor.chr
vetor.num
vetor.num.repetidos
vetor.num.sequencia
vetor.logical

# conhecendo o data.frame e o vetor, você será capaz de entender como os dois se
# realcionam. Cada coluna de um data frame é um vetor.

# Como criar um data.frame, exemplo a seguir:
# Cria-se diferentes vetores 
nome <- c("João", "José", "Maria", "Joana")
idade <- c(45, 12, 28, 31)
adulto <- c(TRUE, FALSE, TRUE, TRUE)
uf <- c("DF", "SP", "RJ", "MG")

# Cada vetor é uma combinação de elementos de um MESMO tipo de dados
# sendo assim, cada vetor pode ser uma coluna de um data.frame

clientes <- data.frame(nome, idade, adulto, uf)
clientes

# Para selecionar ou trabalhar separadamente com apenas um campo (coluna)
# do seu data.frame, deve-se utilizar o "$"

# Usando termos mais técnicos, um data frame é um conjunto de daodos HETEROGÊNEO,
# pois cada coluna pode ser de um tipo, e BIDIMENSIONAL, por possuir apenas linhas
# e colunas. Já o vetor é um conjunto de dados HOMOGÊNEO, pois só pode ter valores
# de um mesmo tipo, e UNIDIMENCIONAL.

# Uma notação parecida é usada para selecionar elementos no data.frame. Porém, como
# já comentamos, data frames são BIDIMENSIONAIS. Então usaremos a notação [,] com virgula
# separando qual a linha (posição antes da virgula) e a coluna (posição após a virgula)
# que queremos selecionar.
# Exemplo:

clientes$nome
clientes$uf

clientes[1,1]
clientes[,1]
clientes[1,]
clientes[,2:3]
clientes[2:3,]

# ------------ VALORES FALTANTES E O NA ------------- #

# No casos onde não existe valor em uma coluna de uma linha, o R atribui NA. Ou no
# caso de valores omissos os mesmo deverão ser substituidos por NA.

# Seguem algumas funções úteis para lidar-se com NA:

  # A função summary() pode ser usada para averiguar a ocorrencia de NA.
  
  # A função is.na() realise um teste para saber se a variável/coluna possui
  # um valor NA, retornando TRUE se for NA e FALSE se não for.

  # A função complete.cases() retorna TRUE para as linhas em que todas as colunas 
  # possuem valores válidos (preenchidos) e FALSE para linhas em que, em alguma coluna
  # existe um NA. Ou seja, esta função diz quais são as linhas (amostras) completas
  # em todas as suas características (campos)

  # Algumas funções possuem o argumento na.rm, ou semelhantes, para descosiderar
  # NA no cálculo. É o caso da função mean() ou sum()

# Exemplo:

x <- c(1,2,NA,3)
x
mean(x)
mean(x, na.rm=TRUE)

xn = na.omit(x)
xn
mean(xn)

# Exemplo:
df <- data.frame(x = c(1,2,3), y=c(0,10,NA))
df
na.omit(df)

