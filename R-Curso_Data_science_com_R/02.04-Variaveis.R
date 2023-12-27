 # Tipos de Dados em R

# Criando Variáveis

var1 = 367
var1
mode(var1)
help(var1)
sqrt(var1)

var2 = as.integer(var1)
var2
mode(var2)
typeof(var2)
help("typeof")

var3 = c("seg", "ter", "qua")
var3
mode(var3)

var4 = function(x) {x + 3}
var4

# Podemos tamém mudar o modo do dado
var5 = as.character(var1) # Convertendo string
var5
mode(var5)

# Atribuindo valores a objetos
x <- c(4,5,6)
x 
c(4,5,6) -> y
y
assign("x", c(1.3,4,-2)) # Função de atribuir valores a uma variável 
                         # assing("Nome_da_variavel", "Valor_a_ser_atribuido")

# Verificando o valor em uma posição específica
x[1]

# Varificando objetos
ls()
objects()

# Remover objetos
rm(x)
x




























