# ------------------ Tipos de Dados ------------------ #

# Numéricos --- Reprenta float e int:
# 1, 3.2, -134

# Caractere --- Representa uma string:
# "A", "bolha"

# Complexo:
# z = x + yi

# Lógicos:
# True/False

# Valores faltantes e especiais
# NA - Not Available
# NaN - Not a Number
# Inf e -Inf

# Numéric - Todos os números criados em R são do tipo numéricos
num = 2.5
num

num2 = 4
num2

x = -124
x
class(x)

# Conversão de tipos Numeric
is.integer(num2)# Esse valor é inteiro
y = as.integer(num2)
class(y)

x2 = 3.14
x2
y2 = as.integer(3.14) # Convertendo valor e inteiro
y2

as.integer("4.27")
as.integer("Joe")
as.integer('Joe')
as.integer(TRUE)


# Character
char1 = "A"
char1

char2 = "bolha"
char2


# Complex

compl = 2.5 + 4i
compl

class(compl)

sqrt(-1)
sqrt(-1+0i)
sqrt(as.complex(-1))

# Logic
x =1; y = 2
z = x > y
z
class(z)

u = TRUE; v = FALSE
class(u)
u & v
u ! v
! u

# Operações com 0
5/0
0/5

# Erro
"Joe"/5

















