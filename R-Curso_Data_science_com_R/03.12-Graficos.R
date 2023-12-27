# ------------------------------- GRÁFICOS ------------------------------- #

# Scatterplots

# Define os dados
set.seed(67)
x = rnorm(10, 5, 7)
y = rpois(10, 7)
z = rnorm(10, 6, 7)
t = rpois(10, 9)


# Criar o Plot
plot(x, y, col=123, pch=10, main="Multi Scatterplot", 
     col.main="red", cex.main=1.5, xlab="indep",
     ylab="depend")

# Adiciona outros dados
points(z, t, col="blue", pch=4)

# Adicionando outros dados
points(y, t, col=777, pch=9)

# Crie legenda
legend(-6,5.9, legend=c("Nível 1", "Nível 2", "Nível 3"),
       col = c(123, "blue", 777), pch=c(10,4,9),
       cex=0.65, bty="n")
# -----------------------------------------------------------------------------
# Boxplots 

?boxplot
?sleep

# Permite utilizar as colunas sem especificar o nome do dataset
attach(sleep)

# Construção do boxplot
sleepboxplot = boxplot(data=sleep, extra ~ group, main="Duração do Sono",
                       col.main="red", ylab="Horas", xlab="Droga")

# Cálculo da Média
means = by(extra, group, mean)

# Adicionando a média ao gráfico
points(means, col="red")

# Boxplot horizontal
horizontalboxplot = boxplot(data=sleep, extra ~ group, main="Duração do Sono",
                            col.main="red", ylab = "", xlab = "", horizontal = T)

horizontalboxplot = boxplot(data=sleep, extra ~ group, main="Duração do Sono",
                            col.main="red", ylab = "", xlab = "", horizontal = T,
                            col=c("blue4", "green4"))

# -----------------------------------------------------------------------------
# Histogramas

?hist
?cars

# Definindo os dados
dados = cars$speed

# Construindo um histograma 
hist(dados)
hist(dados, breaks=10)
hist(dados, labels=T, breaks=c(0, 5, 10, 20, 30))
hist(dados,labels=T, breaks=10)
hist(dados, labels=T, ylim=c(0, 10), breaks = 10)

# Adicionando linhas ao histograma
hey = hist(dados, breaks = 10)
xaxis = seq(min(dados), max(dados), length=10)
yaxis = dnorm(xaxis, mean = mean(dados), sd = sd(dados))
yaxis = yaxis*diff(hey$mids)*length(dados)

lines(xaxis, yaxis, col="red")


# -----------------------------------------------------------------------------
# Gráfico de Pizza

?pie

# Criando as fatias
fatias = c(40,20,40)

# Nomeando os labels 
paises = c("Brasil", "Argentina", "Chile")

# Unindo paises e fatias
paises = paste(paises, fatias)

# To further specify the labels
paises = paste(paises, "%", sep="") 

colors()

# Construindo um gráfico
pie(fatias, labels=paises, col=c("darksalmon", "gainsboro", "lemonchiffon4"), 
    main="Distribuição de Vendas")

# Trabalhando com dataframes
?iris
attach(iris)
values = table(Species) 
labels = paste(names(values))
pie(values, labels = labels, main="Distribuição de Espécies")

# 3D
library(plotrix)
pie3D(fatias, labels = paises, explode = 0.05,
      col=c("steelblue1", "tomato2", "tan3"),
      main="Distribuição de Vendas")

# -----------------------------------------------------------------------------
# Bar plot

?barplot

# Preparando os dados
casamentos <- matrix(c(652,1537,598,242,36,21,118,218,327,106,67), nrow = 3, byrow = T)
casamentos

# Nomeando a metriz
colnames(casamentos) <- c("0", "1-150", "151-300", ">300")
rownames(casamentos) <- c("Casado", "Divorciado", "Solteiro")

# Construindo o plot

barplot(casamentos)
barplot(casamentos, beside=T)

# Transporta da matriz
barplot(t(casamentos), beside = T)


