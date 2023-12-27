# ------------------------ ESTRUTURA DE FLUXO ------------------------ #

# A estrutura de if (se) e else (então) usa os operadores logicos apresentados
# anteriormente.

# Se a condição for verdadeira, if opera uma função. Mas se for falsa opera outra função.
# Da mesma forma, existe uma função que gera o mesmo resultado, o ifelse().

# A estrutura if() {} else {} só opera variáveis, uma por uma, já a estrutura ifelse()
# Opera vetores, ou seja, consegue fazer a comparação para todas os elementos.
# Isso faz com que a forma if() {} else {} seja mais utilizada para comparação fora
# dos dados, como varáveis avulsas. Já a estrutura ifelse() é mais usada para comparações
# dentro dos dados, com colunas, vetores e linhas.

# Podendo ainda ser utilizada o else if() para avaliar as expressoões intermediárias
# antes de usar o else. Que consiste em condições em cascatas, ou seja, um if dentro de
# outro if

# Em todos as comparações do R usamos operadores lógicos. São operações matemáticas em que o 
# resultado é TRUE ou FALSE (Tipo lógico). Alguns exemplos:

      # == igual a: compara dois objetos e se forem iguais retorna TRUE, caso contrario, FALSE;
      
      # != diferente: compara dois objetos e se forem diferentes retorna TRUE, caso contrário, 
      # FALSE;
      
      # | ou (or): compara dois objetos, se um dos dois for TRUE, retorna TRUE, se os dois forem 
      # FALSE, retorna FALSE;

      # & e (and): compara dois obejetos, se os odis forem TRUE, retorna TRUE, se um dos dois ou  
      # os dois forem FALSE, retorna FALSE;

      # >, >=, <, <= (maior, maior ou igual, menor, menor ou igual): compara grandeza de dois números
      #  e retorna TRUE ou FALSE conforme a condição.

# Exemplos:

a <- 9823

if(a >= 1000) {
  b <- "Valor Alto"
} else if(a < 1000 & a >= 1000) {
  b <- "Valor Médio"
} else if(a < 1000) {
  b <- "Valor baixo"
}
b


a <- 839

c <- ifelse(a >= 10000, "Valor Alto",
            ifelse(a < 10000 & a >= 1000, "Valor Médio", "Valor baixo"))

c

# LOOPS: repetem uma sequência de comandos quantas vezes você desejar, ou até que uma
# condição aconteça, variando-se alguns aspectos entre uma repetição e outra.

# FOR: é usado para realizar uma série de ordens para uma determinada sequência ou indices
# (vetor).

# Para cada valor (chamamos esse valor de i) dentro do vetor c(1,2,3,4,5), executar o comando
# print(i^2). Qualquer outro comando dentro das chaves (....) seria executado para cada valor
# do vetor.

# Exemplo:

for(i in c(1,2,3,4,5)) {
  print(i^2)
}

# Também é possivel utilizar loop com if. No exemplo a seguir, queremos ver todos os numeros de 1
# a 1000 que são divisiveis por 20 e por 3 ao mesmo tempo. Para isso utilizamos o operador %%, que
# mostra o resto da divisão. Se o resto for zero, e divisivel. Exemplo 15:

15 %% 3
15 %% 4

for (i in 1:1000) {
  if((i %% 29 == 0) & (i %% 3 == 0)) {
    print(i)
  } 
}

# WHILE - É uma estrutura de controle de fluxo do tipo loop, mas, diferentemente do for(),
# o while executa as tarefas repetidamente até que uma condição seja satisfeita, não percorrendo
# um vetor. Exemplo:

i <- 1

while(i <= 5) {
  print(i)
  i <- i + 1
}



