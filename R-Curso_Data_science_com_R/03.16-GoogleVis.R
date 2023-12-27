# ----------------------------  GoogleVis ---------------------------- #

# googleVis - Visualizações Interativas

# Baseado no Google Chart (Visualização de dados na web)
# googleVis é um pacote que fornece interface entre R e o Google Charts
# Utiliza JavaScript e arquivos JSON. Os dados são transformados em formato JSON
# O resultado é gerado em html5 ou flash
# Podeśe criar os mais variados tiposde gráficos e mapas. Inclusive Google Maps
# Você pode incorporar os gráficos criando em páginas HTML ou maps
# Verificar temos de uso, antes de visualizar

install.packages("googleVis")
library(googleVis)
?googleVis

# Criando um data.frame
df = data.frame(País = c("BR", "CH", "AR"),
                Exportações = c(10, 13, 14),
                Importações= c(23, 12, 32))
df

# Gráfico de linha
Line <- gvisLineChart(df)
plot(Line)

# Gráfico de barras
Column = gvisColumnChart(df)
plot(Column)

# Gráfico de barras na horizontal
Bar <- gvisBarChart(df)
plot(Bar)

# Gráfico de pizza 
Pie <- gvisPieChart(CityPopularity)
plot(Pie)

# Gráficos Combinados
Combo <- gvisComboChart(df, xvar="País", yvar=c("Exportações", "Importações"),
                        options=list(seriesType="bars",
                                     series="{1: {type:'line'}}"))
plot(Combo)

# Scatter Chart
Scatter <- gvisScatterChart(women, options = list(legend="none",
                                                  lineWidth=2, pointSize=0,
                                                  title="Women", vAxis="{title:'weight (lbs'}",
                                                  bAxis="{title:'height (in)'}",
                                                  width=300, height=300))
plot(Scatter)

# Bubble
Bubble <- gvisBubbleChart(Fruits, idvar = "Fruit",
                          xvar="Sales", yvar="Expenses",
                          colorvar = "Year", sizevar="Profit",
                          options = list(hAxis='{minValue:75, maxValue:125}'))
plot(Bubble)

# Customizando 
M <- matrix(nrow=6, ncol=6)
M[col(M)==row(M)] <- 1:6
dat <- data.frame(X=1:6, M)
SC <- gvisScatterChart(dat,
                       options = list(title="Customizing points",
                                      legend="right",
                                      pointSize=30,
                                      Series="{
                                      0: { pointShape: 'circle' },
                                      1: { pointShape: 'triangle' },
                                      2: { pointShape: 'square' },
                                      3: { pointShape: 'diamond' },
                                      4: { pointShape: 'star' },
                                      5: { pointShape: 'polygon' },
                                      }"))
plot(SC)

# Gauge
Gauge <- gvisGauge(CityPopularity,
                   options = list(min=0, max=800, greenFrom=500,
                                  greenTo=800, yellowFrom=300, yellowTo=500,
                                  redFrom=0, redTo=300, width=400, height=300))
plot(Gauge)

# Maps
Intensity <- gvisIntensityMap(df)
plot(Intensity)

# Geo Chart
Geo = gvisGeoChart(Exports, locationvar = "Country",
                   colorvar = "Profit",
                   options = list(projection="kavrayskiy-vii"))
plot(Geo)

# Google Maps
AndrewMap <- gvisMap(Andrew, "LatLong", "Tip",
                     options = list(showTip=TRUE,
                                    showLine=TRUE,
                                    enableScrollWheel=TRUE,
                                    mapType="terrain",
                                    useMapTypeControl=TRUE))
plot(AndrewMap)


# Dados em Gráficos. Nível de analfabetismo nos EUA
require(datasets)

states <- data.frame(state.name, state.x77)
GeoStates <- gvisGeoChart(states, "state.name", "Illiteracy",
                          options=list(region="US",
                                       displayMode="regions",
                                       resolution="provinces",
                                       width=600, height=400))
plot(GeoStates)

# Mais exemplos
demo(googleVis)










