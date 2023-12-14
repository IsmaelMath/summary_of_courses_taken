# ---------------- PRINCIPAIS OBJETOS E FUNCIONALIDADES NO R ---------------- #

# PRINCIPAIS OBJETIVOS
  # VETORES
  # LISTAS
  # COMANDO ÚTEIS 
  # MATRIZES
  # TABELAS

# PRINCIPAIS TIPOS DE OBJETOS NO R
  # VETORES
  # LISTAS
  # MATRIZES
  # ARRAYS
  # TABELAS
# -----------------------------------------------------------------------------------  
# VETORES - Em computação é comum manipular conjunto de valores como notas, preços,
#           nomes etc. Para manipular um conjunto de dados de um mesmo tipo (inteiro,
#           real, strings) há uma estrutura de dados denominados de vetor;

# Vetores são "agregados homogeneos unidimensionais" que permite agrupar um conjunto de valores
# de um mesmo tipo em uma única variável.

# Exemplo - Vamos definir um vetor "nota" de tamanho 5 de tipo inteiro, 
# nota = (60, 95, 80, 50, 98)
# OBS.: O colchetes é o operador do objeto que está associado ao índice

# ------+----------+----------+----------+----------+----------+
# Índice|     1    |     2    |     3    |     4    |     5    |
# ------+----------+----------+----------+----------+----------+
# Valor |    60    |    95    |    80    |    50    |    98    |     
# ------+----------+----------+----------+----------+----------+
# Vetor | nota[1]  | nota[2]  | nota[3]  | nota[4]  | nota[5]  |
# ------+----------+----------+----------+----------+----------+

# Exemplo
nota = c(60, 95, 80, 50, 98)
nota
str(nota)
nota[5]
nota[3]
nota[1:3]
# -----------------------------------------------------------------------------------  
# LISTAS - É um objeto consistindo de uma coleção ordenada de objetos conhecidos como seus
#          componentes;

# Permite reunir em um só objeto componentes de diversos tipos, como por exemplo, vetor,
# valores lógicos, matriz, array etc.

# No R o comando para gerar uma lista é o list

# Exemplo - Vamos criar um objeto no R com as seguites informações: Fred e sua esposa Mary
# tem 3 crianças, com idades 4, 7 e9, respectivamente.
# OBS.: Note que temos informações de números, nomes e um valor.

# Exemplo
# Definindo uma lista
lst = list(nome="Fred", esposa="Mary", criancas=3,
           idade=c(4, 7, 8)); lst

# Para acessar os elementos da lista pode-ser utilizar os operadores [xx] ou $. Os xx reprenta
# posições dos elementos, que se deseja visualizar.

# Veja nos exemplos ao lado a diferença entre eles.

# IMPORTANTE: O uso desses operadores é bastante útil não somente em listas, mas também
# em arrays, matrizes e tabelas

# O que a última linha de comando (lst[[4]][-1])

# Exemplo:

lst[2] # Ver o segundo objeto da lista 

lst[2:3] # Ver o segundo e o terceiro objeto da lista 

lst[[2]] # Ver o segundo objeto da lista (diferente)

lst[[4]][2] # Se o componente for um vetor, para ver o segundo elemento desse vetor

## Alternativamente 

lst$esposa # Ver o componente esposa

lst$cidade[2] # Semelhante ao lst[[4]][2]

lst[[4]][-1] # O que acontece ?

# -----------------------------------------------------------------------------------  
# ALGUNS COMANDOS ÚTEIS - Existem alguns comandos em R (e certamente em outras linguagens),
# que permitem adicionar e/ou remover elementos de uma lista, vetor etc;

# Ao adicionar ou remover elementos, o tamanho da lista também é modificado;

# Podemos adicionar um elemento ou vários elementos

# Podemos ordenar os elementos de um vetor em ordem crecente ou decrescente automaticamente;

# Essa situações são resolvidas pelos comandos append e sort no R.

# APPEND
# Se quisermos adicionar um elemento após o último valor do vetor 
# nota = (60, 95, 80, 50, 98)

# ------+----------+----------+----------+----------+----------+----------+
# Índice|     1    |     2    |     3    |     4    |     5    |    6     |
# ------+----------+----------+----------+----------+----------+----------+
# Valor |    60    |    95    |    80    |    50    |    98    |    20    |
# ------+----------+----------+----------+----------+----------+----------+
# Vetor | nota[1]  | nota[2]  | nota[3]  | nota[4]  | nota[5]  | nota[6]  |
# ------+----------+----------+----------+----------+----------+----------+

?apppend # Pedir ajuda

nota1=append(nota, 20); nota1
# DICA : Veja o help da função append para mais conhecimentos.

# Se quisermos adicionar um elemento após o primeiro valor do vetor 
# nota = (60, 95, 80, 50, 98, 35)

# ------+----------+----------+----------+----------+----------+----------+
# Índice|     1    |     2    |     3    |     4    |     5    |    6     |
# ------+----------+----------+----------+----------+----------+----------+
# Valor |    60    |    20    |    80    |    50    |    98    |    20    |
# ------+----------+----------+----------+----------+----------+----------+
# Vetor | nota[1]  | nota[2]  | nota[3]  | nota[4]  | nota[5]  | nota[6]  |
# ------+----------+----------+----------+----------+----------+----------+

nota2=append(nota1, 20, 1); nota2

# SORT - Se quisermos organizar o vetor nota=(60, 95, 80, 50, 98) em ordem crescente.

#                         Original
# ------+----------+----------+----------+----------+----------+
# Índice|     1    |     2    |     3    |     4    |     5    |
# ------+----------+----------+----------+----------+----------+
# Valor |    60    |    95    |    80    |    50    |    98    |     
# ------+----------+----------+----------+----------+----------+
# Vetor | nota[1]  | nota[2]  | nota[3]  | nota[4]  | nota[5]  |
# ------+----------+----------+----------+----------+----------+

#                   Ordenado em ordem crescente
# ------+----------+----------+----------+----------+----------+
# Índice|     1    |     2    |     3    |     4    |     5    |
# ------+----------+----------+----------+----------+----------+
# Valor |    50    |    60    |    80    |    95    |    98    |     
# ------+----------+----------+----------+----------+----------+
# Vetor | nota[1]  | nota[2]  | nota[3]  | nota[4]  | nota[5]  |
# ------+----------+----------+----------+----------+----------+

nota
nota4=sort(nota); nota4

# SORT - Se quisermos organizar o vetor nota=(60, 95, 80, 50, 98) em ordem decrescente.

#                         Original
# ------+----------+----------+----------+----------+----------+
# Índice|     1    |     2    |     3    |     4    |     5    |
# ------+----------+----------+----------+----------+----------+
# Valor |    60    |    95    |    80    |    50    |    98    |     
# ------+----------+----------+----------+----------+----------+
# Vetor | nota[1]  | nota[2]  | nota[3]  | nota[4]  | nota[5]  |
# ------+----------+----------+----------+----------+----------+

#                   Ordenado em ordem decrescente
# ------+----------+----------+----------+----------+----------+
# Índice|     1    |     2    |     3    |     4    |     5    |
# ------+----------+----------+----------+----------+----------+
# Valor |    50    |    60    |    80    |    95    |    98    |     
# ------+----------+----------+----------+----------+----------+
# Vetor | nota[1]  | nota[2]  | nota[3]  | nota[4]  | nota[5]  |
# ------+----------+----------+----------+----------+----------+

nota
nota5 = sort(nota, decreasing = TRUE); nota5

# -----------------------------------------------------------------------------------  
# MATRIZES - são equivalente a vetores, contudo permitem a utilização de diversas dimensões 
# acessadas via diferentes índices.

# Pode ser pensada como vetor onde cada célula é outro vetor, recursivamente.

# Em diversas situações matrizes são necessarias para correlacionar informações.

# EXEMPLO - Assumindo que uma turma tem três alunos e fossem anotadas as notas de 5
# avaliações, seria necessário uma matriz bidimensional para aguardar as notas de todos
# os alunos dessa turma.

# 
#____________________________________________________
#                           Avaliações
#  ALUNO --------------------------------------------
#              1        2       3       4       5       
# ---------+--------+-------+-------+-------+-------+
#    1     |   5    |  4.5  |   7   |  5.2  |  6.1  |  
# ---------+--------+-------+-------+-------+-------+
#    2     |  2.1   |  6.5  |   8   |   7   |  6.7  |  
# ---------+--------+-------+-------+-------+-------+
#    3     |  8.6   |   7   |  9.1  |  9.3  |  9.3  |
# ---------+--------+-------+-------+-------+-------+


# Em anotação matricial, os dados do exemplo 3 são dados por:

#   _                            _
#  |   5    4.5   7    5.2   6.1  | 
#  |  2.1   6.5   8     7    6.7  |
#  |_ 8.6    8   9.1   8.7   9.3 _|

# que é uma matriz de 3 linhas e 5 colunas.

# No R utilizaremos o comando matrix, que tem como argumento:
  # O vetor de dados;
  # byrow = TRUE, significa que o preenchimento na metriz é sentido linha;
  # nrow e ncol são o número de linhas e colunas.


# Exemplo:

lista = c(5, 4.5, 7, 5.2, 6.1, 2.1, 6.5, 8, 7, 6.7, 8.6, 7, 9.1, 8.7, 9.3); lista
turma = matrix(lista, byrow = TRUE, nrow = 3, ncol = 5); turma

# Se quisermos colocar os "Nomes" nas linhas e colunas
rownames(turma) = c("Aluno 1", "Aluno 2", "aluno 3")
colnames(turma) = c("Nota 1", "Nota 2", "Nota 3", "Nota 4", "Nota 5")
turma

# Com os dados do exemplo anterior, vamos calcular a media aritmedica simples das notas
# dos alunos da turma.

# As notas configuram uma variável x tipo numérica com índices i e j. Assim, Xij refere-se
# a nota j do aluno i. Por exemplo, X23 refere-se a 3ª nota do segundo aluno
 
#____________________________________________________
#                             Nota
#  ALUNO --------------------------------------------
#              1        2       3       4       5       
# ---------+--------+-------+-------+-------+-------+
#    1     |  X11   |  X12  |  X13  |  X14  |  X15  |  
# ---------+--------+-------+-------+-------+-------+
#    2     |  x21   |  X22  |  X23  |  X24  |  X25  |  
# ---------+--------+-------+-------+-------+-------+
#    3     |  X31   |  X32  |  X33  |  X34  |  X35  |
# ---------+--------+-------+-------+-------+-------+

# A média é dada pela seguinte fórmula

#           (X11 + X12 + X13 + ....... + X33 + X34 + X35) 
#  Media =  ---------------------------------------------
#                              15

# Precisamos, primeiramente, somar os elementos. Como os dados estão disposto em matriz,
# podemos utilizar as estruturas de repetição FOR para varrer as linhas e colunas da matriz.

# Além disso, precisaremos de um objeto, o qual será somado a cada iteração do FOR. Chamaremos
# esse objeto de soma e seu valor inicial é zero.

# Copie e cole os códigos a seguir no seu script.

# Exemplo:
n1 = dim(turma)[1]; n1 # Número de linhas
nc = dim(turma)[2]; nc # Número de colunas

soma = 0 # Objeto com que receberá a soma

# FOR para percorrer as colunas (Notas)
for (i in 1:n1){
  # FOR para percorrer as colunas (Notas)
  for (j in 1:nc){
    soma = soma + turma[i, j]
  }
}

soma
media= soma / (n1+nc); media

# ---------------------------------------------------------------------------  
# TABELA - É um objeto que contém múltiplos vetores que são do mesmo tamanho. Esse vetores
# Esse vetores podem ser do tipo numérico, logíco ou de caracteres.

# É semelhante a uma matriz, com a vantagem de permitir a inclusão de caracteres não numéricos.

# É também semelhante a uma planilha ou base de dados e é últil para representar dados experimentais.

# No R o comando para criar uma tabela é o data.frame.

# Exemplo Um questionario foi aplicado aos cinco funcionarios do setor administrativo 
# de uma empresa fornecendo os dados apresentados na tabela.

# Tabela: Resposta dos funcionarios do setor admistrativo da empresa ao questionario

# _____________________________________________________________________________
# Funcionário |   Curso   |  Idade  |  Salário (R$)  |  Anos de empresa  | Sexo  |
# ------------+-----------+---------+----------------+-------------------+-------+
#     Lisa    | Superior  |    34   |     1100,00    |         5         |   F   |
# ------------+-----------+---------+----------------+-------------------+-------+
#   Godofredo |  Superior |    43   |     1450,00    |         8         |   M   |
# ------------+-----------+---------+----------------+-------------------+-------+
#     João    |fundamental|    21   |      450,00    |         3         |   M   |
# ------------+-----------+---------+----------------+-------------------+-------+
#     Joana   |   Médio   |    37   |      960,00    |         8         |   F   |
# ------------+-----------+---------+----------------+-------------------+-------+
#      Alba   |   Média   |    25   |      600,00    |         2         |   F   |
# ------------+-----------+---------+----------------+-------------------+-------+

# Primeiro precisamos, criar os vetores que receberão cada coluna da tabla

# IMPORTANTE: Não esquecer que os nomes ou letras devem estar entre aspas.

# Exemplo:

nome = c("Lisa", "Godofredo", "João", "Joana", "Alba")
curso = c("Superior", "Superior", "Fundamental", "Médio", "Médio")
idade = c(34, 43, 21, 37, 25)
salario = c(1100, 1450, 450, 960, 600)
anos = c(5, 8, 3, 8, 2)
sexo = c("F", "M", "M", "F", "F")
df <- data.frame(nome, curso, idade, salario, anos, sexo, stringsAsFactors = FALSE); df

# OBS.: Os operadores [xx] ou $, apresentados nas LISTAS, têm a mesma funcionariedade nas
# nas tabelas.

# Caso queiramos subdividir a tabela, o comando subset no R apresenta uma forma interessante de fazer iso.
# Seus argumentos são:
  # O objeto a ser subdividos
  # subset: coluna e forma de subdivisão
  # select: se indica, retorna as colunas que satisfazem a subdivisão.

# Copiando e cole os códigos no seu script e veja a funcionalidade do comando subset.

#exemplo - Subdividindo o dataframe

df$curso # se quiser apenas uma coluna 

# Com o comando subset
?subset # Pedindo ajuda

subset(df, curso=="Médio")
subset(df, anos>3)
subset(df, sexo=="M")
subset(df, sexo=="F")
subset(df, sexo="F" & anos>2)
subset(df, anos>2, select = c(curso, nome))
subset(df, sexo=="F", select = c(curso, nome))
subset(df, select = nome:anos)
subset(df, select = -nome)

# Armazenndo num novo objeto para ser usado

df2 = subset(df, select = -nome); df2
# -----------------------------------------------------------------------------------  
# TRABALHANDO COM MATRIZES E TABELAS - Voltando ao Exemplo anterior, se quisessemos calcular 
# a média das notas de cada aluno, como deveríamos proceder?

# Uma alternativa serie utilizar a estrutura de repetição FOR em cada linha da matriz.

# Uma outra alternativa seria usar funções prontas no R que facilitam a manipulação de matrizes
# e tabelas, como é o caso das funções da família apply (apply, tapply, sapply, ...).

# Vamos mostrar como as funções apply e tapply podem ser úteis bos exemplos.

# APPLY - Aplica uma função (soma, máximo, média etc.) às linhas ou colunas de uma matriz
# ou array. Seus argumentos são:

  # X: uma matriz (pode ser array)
  # MARGIN: pode ser 1 ou 2. Se 1, a operação é feita nas linhas e 2 a operação é feita nas colunas.
  # FUN: a função a ser utilizada

# Exemplo - Utilizando a matriz do Exemplo, calcule a média da nota de cada aluno. Utilize a equação 1,
# lembrando que deve-se somar apenas cinco notas e dividir por cinco.

# Media para cada aluno
n1 = dim(turma)[1] # Número de linhas
nc = dim(turma)[2] # Número de colunas
#  Objeto com que reveberá a soma
soma=c(0, 0, 0)
# FOR para percorrer as linhas (alunos)
for (i in 1:n1){
  # FOR para percorrer as colunas (Notas)
  for (j in 1:nc) {
    soma[i] = soma[i] + turma[i, j]
  }
}
soma # Devemos ter 3 valores
media = soma / nc; media
# Ou simplesmente
apply(turma, 1, mean)
"pagina 25"
# -----------------------------------------------------------------------------------  
# -----------------------------------------------------------------------------------  
# -----------------------------------------------------------------------------------  

































