# ---------------------- PRIMEIRPS PASSOS COM GGPLOT2 ----------------------  #

# VISUALIZAÇÃO DE DADOS (GGPLOT2) - Esse pacote é uma estruturado de forma que a
# "gramática" seja utilizado para um grafico a partir de multiplas camadas. As  
# camadas serão formadas por dados, mapeamentos esteticos, transformações 
# estatísticas dos dados, objetivos geometricos (pontos, linhas, barras etc) e 
# ajustes de posicionamento. Alem disso, existem outros componentes, como os 
# sistemas de coordenadas(cartesiano, polar, mapas etc) e, se for o caso, divisões 
# de graficos de subplots (facet). Um simples exemplo de multiplas camadas seria
# um grafico de pontos adicionado de uma curva d ajustamento.

# É importante saber que um grafico do ggplot2 pode ter mais de um objeto geometrico
# cada um formando uma camada. Os objetos geometricos começam com expressoões geom_
# e são seguidos pelo tipo de objeto. Por exemplo, geom_point() para gerar um gráfico 
# de pontos. Vamos, primeiramente, criar um gráfico com pontos a partir dos dados
# do tab1. Porém antes de tudo é preciso direcionar o R para ler o arquivo que deseja 
# trabalhar, para informar ao R qual pasta ele deve ler. Exemplo 1:

setwd("/home/quant/Documents/Books_Python_I_Books_Finance/R/curso_r_ufscar/")
install.packages("ggplot2")
library(ggplot2)
dados <- read.table("arquivo.csv", header = TRUE)
head(dados)
attach(dados)
g1 <- ggplot(dados, aes(y=Altura, x=Idade)) + geom_point()
g1

# Como obeservado no outro exemplo, passamos um conjunto de dados para o ggplot
# Depois. adicionamos uma camada de pontos, mapeando as variáveis para as posições 
# de cada ponto nos eixos x e y, repectivamente, e a variavel que deseja para a cor
# de cada ponto. Em seguida, alteramos a escala de cor, definindo seu titulo, os rótulos
# (labels) e os valores (values) para as cores. Por fim, definimos os titulos/rótulos do 
# gráfico. Exemplo:

# Exemplo - Disciminando Sexo:

ggplot(dados) +
  geom_point(aes(x=Idade, y= Altura, color=factor(Sexo)),
             size=2) +
  scale_color_manual("Sexo",
                     values = c("red4", "blue"),
                     labels=c("Feminino", "Maculino")) +
  labs(title = "Idade X Altura",
       y ="Altura",
       x="Idade")

# Exemplo - Disciminando renda: 
ggplot(dados) +
  geom_point(aes(x=Idade, y= Altura, color=factor(Renda)),
             size=2) +
  scale_color_manual("Renda",
                     values = c("red4", "blue", "green4"),
                     labels=c("Baixa", "Média", "Alta")) +
  labs(title = "Idade X Altura",
       y ="Altura",
       x="Idade")

# Exemplo - Alterando incrementos e rótulos no eixo x, y:
ggplot(dados) + 
  geom_point(aes(x=Idade, y=Altura, color=factor(Renda))) + 
  scale_color_manual("Renda", 
                     values = c("red", "blue", "green"),
                     labels = c("Baixa", "Média", "Alta")) +
  scale_x_continuous(name="Idade", breaks = 15:30) + 
  scale_y_continuous(name="Altura", breaks = seq(0, 2, 0.1),
                     limits = c(1.5, 2)) + 
  labs(title = "Idade X Altura",
       y ="Altura",
       x="Idade")

# Exemplo - Alteração de cores:
ggplot(dados) +
  geom_point(aes(x=Idade, y= Altura, color=factor(Renda))) +
  scale_color_manual("Renda",
                     values = c("purple", "orange", "yellow"),
                     labels=c("Baixa", "Média", "Alta")) +
  labs(title = "Idade X Altura",
       y ="Altura",
       x="Idade")






























