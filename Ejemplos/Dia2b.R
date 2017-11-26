
rm(list=ls())

install.packages("HistData")
install.packages("UsingR")
?Galton

library(UsingR)
library(HistData)

data(Galton)
View(Galton)

View(GaltonFamilies)
data(GaltonFamilies)


# histograma sencillo
par(mfrow=c(1,2))
hist(Galton$parent, col = "lightgray", main="histograma estatura padres", xlab="estatura")
hist(Galton$child, col = "gray" , main="histograma estatura hijos", xlab="estatura")
par(mfrow=c(1,1))
?par
# efecto del numero de bins

# numero de bins segun Sturges
hist(Galton$child, col = "gray" , main="histograma estatura hijos", xlab="estatura") 

# numero de bins segun Sturges formula, aprox 10 bins
# el valor tomado por defecto es sturges
nbins = log2(nrow(Galton))+1
hist(Galton$child, breaks = nbins, col = "gray" , main="histograma estatura hijos", xlab="estatura")  

# numero de bins segun formula raiz cuadrada, aprox 30 bins
nbins = sqrt(nrow(Galton))
hist(Galton$child, breaks = nbins, col = "gray" , main="histograma estatura hijos", xlab="estatura")  

# numero de bins segun formula de Rice
nbins = 2*(nrow(Galton)^(1/3))
hist(Galton$child, breaks = nbins, col = "gray" , main="histograma estatura hijos", xlab="estatura")  

# cuando aumentamos el número de bins puede haber bins sin valores
hist(Galton$child, breaks=100 , col = "gray" , main="histograma estatura hijos", xlab="estatura") 



# histograma con un filtrado para que la curva sea mas suave
d_p = density(Galton$parent)
d_c = density(Galton$child)
par(mfrow=c(1,2))
plot (d_p, col="blue", main="histograma estatura padres", xlab="estatura")
plot (d_c, col="blue", main="histograma estatura hijos", xlab="estatura")
par(mfrow=c(1,1))







##############################################################
#### Boxplot
##############################################################

#buscamos el dataset iris
data(iris)
View(iris)
head(iris)

# Vemos los valores unicos de las especies
unique(iris$Species)

# Resumen de los datos
summary(iris)

# boxplot de una lista de valores
boxplot(iris$Sepal.Length)

# boxplots para las 4 especies de flores
par(mfrow=c(2,2))
boxplot(iris[,1]  ~ Species, data = iris, xlab= "Sepal Length")
boxplot(iris[,2] ~ Species, data = iris, xlab= "Sepal Width")
boxplot(iris[,3]  ~ Species, data = iris, xlab= "Petal Length")
boxplot(iris[,4] ~ Species, data = iris, xlab= "Petal Width")
par(mfrow=c(1,1))

# boxplot de todas las variables numéricas sin tener en cuenta la especie
boxplot.matrix(as.matrix(iris[1:4]), col = "bisque")
title("iris")

## boxplot sobre otros datos
insectSprays_df<- data("InsectSprays")
?InsectSprays
boxplot(count ~ spray, data = InsectSprays, col = "lightgray")
title("InsectSprays")



install.packages("plotly")
library(plotly)

# boxplot de una distribucion normal
vals = rnorm(1000)
plot_ly(y = vals, type ="box")




##############################################################
#### Stem-leaf
##############################################################

# usando los datos de estatura de Galton
estatura = Galton$child
stem(estatura)
#comparar con el histograma, perfilando los resultados usando más bins
hist(Galton$child, breaks=100 , col = "gray" , main="histograma estatura hijos", xlab="estatura") 






##############################################################
#### Bar-plots
##############################################################

# bar plot simple
barplot(c(10, 14,12), names.arg = c("rojo", "verde", "azul"), main="Ventas de coches por color", xlab="Color")
# en horizontal
barplot(c(10, 14,12), horiz = TRUE, names.arg = c("rojo", "verde", "azul"), main="Ventas de coches por color", xlab="Color")

#  con datos reales 
?mtcars
View(mtcars)
cuenta = table(mtcars$cyl)
table(mtcars$cyl , mtcars$gear)
barplot(cuenta, main="Nº de coches vs cilindros", xlab="Numero de cilindros",
        col=c("blue")) 

# bar plot apilado
data(mtcars)
mtcars$vs = factor(mtcars$vs, levels= c(1,0), labels= c("V","S"))
cuenta <- table(mtcars$vs, mtcars$gear)
barplot(cuenta,  main="Nº de coches con motor en V vs Nº de marchas", 
        xlab="Nº de marchas", legend = rownames(cuenta),
        col=c("red","blue")) 

# bar plot agrupado
data(mtcars)
mtcars$vs = factor(mtcars$vs, levels= c(1,0), labels= c("V","S"))
cuenta <- table(mtcars$vs, mtcars$gear)
barplot(cuenta,  main="Nº de coches con motor en V vs Nº de marchas", 
        xlab="Nº de marchas", legend = rownames(cuenta),
        beside = TRUE,
        col=c("red","blue"))









##############################################################
#### Pie charts, diagramas de tartas
##############################################################

#  con mismos datos que los usados en los diagramas de barras
cuenta = table(mtcars$cyl)
df_cuenta = data.frame(cuenta)
df_cuenta
plot_ly(df_cuenta,labels= ~Var1, values=~Freq, type = "pie") %>%
  layout(title = 'Distribución de coches por nº de cilindros',
         xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
         yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))









##############################################################
#### Pareto charts
##############################################################

# Pareto chart, identificar causas más importantes para un resultado
install.packages("qcc")
library(qcc)
num_defectos = c(12,34,35,110,162)
names(num_defectos) = c("pintura", "acabado","medidas","forma","color")
pareto.chart(num_defectos, main="Pareto Chart \n defectos en mesas de cocina vs causas")








##############################################################
#### Scatterplots
##############################################################

# Ejemplo de scatterplot
set.seed(123)

# visualizamos dos normales independientes
dat = data.frame(matrix(rnorm(1000*2, 0, 1),ncol=2))   # data frame con normales independientes en columnas
colnames(dat) = c("x", "y")
plot(dat$x,dat$y, xlab="X", ylab="Y", 
     main="Scatterplot de dos variables aleatorias \n normales independientes")
# trazamos la linea de regresión lineal
mod = lm(y ~ x, data = dat)
abline(mod, col ="blue")

# generamos una normal bivariada y visualizamos su scatterplot
dat = as.matrix(dat)  # transformamos en matrix
sg = chol(matrix(c(1,  0.9,               # matrix de covarianza
                   0.9, 1), byrow = T, ncol=2))
dat_nb = t(t(sg) %*%  t(dat))  # normal bivariada generada
dat_nb = data.frame(dat_nb)
colnames(dat_nb) = c("x", "y")
plot(dat_nb$x,dat_nb$y, xlab="X", ylab="Y", 
     main="Scatterplot de dos variables aleatorias \n normales bivariadas")
cov (dat_nb)
# trazamos la linea de regresión lineal
mod = lm(y ~ x, data = dat_nb)
abline(mod, col ="blue")

# # Ejemplo de scatterplot
# set.seed(123)
# dat = data.frame(matrix(rnorm(500*2, 0, 1),ncol=2))
# colnames(dat) = c("x", "y")
# dat$y = 0.9 * dat$x + sqrt(1-0.9^2) * dat$y
# plot(dat$x,dat$y, xlab="X", ylab="Y", 
#     main="Scatterplot de dos variables aleatorias \n normales bivariadas")
# cov (dat)

# una apariencia mucho mejor con plotly
library(plotly)
plot_ly(dat_nb, x = ~x, y = ~y, type ="scatter", mode = "markers")






##############################################################
#### Scatterplots 3D
##############################################################
# Ejemplo de scatterplot
set.seed(123)

# visualizamos 3 normales independientes
dat = data.frame(matrix(rnorm(1000*3, 0, 1),ncol=3))   # data frame con normales independientes en columnas
colnames(dat) = c("x", "y", "z")
plot_ly(dat, x = ~x, y = ~y,  z = ~z, color = ~z, type ="scatter3d", mode = "markers")


# generamos una normal multivariada y visualizamos su scatterplot
dat = as.matrix(dat)  # transformamos en matrix
sg = chol(matrix(c(1,  0.9, 0.9,              # matrix de covarianza
                   0.9, 1,  0.9,
                   0.9,  0.9, 1), byrow = T, ncol=3))
dat_nb = t(t(sg) %*%  t(dat))  # normal bivariada generada
dat_nb = data.frame(dat_nb)
colnames(dat_nb) = c("x", "y","z")
plot_ly(dat_nb, x = ~x, y = ~y,  z = ~z, color = ~z, type ="scatter3d", mode = "markers")
cov (dat_nb)








##############################################################
#### Gráficos de linea
##############################################################

# gráfico de una serie temporal
View(airmiles)
?airmiles
class(airmiles)
time(airmiles)
plot(airmiles)

library(plotly)
plot_ly(x = time(airmiles), y = airmiles, type ="scatter", mode = "lines")






##############################################################
#### Plots de superficie
##############################################################

# Ejemplo de plot de superficie, superficie discontinua
m  = matrix(rnorm(50*50), nrow = 50, ncol = 50)
plot_ly(z = m, type = "surface")

m[,40:50] = m[,40:50] + 5
plot_ly(z = m, type = "surface")

# Ejemplo de plot de superficie, funcion sinc, superficie continua
x =seq(-10,10,0.1)
y =seq(-10,10,0.1)
f1 = function(x,y) { R=sqrt(x^2+y^2); sin(R)/R}
m = outer(x,y,f1)
plot_ly(z = m, type = "surface")

# Ejemplo de plot de superficie, funciones sin, superficie continua
f2 = function(x,y) { sin(x) + sin(y)}
x =seq(-2*pi,2*pi,0.1)
y =seq(-2*pi,2*pi,0.1)
m = kronecker(matrix(x,ncol=1),matrix(y,nrow = 1), f2)
plot_ly(z = m, type = "surface")

f3 = function(x,y) { sin(x) * sin(y)}
m = kronecker(matrix(x,ncol=1),matrix(y,nrow = 1), f3)
plot_ly(z = m, type = "surface")







##############################################################
#### Heat Map
##############################################################

# Ejemplo de heatmap
m  = matrix(rnorm(50*50), nrow = 50, ncol = 50)
View(m)
plot_ly(z = m, type = "heatmap")

#aumentamos la intensidad en las ultimas columnas y vemos el resultado
m[,40:50] = m[,40:50] + 2
plot_ly(z = m, type = "heatmap")

# otra función para heatmaps en el paquete básico
image(m, col=gray.colors(256))
image(m, col=rainbow(256))







##############################################################
#### Mapa coroplético, Choropleth maps
##############################################################

# mapa coloreado en función de valores georeferenciados
install.packages("choroplethr")
install.packages("choroplethrMaps")

library(choroplethr)
library(choroplethrMaps)
?df_pop_state
data(df_pop_state)
?state_choropleth
state_choropleth(df_pop_state)






##############################################################
#### Diagramas relacionados
##############################################################

# ejemplo de gràficos divididos por sus relaciones con variables específicas
install.packages("ggplot2")
library(ggplot2)
?diamonds
head(as.data.frame(diamonds))
ggplot(diamonds, aes(x=carat, y=price, color=cut)) + 
  geom_point() + 
  facet_wrap(~ clarity)


