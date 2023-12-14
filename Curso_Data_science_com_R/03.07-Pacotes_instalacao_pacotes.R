# -------------- PACOTES E INSTAÇÃO DE PACOTES -------------- #

# "TUDO QUE PODE SER AUTOMATIZADO, DEVE SER AUTOMATIZADO"

# De onde vem as funções Pacotes (conjuntos de funções)
# Quando você iniciar o Rstudio, alguns pacotes são
# carregados por padrão

# Verifica quais os pacotes que estão disponiveis no momento
search()

install.packages(c("ggvis", "tm"))
library(ggvis)
library(tm)
library(dplyr)

search()
?require
detach(package:dplyr) # Descarregar pacote
?attach

ls(pos="package:tm") # Lista todas as funções do pacote
ls(getNamespace("tm"), all.names=TRUE) # Vericar funções dentro do paccotes

lsf.str("package:tm") # Verificar todas as especificações
lsf.str("package:ggplot2")
library(ggplot2)
lsf.str("package:ggplot2")

# R possui um conjunto de datasets preinstalados. Verifica
library(MASS)
data()

?lynx
head(lynx)
head(iris)
tail(lynx)
summary(lynx)

plot(lynx)
hist(lynx)
head(iris)
iris$Sepal.Length
sum(Sepal.Length) # Vai dar erro obj. Sepal.Length não existe

attach(iris) # Permite acessar o datasets sem atribuir o nome dataframe
sum(Sepal.Length)






