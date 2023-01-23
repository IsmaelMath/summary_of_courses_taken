# -------------- EXPRESSÕES REGULADORES -------------- #

# EXPRESSOÕES REGULARES - Recurso usado para verificar se existe um padrão
#                         em uma string ou vetor de caracteres.


# grepl() - Retorna TRUE quando um padrão é encontrado
# grep()  - Retorna um vetor de índices dos caracteres que contém o padrão
#           especificado.

# sub()   - Substitui o primeiro caracter encontrado de acordo com padrão
#           especificado.

# gsub()  - Substitui todos os caracteres encontrados de acordo com o padrão
#           especificado

# grep(pattern, x, ignore.case=FALSE, perl=FALSE, value=FALSE,.....)
# grepl(pattern, x, ignore.case=False, perl=FALSE, fixed=FALSE,....)
# sub(pattern, replacement, x, ignore.case=FALSE, perl=FALSE, .....)
# gsub(pattern, replacement, x, ignore.case=FALSE, perl=FALSE, ....)
# regexpr(pattern, text, ignore.case=FALSE, perl=FALSE, fixed=FALSE, ....)
# gregexpr(pattern, text, ignore.case=FALSE, perl=FALSE, fixed=FALSE, ....)

str <- c("Expressões", "regulares", "em linguagem R",
         "permitem a busca de padrões", "e esploração de textos",
         "podemos buscar padrões em dígitos",
         "como por exemplo",
         "10992451280")

length(str)
str

# grep()
grep("ex", str, value = F)
grep("ex", str, value = T)
grep("\\d", str, value = F)
grep("\\d", str, value = T)

# grepl()
grepl("\\d+", str)
grepl("\\D", str)

# gsub()
gsub("em", "|", str)
gsub("ex", "EX", str, ignore.case = T)

# sub()
sub("em", "EM", str)

# regexpr()
frase <- "Isso é uma string."
regexpr(pattern = "u", frase)

# gregespr()
gregexpr(pattern = "u", frase)


str2 <- c("2678 é maior que 45 - @???!$$",
          "Vamos escrever 14 scripts R")

str2

# gsub()
gsub("\\d", "", str2)
gsub("\\D", "", str2)
gsub("\\s", "", str2) # removendo os espeços
gsub("[iot]", "Q", str2) # substituindo caracteres
gsub("[[:punct:]]", "", str2) # removendo caracteres especiais classificados como pontuação
gsub("[^@]", "", str2) # removendo topos os elemento menos os @





























