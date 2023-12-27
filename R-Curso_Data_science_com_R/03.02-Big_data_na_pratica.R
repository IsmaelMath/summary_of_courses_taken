# -------------- BIG DATA NA PRÁTICA -------------- #
# Big Data na Prática 1 - Tempetatura Média nas Cidades Brasileiras

# Dataset
# Berkeley
# http://berkeleyearth.org/data
# TemperaturasGlobais.csv ~ 78MB (zip) ~ 496 (unzip)

# Instalando e Carregando Pacotes
install.packages("scales")
install.packages("data.table")
library(readr)
library(dplyr)
library(ggplot2)
library(readr)
library(scales)
library(data.table)
# Library(dtplyr)

# Carregando os dados (Usando um timer para comprar o tempo de carregamento)

# Usando read.csv2()
system.time(df_test1 <- read.csv("/home/quant/Documents/Books_Python_I_Books_Finance/R/R_fundamentos/TemperaturasGlobais.csv"))

# Usando read.table()
system.time(df_test2 <- read.table("/home/quant/Documents/Books_Python_I_Books_Finance/R/R_fundamentos/TemperaturasGlobais.csv"))

# Usando fread()
system.time(df_test3 <- fread("/home/quant/Documents/Books_Python_I_Books_Finance/R/R_fundamentos/TemperaturasGlobais.csv"))

# Criando subsets dos dados carregados
cidadesBrasil <- subset(df_test3, Country == "Brazil")
cidadesBrasil <- na.omit(cidadeBrasil)
head(cidadesBrasil)
nrow(df)
nrow(cidadesBrasil)
dim(cidadesBrasil)

# Preparação e Organização

# Convertendo as Datas
cidadesBrasil$dt <- as.POSIXct(cidadeBrasil$dt, format='%Y-%m-%d')
cidadesBrasil$Month <- month(cidadesBrasil$dt)
cidadesBrasil$Year <- year(cidadesBrasil$dt)

# Carregando as subsets

# Palmas
plm <- subset(cidadesBrasil, City == 'Palmas')
plm <- subset(plm, Year %in% c(1796,1846,1896,1946,1996,2012))

# Curitiba
crt <- subset(cidadesBrasil, City == 'Curitiba')
crt <- subset(crt, Year %in% c(1796,1846,1896,1946,1996,2012))

# Recife
recf <- subset(cidadesBrasil, City == 'Recife')
recf <- subset(recf, Year %in% c(1796,1846,1896,1946,1996,2012))

# Construindo os Plots
p_plm <- ggplot(plm, aes(x = (Month), y = AverageTemperature, color=as.factor(Year))) +
  geom_smooth(se = FALSE, fill = NA, size=2) + 
  theme_light(base_size = 20) + 
  xlab("Mês") + 
  ylab("Temperatura Média") + 
  scale_color_discrete("") + 
  ggtitle("Temperatura Média ao longo dos anos em Palmas") + 
  theme(plot.title = element_text(size= 18))

p_crt <- ggplot(crt, aes(x = (Month), y = AverageTemperature, color=as.factor(Year))) +
  geom_smooth(se = FALSE, fill = NA, size=2) + 
  theme_light(base_size = 20) + 
  xlab("Mês") + 
  ylab("Temperatura Média") + 
  scale_color_discrete("") + 
  ggtitle("Temperatura Média ao longo dos anos em Palmas") + 
  theme(plot.title = element_text(size= 18))

p_recf <- ggplot(recf, aes(x = (Month), y = AverageTemperature, color=as.factor(Year))) +
  geom_smooth(se = FALSE, fill = NA, size=2) + 
  theme_light(base_size = 20) + 
  xlab("Mês") + 
  ylab("Temperatura Média") + 
  scale_color_discrete("") + 
  ggtitle("Temperatura Média ao longo dos anos em Palmas") + 
  theme(plot.title = element_text(size= 18))

# Plotando
p_plm
p_crt
p_recf



