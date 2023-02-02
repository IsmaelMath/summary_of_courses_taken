# ----------- ASPECTOS GERAIS SOBRE CRIAÇÃO DE FUNÇÕES NO RSTUDIO ------------ #

# FUNÇÕES

# Funções "encapsulam" uma sequencia de comando e intruções. É uma estrutura nomeada
# que recebe parametros para iniciar sua execução e retorna um resuntado ao final.

# Exemplo como será implementado a função:
sua_func <- function(parametro_1, parametro_2) {
  # sequencia de tarefas
  return(valores_retornados)
}
sua_func

# Exemplo:
# ----------------------------------------------------------------------------------
# O sistema de avaliação de uma diciplina em uma universidade consiste na realização
# de três provas e um trabalho.

# A Nota Média do aluno é calculada pela seguinte expressão Nota Média = (P1 + P2 + P3 + T) / 4

# Se a Nota média do aluno for no minimo 6 pontos, else é aprovado, caso contrario é reprovado.
# Considerando um aluno que observe as seguintes regras: p1 = 5, p2 = 3, p3 = 5, trabalho = 6,
# construa uma rotina que calcula a Nota Média e informe a situação do aluno.


nm = function(p1, p2, p3, t) {
  n = (p1 + p2 + p3 + t) / 4
  situacao = ifelse(n >= 6, "Aprovado", "Reprovado")
  return(list(Nota = n, "Situação" = situacao ))
}

nm(5, 3, 5, 6)
nm(10, 10, 10, 10)
# ----------------------------------------------------------------------------------

