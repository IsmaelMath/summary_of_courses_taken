# ----------------------------- INTRODUÇÃO AO R ----------------------------- # 
# ------------------- OPERAÇÕES BÁSICAS DE PROGRAMAÇÃO ---------------------- # 

# 1. Conceitos básicos de programação começando pelo módulo da divisão;
# 2. Estrtura de repetição: IF, Else;
# 3. Estrtura de rpetição: For, While.

# 1. O sinal de percentagem % é o operador módulo em várias linguagens de programação
#    No R, o comando é %%


# Exemplo - Vamos resover a seguinte operação  envolvendo modulo da divisão:
# 3 mod 10
# Forma numero 1 para resolver o problema:
num = 10
num2 = 3

div = num / num2; div
rest = num %% num2; rest

# Forma numero 2 para resolver o problema:
modm = function(num, num2){
  div = num / num2
  rest = num %% num2
  return(list(div = div, rest =rest))
}

modm(10,3)

modm(9,3)

# Exemplo - Vamos resover a seguinte operação  envolvendo modulo da divisão:
# 2 mod 15
num1 = 15
num2 = 2

div = num1 / num2; div
rest = num1 %% num2; rest

# Exemplo - E se quiséssemos que o programa automaticamente identifique se o 
# número é par ou ímpar ?

num1 = 16
if(num1 %% 2 ==0) 
  print("O número é par !") else 
  print("O número é impar !")
 
# Foma mai elegante:
modm = function(num1){
  num2 = 2
  
  if(num1%%num2 == 0)
    print(paste("O número", num1, "é par"))
  else
    print(paste("O número", num1, "é impar"))
  }

modm(16)

# Estrutura condicional - Uma estrutura condicional verifica a condição de argumentos 
# passados e executa em comando caso a condição seja verdadeira.

# Antes de entrarmos na análise da estrutura em R vamos conhecer os Operadores Condicionais do R.
# Os operadores condicionais são utilizados para fazer as comparações dos valores que são passados 
# e retornam o valor Verdadeiro ou Falso.

# Operadores Condicionais:

# Operador           Tipo           Valor
# ==                 Igualdade      Verifica a igualdade entre os valores
# !=                 Diferença      Verifica a diferença entre dois valores
# >                  Comparação     Verifica se o valor A é maior que o valor b
# <                  Comparação     Verifica se o valor A é menor que o valor b
# <=                 Comparação     Verifica se o valor A é menor ou igual ao valor b
# >=                 Comparação     Verifica se o valor A é maior ou igual ao valor b


# IF - A sintaxe do IF em R é a seguinte:
# se(condição)
#     <bloco de código>
# fim


# Exemplo - Construa um programa que identifique números menores do que 10 e imprima
# na tela o resultado.

# se(num <10)
#   <print("Menor que 10")>
# fim

# Criando esse exemplo no R
num = 10

if(num<10)
  print("Menor que 10")

# Uma forma mais elegante de fazer:
mai = function(num){
  if(num<=10)
    print("O número é menor que 10")
  else
    print("Esse número é maior que 10")
}
mai(10)

# Exemplo - Crie uma rotina que pergunte quantos anos tem um carro e que, caso o tempo
# seja de até 3 anos, o carro será considerado novo.

tempo = 2
if(tempo<=3)
  print("O carro é novo")

car=function(tempo){
  if(tempo<=3)
    print("O carro é novo !")
  else 
    print("O carro é velho")
}
car(5)
car(3)

# Estruturas Condicioanl

# Quando a condição não é atendida com o comando if, é necessario utilizarmos o comando
# else;

# Neste casi, estamos trabalhando com uma estrutura condicional composta que executava um
# comando quando a condição for verdadeira e outra condição quando for falsa.

# A sintaxe do if - else em R é a seguinte:
# se (condição)
#   <bloco de código>
# se não 
#   <bloco de código>
# fim se

# Exemplo - Crie uma rotina que pergunte quantos anos tem um carro. Se ele tiver mais
# de 3 anos, é considerado velho e, caso contrário, é considerado novo.

# Início: tempo
# se (tempo <= 3)
#   <print("Carro é novo")>
# se não
#   <print("Carro é velho")>
# fim se

tempo = 8
if(tempo <= 3)
  print("O carro é novo !")
  print("O carro é velho !")
# Mesmo exemplo usando funções
carro = function(tempo) {
  if(tempo <= 3)
    print("O carro é novo !")
  else
  print("O carro é velho !")
}

carro(2)
carro(10)

# Copie e cole os códigos a seguir, denominado de "Exemplo 6 (c) no R"

tempo=function(){
  tempo=readline(prompt="Quantos anos tem seu carro? ")
  tempo=as.integer(tempo)
  if(tempo<=3)
    print("Carro novo")
  else
    print("Carro velho")
}
tempo()

# Note que ao executar a última linha, a entrada da informação se dá por meio do prompt
# (tela 3), na qual é feita a pergunta e o prompt espera até que uma resposta seja dada.

# A estrutura condicional trabalhada pode ser simplificada. O comando no R que faz isso
# é o ifelse.

# ifelse(condição, Resultado se verdadeiro, Resultado se falso)

# Exemplo:
tempo = 5
ifelse(tempo<=3, "O carro é novo !", "O carro é velho !")

#  Exemplo:
carro = function(tempo){
  ifelse(tempo<=3, "O carro é novo !", "O carro é velho !")
}
carro(8)

# Exemplo
tempo = function(){
  tempo = readline(prompt = "Quantos anos o carro tem ?")
  ifelse(tempo<=3, "O carro é novo !", "O carro é velho !")
}
tempo()

# Exemplo - Crie uma rotina que calcule a média entre duas notas, ou seja,
#                 n = (n1 + n2) / 2
# Se a média for maior ou igual a 6, exiba a mensagem "Parabéns". Se a média for 
# menor que 6, exiba a mensagem "Estude mais"

n1 = 5
n2 = 8
n = (n1+n2)/2
print(paste("A sua média foi: ", n))
print(ifelse(n>=6, "Parabéns", "Estude Mais"))

notas = function(n1, n2){
  n =(n1+n2)/2
  print(paste("A sua média foi: ", n))
  print(ifelse(n>=6, "Parabéns", "Estude Mais"))
}
notas(5, 4)

# IF - ELSE IF - ELSE

# Se existir mais de uma condição alternativa que precisa ser verificada, devemos
# utilizar o else if para avaliar as expressões intermediárias antes de usar o else;

# Neste caso, estamos trabalhando com estruturas condicionais aninhadas, que são várias
# condições em cascatas, ou seja, um if dentro de outro if.

# Asintaxe do IF - ELSE IF - ELSE é a seguinte
# Início:
# se (condição)
#   < bloco de código >
# senão se (condição)
#   < bloco de código >
# senão 
#   < bloco de código >
# fim

# Exemplo - Crie uma rotina que peça para p usuario digitar um número e identificar
# se ele é menor do que 10, igual a 10 ou maior que 10.

# Início: num
# se (num < 10)
#   print("Menor que 10")
# senão se (num == 10)
#   print("Igual a 10")
# senão 
#   print("Maior que 10")

num = 10
if (num<10)
  print("Menor que 10") else if (num == 10)
  print("Igual a 10") else 
  print("Maior que 10")

n10 = function(num){
  if(num<10)
    print("Menor que 10")
  else if (num == 10)
    print("Igual a 10")
  else
    print("Maior que 10")
}
n10(10)


# Estruturas de Repetição

# Laços de Repetição (loops) - são estruturas de repetição, geralmente usada para 
# processar coleção de dados, tais como linhas de um arquivo ou registro de um banco
# de dados, que precisam ser processados por um mesmo bloco de código.

# As mais comuns são o "FOR" e "WHILE".
# FOR - É uma estrutura de repetição mais usada no R. A instrução aceita não só sequencias
# estáticas, mais também sequências geradas por iteradores;

# Iteradores são estruturas que permite iterações, ou seja, acesso aos itens de uma coleção
# de elementos, de forma sequencial.

# Sintaxe:
# A sintaxe de FOR em R é a seguinte:
# for(referência) in < sequência >
#   <bloco de código>
# fim

# Exemplo - Crie um programa que mostre em tela a sequência numeral de 1 a 5.
#for (i) in <1:5>
#  print(i)
#fim
for (i in 1:5){
  print(i)
}
  
# Outra forma:
gera = function(num1, num2, pula){
  for (x in seq(num1, num2, pula)){
    print(x)
  }
  print("FIM")
}
gera(1, 5, 1)

# A estrutura seq(m, n, p), é muito útil em laços, pois retorna uma lista de inteiros
# começando em m e menores que n, em passsos de comprimento p, que podem ser usados
# como sequência para laço.

# Copie e cole os exemplos a seguir no seu script e execute cada linha de comando

# Qual a diferença entre as linhas 2 e 3?

# Se não informarmos o comprimento do passo,  o que o R faz por padrão?
# (Veja isso na última linha de comando)
?seq # Pedindo ajuda da função
 
# o length serve para executar qual será a quantidade 
# # o length serve para executar qual será o tamanho
seq(0, 1, length = 5)

# o by serve para executar qual será o quantidade de numeros gerado no 
# intervalo definido
seq(0, 1, by = 0.25) 

# Nesse caso by servio como passo "salto" 
seq(1, 9, by = 2)


seq(1, 9, by = pi )

# Salto
seq(1, 6, by = 3)

# passo
seq(1.575, 5.125, by = 0.05)

# Sequencia começando do 1 até o 17
seq(17)

# WHILE - O camando while faz com que um conjunto de instruções seja executado enquanto
# uma condição é atendida. Quando o resultado dessa condição passa a ser falso, a execução do
# loop é interrompida.

# A sintaxe do laço WHILE em R é a seguinte:

# while(condição)
#   <bloco de condições>
# fim

# Exemplo - Crie um programa que mostre em tela a sequência que mostre em tela a sequência
# numerica de 1 a 10

# Início: x = 1
# while (x < 11)
#   <print(x)>
# fim

x = 1
while (x<11) {
  print(x)
  x = x +1
}
# Outra forma
gera = function(num1, num2, pula) {
  while(num1 < num2) {
    print(num1)
    num1 = num1 + pula
  }
  print("FIM")
}
gera(1, 11, 1)

# Exercício
# Crie uma rotina que pergunte:
# Digite um valor
# Quer continuar? E crie duas opções (SIM/NAO)
# Se escolher a opção SIM => Digite um valor
# Se não => FIM

# Início: r = "S"
# while (r = "S")
#   <print("Digite um valor")>
#   <print("Digite um valor"[S/N])>
# fim

r = "S"
while (r == "S") {
  n = readline(prompt = "Informe um valor: ")
  n = as.integer(n)
  r = readline(prompt = "Quer continuar? [S/N] ")
  r = as.factor(r)
 }
print("FIM")

p1 = function(){
  r = "S"
  while(r == "S") {
    n = readline(prompt = "Informe um valor: ")
    n = as.integer(n)
    r = readline(prompt = "Quer continuar? [S/N] ")
    r = as.factor(r) 
  }
  print("FIM")
}
p1()

# -------------------------------------------------------------------------
notas = function(){
  n1 = readline(prompt = "Informe sua média: ")
  n1 = as.integer(n1)
  n1 = as.factor(n1)
  n2 = readline(prompt = "Informe sua média: ")
  n2 = as.integer(n1)
  n2 = as.factor(n2)
  
  n = (n1+n2)/2
  n = as.integer(n)
  n = as.factor(n)
  print("A sua média foi", n)
  if (n>=6)
    print("Parabéns !") else
    print("Estude Mais !")
}
notas()
# -------------------------------------------------------------------------

















