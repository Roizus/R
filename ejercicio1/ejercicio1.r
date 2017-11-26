setwd("D:\\Proyectos\\ProyectosMaster\\datasets")
dataframe<-read.csv("wine.csv",sep=",")
#3 ¿De qué clase es instancia este objeto? Ok
class(dataframe)

#4 ¿Cómo se puede ver cuáles son las clases de cada columna y una muestra de ejemplo? Ok
str(dataframe)

#5 ¿Cómo se pueden ver los 3 primeros registros del dataset?, ¿y los 8 últimos? Ok
head(dataframe,3)
tail(dataframe,8)

#6 ¿Cómo se puede saber la dimensión del dataset?, ¿y los nombres de las columnas? Ok
dim(dataframe) # dimensión del dataset
length(dataframe) # número de columnas
colnames(dataframe) # nombre de columnas

#7 ¿Existe alguna variable categórica?, ¿cuál? Ok
?Filter
names(Filter(is.factor, dataframe))

#8 Calcule la media de todos los "malic acids". Ok
mean(dataframe$malic_acid)

#9 Calcule la media de las columnas (en aquellas que sea posible, descartando las otras). Ok
colMeans(dataframe[, c(2:length(dataframe))])

#10 Ok Calcule la suma de todas las columnas.
?colSums(dataframe)
arrayOfIndexes<-c(2:length(dataframe))

colSums(dataframe[arrayOfIndexes])

#11 Seleccione y almacene en un nuevo data.frame llamado df_class_1 todos los registrosde tipo "class_1". Ok
?subset
df_class_1<-subset(dataframe, subset = class == "class_1")
dim(df_class_1) # retorna el length de filas y length de columnas

#12 Seleccione las 10 primeras filas y las 5 primeras columnas. Ok
dataframe[c(1:10),]
dataframe[,c(1:5)]

#13 Obtenga los mismos resultados que el punto anterior, pero utilizando índices negativos Ok
dataframe[-c(11:dim(dataframe)[1]),]
dataframe[,-c(6:dim(dataframe)[2])]

#14 Obtenga los cuartiles de la variable alcohol. Ok
# .. las indeterminaciones son NaN i.e: 0/0
?quantile
quantile(dataframe$alcohol, probs = seq(0, 1, 0.25))

#15 Obtenga los deciles de la variable alcohol. Ok
quantile(dataframe$alcohol, probs = seq(0, 1, 0.1))

#percentil
quantile(dataframe$alcohol, probs = seq(0, 1, 0.001))


#16 Obtenga los estadísticos básicos de todas las variables con un solo comando. Ok 
summary(dataframe)

#17 ¿Cuantos valores únicos existen para las medidas de proline? Ok
unique(dataframe$proline)

#18 Sobre el total de registros de proline, ¿cuantos tienen un valor mayor de 1000? Ok
?subset
subset(dataframe,subset = proline>1000 ,select = proline)

#19

#20 A partir de un vector de caracteres nuevo con algunas letras en mayúsculas, cámbielo a minúsculas. Ok
charArray<- c('C','A','C')
sapply(charArray, tolower)

#21 Muestre los 6 primeros elementos de la variable proline. Ok
proline_column <- dataframe$proline
proline_column[1:6]


# 22 Muestre de forma ordenada de menor a mayor los 6 primeros elementos de lavariable proline. Ok
# HOW-TO dataframe[order(dataframe$alcohol),]
?order
head(dataframe[order(dataframe$proline),], 6)['proline']

# 23 Muestre de forma ordenada de menor a mayor los 6 últimos elementos de la variable proline. Ok 
tail(dataframe[order(dataframe$proline),], 6)['proline']

#24 Muestre de forma ordenada de mayor a menor los 10 primeros elementos de la variable proline. Ok
head(dataframe[order(dataframe$proline,decreasing = TRUE),], 10)['proline']

#25 Muestre la posición del vector de los 6 valores más pequeños de la variable proline.Ok
firstSixOrderedDataframe<- head(dataframe[order(dataframe$proline),], 6)
which(dataframe$proline <= max(firstSixOrderedDataframe$proline))

#26 Indexe el valor más pequeño del anterior punto y confirme que es el más pequeño. Ok
which(dataframe$proline == firstSixOrderedDataframe[1,]$proline)

cat( "El valor mínimo de proline en el dataframe inicial
      es igual al valor de proline del primer valor del dataframe con observaciones más bajas proline ordenadas de menor a mayor?",
     min(dataframe$proline) == min(firstSixOrderedDataframe$proline))

#27 Reordene el data.frame por medio de la variable proline. Confirme el efectovisualizando los 6 primeros registros. Ok
head(dataframe[order(dataframe$proline),],6)


#28 Obtenga los valores de la matriz que satisfagan la condición de ser mayor que 97. Ok
?matrix
?runif
set.seed(1234)

A<- matrix(runif(25,1,250), nrow = 5, ncol = 5, byrow = T)

##Forma 1.
A[which(A[,1]>97),1]
A[which(A[,2]>97),2]
A[which(A[,3]>97),3]
A[which(A[,4]>97),4]
A[which(A[,5]>97),5]
### Nota: me gustaría saber alguna manera de poder aplicar una función a cada fila de la matriz

##Forma 2.
Filter(function(x) x>97, A)

##Forma 3. 
apply(A, 2, function(x) ifelse(x>97,x, 0))

#29 Obtenga los índices de los valores anteriores.Ok
apply(A, 2, function(x) which(x>97))
which(A > 97, arr.ind = T)

#30. Obtenga los índices de los valores mayores que 90 y menores que 98. Ok
##Forma 1. sólo devuelve los índices de las filas
apply(A, 2, function(x) which(x>90 & x<150))
### Es extraño, porque en la forma 1 del ejercicio 29 si que muestra las columnas.

##Forma 2. devuelve el índice de fila y columna que cumple la condición
which( A>90 & A<98, arr.ind = T )






#### APUNTES
?colnames
column_names<-colnames(dataframe)
class(column_names)

#
dataframe[-c(1,2)]
#

nombres<-c("a","b")
edades<-c(20,23)

df2<-data.frame(nombres, edades)

colnames(df2)<-c("NOMBRES","EDADES")


first_three_column_names<-as.vector(column_names)[1:3]
class(first_three_column_names)

?as.list
mean(first_three_column_names)

# sacar la media apuntando al dataframe con índice
colMeans(dataframe[2])
colMeans(dataframe[c(4,7)])
#

a<- matrix(runif(9,1,20), nrow = 3, ncol = 3, byrow = T)
b<- matrix(runif(9,1,20), nrow = 3, ncol = 3, byrow = T)
a*b
a%*%b
a%o%b

?matrix
a
a[ a[,1]>10 | a[,2]>10 | a[,3]>10,,drop=T]



m <- matrix( sample(12,28,repl=T) , 7 , 4 )
m[ m[,2] == 3 & m[,3] == 12 , ]

m[which(m[,1] == 2)]
