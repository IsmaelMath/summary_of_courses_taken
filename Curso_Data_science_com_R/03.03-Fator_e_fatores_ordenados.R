# ----------------- FATOR E FATORES ORDENADOS ----------------- #

# Fatores 

vec1 <- c("Macho", "Femea", "Femea", "Macho", "Macho")
vec1
fac_vec1 <- factor(vec1)
fac_vec1
class(vec1)
class(fac_vec1)

# Varíveis categóricas nominais
# Não existe uma ordem implícita
animais <- c("Zebra", "Pantera", "Rinoceronte", "Macaco", "Tigre")
animais 
class(animais)
fac_animais <- factor(animais)
class(fac_animais)
levels(fac_animais)

# Variáveis categóricas ordinais
# Possui uma ordem natural
grad <- c("Mestrado", "Doutorado", "Bacharelado", "Mestrado", "Mestrado")
grad
fac_grad <- factor(grad, order = TRUE, levels = c("Doutorado", "Mestrado", "Bacharelado"))
fac_grad
levels(fac_grad)

# Sumarizar os dados fornece uma visão geral sobre o conteúdo
summary(fac_grad)
summary(grad)

vec2 <- c("M", "F", "F", "M", "M", "M", "F", "F", "M", "M", "M", "F", "F", "M", "M")
vec2
fac_vec2 <- factor(vec2)
fac_vec2
levels(fac_vec2) <- c("Femea", "Macho")
fac_vec2
summary(fac_vec2)
summary(vec2)

# Mais exemplo
data = c(1,2,2,3,1,2,3,3,1,2,3,3,1)
fdata = factor(data)
fdata

rdata = factor(data, labels=c("I", "II", "III"))
rdata

# Fatores Não-Ordenados
set1 <- c("AA", "B", "CC", "CA", "AA", "BA", "CC", "CC")
set1

# Transformando os dados. O R apenas criou os níveis, o que 
f.set1 <- factor(set1)
f.set1
class(f.set1)
is.ordered(f.set1)

# Fatores Ordenados
o.set1 <- factor(set1, levels=c("CA", "BA", "AA", "CC", "B"),
                 ordered=TRUE)
o.set1
is.ordered(o.set1)

as.numeric(o.set1)
table(o.set1)

# Fatores em Dataframes
df <- read.csv2("/home/quant/Documents/Books_Python_I_Books_Finance/R/R_fundamentos/etnias.csv", sep=",")
df

# Variáveis fo tipo fator
str(df)

# -------------------------------------------------------------
# Precisa converter a Coluna Etnia para conseguir plotar
df$Etnia <- factor(df$Etnia, labels = c("Branco", "Negro", "Pardo"))
str(df)
# --------------------------------------------------------------

# Níveis dos fatores 
# Internamente, o R armazena valores inteiro e faz um mapeamento
# e agrupa as estatísticas por níveis. Agora, se fizermos summary
# a contabilidade de para cada categoria

levels(df$Etnia)
summary(df$Etnia)

# Plot
# Agora se fizermos um plot, temos em boxplot para estas variáveis
plot(df$Idade~df$Etnia, xlab="Etnia", ylab = "Idade", main="Idade por Etnia")

# Regressão
summary(lm(Idade~Etnia, data=df))

# Convertendo uma coluna em variável categórica. Isso creiará uma
df$Estado_Civil.cat <- factor(df$Estado_Civil, labels = c("Solteiro", "Casado", "Divorciado"))
df
str(df)












