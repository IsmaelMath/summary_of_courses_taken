# Explorando Rstudio.R 

# Nome dos contributors
contributors()

# Licença
licence()

# Informação sobre sessão
sessionInfo()

# Imprima na tela
print("R - Uma das principais ferramentas para Cientistas de Dados")

# Criar gráficos
plot(1:30)
hist(rnorm(10))

# Instalar pacotes
install.packages("randomForest")
install.packages("ggplot2")

# Carregar pacotes
library(randomForest)
library(ggplot2)
# Descarregar o pacote
detach(package:ggplot2)

# Se souber o nome da função
help(mean)
?mean

# Se não souber o nome da função 
help.search("randomForest")
help.search("matplot")
??matplot
RSiteSearch("matplot")
example("matplot") # Exemplos de aplicações em relação a biblioteca
#                    selecionada nesse caso foi "matplot"



