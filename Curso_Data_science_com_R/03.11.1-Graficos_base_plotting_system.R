# ---------------- GRÁFICOS - BASE PLOTTING SYSTEM PARTE 1 ----------------- #

# GRÁFICOS - o gráfico é uma representação com forma geometrica construida 
# de maneira exata e precisa a partir de informações numéricas obtidas atravez 
# de pesquisas e organizadas em uma tabela.

# Elemento            # Descrição
# dados               O conjunto de dados a ser analisado
# Estética            A escala em que nós mapeamos os dados
# Geometria           Os elementos visuais usados para representar os dados
# Facets              Visualizar o gráfico em porções menores 
# Estatística         Representação e análise dos dados
# Coordenadas         A área na qual o gráfico será construído     
# Temas               Visual geral do gráfico

# GRÁFICOS EM R

# Lista de pacotes base carregados
search()

# Demo
demo("graphics")

# Plot Báico

x = 5:7
y = 8:10
plot(x,y)
?plot

altura <- c(145, 167, 176, 123, 150)
largura <- c(51, 63, 64, 40, 55)

plot(altura, largura)

# Plotando um DataFrame
?lynx
plot(lynx)
plot(lynx, ylab="Plots com DataFrame", xlab="")
plot(lynx, ylab="Plots com DataFrame", xlab="Observações")
plot(lynx, main="Plots com DataFrame", col="red")
plot(lynx, main="Plots com DataFrame", col="red", col.main=5)

library(datasets)
hist(warpbreaks$breaks)

airquality &lt;- transform(airquality, Month=factor(Month))
boxplot(Ozone ~ Month, airquality, xlab = "Month", ylab = "Ozone (ppd)")

# Especifícando os Parâmetros
      # col    - cor do plotting
      # lty    - tipo de linha
      # lwd    - largura de linha
      # pch    - símbolo no plot
      # xlab   - label do eixo x 
      # ylab   - label do eixo y
      # las    - como os labels dos eixos são orientados
      # bg     - backgroud color 
      # mfrow  - número de plots por linha
      # mfcool - número de plots por coluna  


# Funções Básicas de Plot
# plot()   - adiciona linhas ao gráfico
# lines()  - adiciona pontos ao gráfico
# points() - adiciona label ao gráfico
# titles() - adiciona título ao gráfico

?par
par()
par("pch")
par("lty")

x = 2:4
plot(x, pch="c")

par(mfrow=c(2,2), col.axis="red")
plot(1:8, las=0, xlab = "xlab", ylab = "ylab", main = "LAS = 0")
plot(1:8, las=1, xlab = "xlab", ylab = "ylab", main = "LAS = 1")
plot(1:8, las=2, xlab = "xlab", ylab = "ylab", main = "LAS = 2")
plot(1:8, las=3, xlab = "xlab", ylab = "ylab", main = "LAS = 3")

legend("topright", pch = 1, col=c("blue", "red"), legend = c("Var1", "Var2"))

# ---------------- GRÁFICOS - BASE PLOTTING SYSTEM PARTE 2 ----------------- #

# Cores disponíveis
colors()

# Salvando os gráficos

# png
png("Grafico1.png", width=500, height = 500, res = 72)

plot(iris$Sepal.Length, iris$Petal.Length, col=iris$Species,
     main="Gráfico gerado a partir do iris")

dev.off()

# pdf
pdf("Grafico2.pdf")

plot(iris$Sepal.Length, iris$Petal.Length, col=iris$Species,
     main = "Grafico gerado a partir do Iris")

dev.off()

# Estendendo as funções do plot
install.packages("plotrix")
library(plotrix)
?plotrix

par(mfrow=c(1,1), col.axis="red")
plot(1:6, las=3, xlab="lty 1:6", ylab="", main="Mais opções ")
ablineclip(v=1, lty=1, col="sienna2", lwd=2)
ablineclip(v=2, lty=1, col="sienna2", lwd=2)
ablineclip(v=3, lty=1, col="sienna2", lwd=2)
ablineclip(v=4, lty=1, col="sienna2", lwd=2)
ablineclip(v=5, lty=1, col="sienna2", lwd=2)
ablineclip(v=6, lty=1, col="sienna2", lwd=2)
ablineclip(v=7, lty=1, col="sienna2", lwd=2)

plot(lynx)
plot(lynx, type="p", main="Type p")
plot(lynx, type="l", main="Type l")
plot(lynx, type="b", main="Type b")
plot(lynx, type="o", main="Type o")
plot(lynx, type="h", main="Type h")
plot(lynx, type="s", main="Type s")
plot(lynx, type="n", main="Type n")


# Dois plots juntos
par(mar=c(4,3,3,3), col.axis="black")

plot(cars$speed, type = "s", bty="n", xlab = "Cars ID", ylab="")
text(8, 14, "Velocidade", cex=0.85, col="red")
par(new=T)

plot(cars$dist, type="s", bty="n", ann=F, axes=F, col="darkblue")
axis(side = 4)
text(37, 18, "Distância", cex=0.85, col="darkblue")

title(main="Velocidade x Distância")


# Plots a partir de datasets
df <- read.csv("/home/quant/Documents/Books_Python_I_Books_Finance/R/R_fundamentos/pibpercap.csv", stringsAsFactors = F)
df_1982 <- subset(df, ano == 1982)
plot(expectativa ~ pibpercap, data=df_1982, log="x")

head(df_1982)

mycol <- c(Asia = "tomato", Europe="chocolate4", Africa="dodgerblue2",
           America="darkgoldenrod1", Oceania="green4")
plot(expectativa ~ pibpercap, data=df_1982, log="x", col=mycol[continente])

mycex <- function(var, r, f=sqrt) {
  x = f(var)
  x_scaled = (x -min(x)) / (max(x) - min(x))
  r[1] + x_scaled * (r[2] - r[1])
}

plot(expectativa ~ pibpercap, data = df_1982, log="x",
     col=mycol[continente], cex=mycex(pop, r=c(0.2, 10))
     )



