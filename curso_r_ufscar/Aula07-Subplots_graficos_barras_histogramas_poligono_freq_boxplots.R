# SUBPLOTS, GRÁFICO DE BARRAS, HISTOGRAMAS, POLIGONO DE FREQUÊNCIA E BOXPLOTS #

# Subplots
# O ggplot2 facilita a criação de subplots nos casos em que se deseja replicar o 
# mesmo gráfico para o conjunto de valores de outra variável. As duas principais 
# funções são facet_wrap() e facet_grid(). Para comparar as relações para diferentes 
# sexos, usamos a formula ~ Sexo. Ou seja, indica que queremos quebrar os gráficos 
# pela variável Sexo.


library(ggplot2)

setwd("/home/quant/Documents/Books_Python_I_Books_Finance/R/curso_r_ufscar/")
dados <- read.table("arquivo.csv", header = TRUE)
head(dados)
attach(dados)
#===========================================================================
dados$Sexo
factor_sexo <- factor(dados$Sexo)
factor_sexo
levels(factor_sexo) <- c("Feminino", "Masculino")
factor_sexo
dados$Sexo <- factor_sexo
head(dados)

dados$Renda 
factor_renda <- factor(dados$Renda)
factor_renda
levels(factor_renda) <- c("Baixa", "Média", "Alta")
factor_renda
dados$Renda <- factor_renda

head(dados)
#===========================================================================
# Exemplo:
ggplot(dados) + 
  geom_point(aes(x = Idade, y = Altura),
             size=2) + 
  facet_wrap(~ Sexo)  
  

# Exemplo:
ggplot(dados) + 
  geom_point(aes(x = Idade, y = Altura)) + 
  geom_point(aes(x = Idade, y = Altura)) + 
  facet_wrap(~ Renda)

# Já uso do facet_grid() é indicado para o cruzamento de variáveis. No exemplo abaixo,
# a relção entre as variáveis Idade e Peso será "quebrada" para grupos formados pelas
# variaveis Sexo e Renda.

# Exemplo:
ggplot(dados, aes(x=Idade, y=Peso)) + 
  geom_point() +
  facet_grid(Sexo ~ Renda)

# Exemplo:
ggplot(dados, aes(x=Idade, y=Peso)) + 
  geom_point() + 
  facet_wrap(~ Renda, scale="free_y",
             labeller=labeller(cut=c("Baixa", "Média", "Alta")))

# Gráfico de dispersão - É bastante usado para verificar-se relações entre duas variáveis
# quantitativas. Exemplo 10:

library(tidyverse)

## Gráfico de dispersão
dados %>% 
  ggplot(aes(x=Idade, y=Peso)) + 
  geom_point() + 
  labs(x="Idade", 
       y="Peso (Kg)") + 
  theme_bw() # Poderia trocar o tema aqui
# theme_gray()

# Gráfico de barras - Os gráficos de barras são geralmente utilizados para comparação
# entre categorias, ou seja, variáveis quantitativas. No ggplot2 podemos usar dois 
# objetos geométricos distintos:
# geom_bar() e geom_col(). 

# Exemplo - gráfoco de barras
ggplot(dados, aes(x=Sexo)) + 
  geom_bar() + 
  theme_minimal() # poderia trovar o tema aqui
# theme_gray()

# Há um detalhe importante para o geom_bar(): o argumento stat. por padrão, para 
# este objeto geométrico, valor de stat é count o que significa que ele fará uma contagem
# de elementos do eixo x e essa contagem será usada no eixo y. Então para que o y seja
# mapeado para uma variável do data.frame é necessário definir stat=identity. 

# Exemplo - gráfico de barras com renda e %de Sexo em cada coluna
ggplot(dados, aes(x=Renda, y=Peso, fill=Sexo)) + 
  geom_bar(stat="identity")

# Exemplo - gráfico de barras com renda e %de Sexo em cada coluna
ggplot(dados, aes(x=Renda, y=Peso, fill=factor(Sexo))) + 
  geom_col(position="dodge") + 
  labs(title = "Renda X Peso",
       x="Renda",
       y="Sexo",
       fill="Sexo") + 
  theme_minimal() # Poderia trocar o tema aqui #theme_gray()

# HISTOGRAMAS - Os histogramas são utilizados para representar-se a distribuição
# de dados de uma variável quantitativa em intervalos contínuos. Esses intervalos 
# são chamados de bins. Para cada bin, será apresentada a quantidade de valores que
# estão naquele intervalo, o geom_histogram() utiliza os mesmos elementos estéticos 
# do geom_bar().

# Exemplo - Histogramas 
# Padrão do ggplo2

ggplot(dados, aes(x=Peso)) + 
  geom_histogram(binwidth = 5, fill="dodgerblue",
                 color="black") + 
  labs(title = "Distribuição de Peso (Kg)",
       x="Peso (Kg)",
       y="Contagem") + 
  theme_minimal() # Poderia trocar o tema aqui # theme_gray()

# Transformando o histograma em proporção.

#Transformando em proporção (Freq percentual)
ggplot(dados, aes(x=Peso)) + 
  geom_histogram(aes(y=..count../sum(..count..)),
                 binwidth = 5, fill="dodgerblue",
                 color="black") + 
  labs(title="Distribuição de Peso (Kg)",
       x="Peso (Kg)",
       y="Proporção") + 
  scale_y_continuous(labels=scales::percent_format()) + 
  theme_minimal() # Poderia trocar por o tema aqui # theme_gray()

# Veja no gráfico anterior que o rotulo do eixo x não está ajustado, vamos ajustar agora, 
# para isso precisamos calcular a amplitude da classe. 

# Exemplo - Números de classes 
y = dados$Peso
k = round(sqrt(length(y))); k

# Amplitude Total
A = max(y) - min(y); A

# Amplitude da classe
c = A / (k - 1); c
LI1 = min(y) - c/2; LI1
LSk = max(y) + c/2; LSk 

# Exemplo:
dados$classe <- cut(dados$Peso, seq(0, 100, by=c), right = FALSE)
ggplot(dados, aes(classe)) + 
  geom_histogram(stat="count", aes(fill=..count..))

# Exemplo - eixos x arrumado, mas a escala é de densidade
ggplot(data=dados, aes(Peso)) + 
  geom_histogram(aes(y=..density..),
                 breaks=seq(LI1, LSk, by=c),
                 col="red",
                 fill="green",
                 alpha=.2) + 
  geom_density(col=2) + 
  labs(title = "Distribuição de Peso (Kg)",
       x="Peso (Kg)", 
       y="Proporção") + 
  scale_x_continuous(name="Peso",
                     breaks = seq(LI1, LSk, by=c))

# Exemplo - eixo x arrumando, frquência relativa
ggplot(data=dados, aes(Peso)) + 
  geom_histogram(aes(y=..count../sum(..count..)),
                 breaks=seq(LI1, LSk, by=c),
                 col="red3",
                 fill="green",
                 alpha=.2) + 
  labs(title = "Distribuição de Peso (Kg)",
       x="Peso (Kg)", 
       y="Proporção") + 
  scale_x_continuous(name="Peso",
                     breaks = seq(LI1, LSk, by=c))

# Exemplo - Eixos x arrumado, frequência percentual
ggplot(data=dados, aes(Peso)) + 
  geom_histogram(aes(y=..count../sum(..count..)),
                 breaks=seq(LI1, LSk, by=c),
                 col="red3",
                 fill="green",
                 alpha=.2) + 
  labs(title = "Distribuição de Peso (Kg)",
       x="Peso (Kg)", 
       y="Proporção") + 
  scale_x_continuous(name="Peso",
                     breaks = seq(LI1, LSk, by=c)) + 
  scale_y_continuous(labels = scales::percent_format())

# FreqPoly - A diferença dos histogramas para o geom_frqpoly é que este utiliza linhas
# para construir polígonos, Este utiliza os mesmo elementos esteticos do geom_line().

# Exemplo - poligonos de frequência:
ggplot(dados, aes(x=Peso)) + 
  geom_freqpoly(binwidth=5) + 
  labs(title="Distribuição do Peso (Kg)",
       x="Peso",
       y="Contagem") + 
  theme_gray() # theme_minimal()

# BoxPlots - é uma representação comum para apresentar-se a distribuição de uma variável
# a partir de seus quantis ou pode ser usado para verificar-se distrbuição de variável
# para um conjunto de valores de uma segunda cariável.

ggplot(dados, aes(x=Renda, y=Peso)) + 
  geom_boxplot() + 
  scale_x_discrete("Renda", limits=c("Baixa", "Média", "Alta"),
                   labels=c("Baixa", "Média", "Alta")) + 
  labs(y="Peso (Kg)")

# Exemplo:
ggplot(dados, aes(x=Renda, y=Peso)) + 
  geom_boxplot(fill="dodgerblue") + 
  labs(y="Peso (Kg)",
       x="Renda",
       title="Distribuição do Peso") +
  scale_x_discrete("Renda", limits=c("Baixa", "Média", "Alta"),
                   labels=c("Baixa", "Média", "Alta")) + 
  theme_bw(base_size = 15) # Poderia trocar o tema aqui # theme_gray()

# ViolinPlots - Para ter uma visão da distribuição geral de valores, podemos utilizar
# o geom_violin(). O violinplot baseia-se na densidade de probabilidade de uma
# variável contínua. Assim. é possivel verificar-se em quais intervalos existe uma
# maior chance de ocorrência. Isto é representados pela parte mais larga do objeto.

# Exemplo - violinplot
ggplot(dados, aes(x=factor(Sexo), y=Peso)) + 
  geom_violin(fill="dodgerblue", color="green") + 
  labs(y="Peso",
       x="Sexo",
       title = "Distribuição so Peso") + 
  scale_x_discrete("Sexo", limits=c("Masculino", "Feminino"), 
                   labels=c("Masculino", "Feminino")) + 
  theme_gray() # theme_minimal()











