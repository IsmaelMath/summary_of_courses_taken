# ------------------- IMPORTANDO E MANIPULAÇÃO DE ARQUIVOS ------------------- #

pacote.utils <- c("read.table()", "read.csv()", "read.delim()")
pacote.readr <- c("read.delim()", "read_csv()", "read_tsv()")
pacotedata.table <- c("fread()", "-", "-")
df <- data.frame(pacote.utils, pacote.readr, pacotedata.table)
df

# Pacote Utils
#  read.csv()    Para valores separados por virgulas e pontos como separador decimal
#  read.csv2()   Para valores separados por ponto e virgula e virgula como separador decimal
#  read.delim()  Para valores separados por tab e ponto como separador decimal
#  read.delim2() Para valores separados por tab e virgula e virgula como separador decimal
#  read_fwf()    Para valores com número exato de bytes por coluna
#  read.table()  Muito útil quando se esta fazendo a leitura de arquivos ASCII, que contém
#                dados em formato retangular

# read.table("arquivo.txt", header = TRUE, sep=("," ou "\t"), stringsAsFactors=FALSE)
# header para saber se o arquivo possui ou n cabeçalho

# read.csv("arquivo.csv", stringsAsFactors=FALSE)
# read.csv2("arquivo.csv", sep=";", dec=",", stringsAsFactors=FALSE)

# read.delim("arquivo.txt")
# read.delim2("arquivo.txt")

# Parâmetros
    # header
    # col.names
    # na.string
    # colClasses
    # sep
    # stringsAsFactors - permite ou não converter uma string para factor

# Pacote readr
    # Lançado em Abril/2015 pelos desenvolvedores do RSTUDIO
    # install.packages("readr")
    # read_table()
    # read_csv()
    # read_delim()

install.packages("readr")
library(readr)

arq1 <- read_table("bigdatafile.txt", col_names = c("DAY", "MONTH", "YEAR", "TEMP"))# pacote readr
arq2 <- read.table("bigdatafile.txt", col.names = c("DAY", "MONTH", "YEAR", "TEMP"))# pacote utils

# Manipulação de arquivos Excel

# Pacote XLConnect - precisa ter java instalado
    # loadWorkbook()
    # getSheets()
    # readWorksheet()
    # createsheet()
    # writeWorksheet()


# Pacote xlsx 
    # read.xlsx(file, sheetIndex, header=TRUE, colClasses=NA)
    # read.xlsx2(file, sheetIndex, header=TRUE, colClasses="character")

# Pacote readxl
    # read_excel()
    # Excel_sheets()

# Pacote gdata
  # read.xls()

# Atenção aos Detalhes
# Em seus arquivos, evite espaços em brancos e numeros como titulos para coluna
# Normalmente, a primeira linha de cada arquivo é o cabeçalho, lista de nomes para cada coluna
# Para a concatenação de palavras, use . ou _
# Use nomes curtos como titulos de coluna
# Evite o uso de caracteres especiais
# Dados NA podem existir no seu conjunto de dados e isso será tratado no processo de limpeza

# Atenção aos detalhes
  # Encoding
  # Linha de cabeçalho
  # Separação de colunas
  # Quoting(aspas)
  # Missing values
  # Linhas em branco
  # Espaços em branco em campos do tipo caracter
  # Comentários


# Outros Pacotes para manipulação de Arquivos:
    # rjson Json
    # XML xml
    # httr - html
    # Rcurl - web crawling
    # foreign - para arquivos spss, sas
    # sas7bdat - para arquivos sas


# data.table - Fornece um rapido processo de carga de dados, pois as funções reconhecem
# automaticamente os parametros dos arquivos e decidem a melhor forma de carga

# fread()

# Resumindo:

# Manipulação de arquivos txt e csv:
    # Package utils: read.table(), read.csv(), read.delim()
    # Package readr: read_table(), read_csv(), read_delim()
    # Package data.table: fread()

# Manipulação de arquivos excel:
    # XLConnect
    # xlsx
    # readdxl
    # gdata
    # r2excel



