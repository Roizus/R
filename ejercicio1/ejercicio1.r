setwd("C:\\Users\\miguel.halys\\datasets")
dataframe<-read.csv("wine.csv",sep=",")
#3 Ok
class(dataframe)
#4 Ok
str(dataframe)
#5 Ok
head(dataframe,3)
tail(dataframe,8)
#6 Ok
dim(dataframe)

length(dataframe) # número de columnas

colnames(dataframe) # nombre de columnas

#7 Ok
sapply(dataframe, class)


#8 Ok
mean(dataframe$malic_acid)

#9
colMeans(dataframe[, c(2:length(dataframe))])

#10 Ok
?colSums(dataframe)
arrayOfIndexes<-c(2:length(dataframe))

colSums(dataframe[arrayOfIndexes])

#11 Ok
df_class_1<-subset(dataframe, class == "class_1")
dim(df_class_1) # retorna el length de filas y length de columnas

#12 Ok
dataframe[c(1:10),]
dataframe[,c(1:5)]

#13 Ok
dataframe[c(-1:-2),]
dataframe[,c(1:5)]

#ten_first_rows_backwise<- row(df_class_1, -49)
#ten_first_columns_backwise<- col(df_class_1, -4)

#14 Ok .. las indeterminaciones son NaN i.e: 0/0
?quantile
quantile(dataframe$alcohol, probs = seq(0, 1, 0.25))

#15 Ok
quantile(dataframe$alcohol, probs = seq(0, 1, 0.1))

#percentil
quantile(dataframe$alcohol, probs = seq(0, 1, 0.001))


#16 Ok 
summary(dataframe)

#17 Ok
unique(dataframe$proline)

#18 Ok
?subset
subset(dataframe,subset = proline>1000 ,select = proline)

#19

#20 Ok
charArray<- c('C','A','C')

sapply(charArray, tolower)

#21 Ok
proline_column <- dataframe$proline
proline_column[1:6]


# 22 Muestre de forma ordenada de menor a mayor los 6 primeros elementos de lavariable proline. Ok
# HOW-TO dataframe[order(dataframe$alcohol),]
?order
head(dataframe[order(dataframe$proline),])['proline']

# 23 Muestre de forma ordenada de menor a mayor los 6 últimos elementos de la variable proline. Ok 
tail(dataframe[order(dataframe$proline),], 6)['proline']

#ejemplo del help
?rbind

(ii <- order(x <- c(1,1,3:1,1:4,3), y <- c(9,9:1), z <- c(2,1:9)))

rbind(x, y, z)[,ii]

rbind(x, y, z)[, order(x, -y, z)]

dd <- transform(data.frame(x, y, z), z = factor(z, labels = LETTERS[9:1]))

#24 Muestre de forma ordenada de mayor a menor los 10 primeros elementos de lavariable proline. Ok
(head(dataframe[order(dataframe$proline,decreasing = TRUE),], 10)['proline'])

#25 Muestre la posición del vector de los 6 valores más pequeños de la variable proline.Ok
firstSixOrderedDataframe<- head(dataframe[order(dataframe$proline),])
firstSixOrderedDataframe['proline']

#26 Ok
which(dataframe$proline == firstSixOrderedDataframe[1,])

#27 Reordene el data.frame por medio de la variable proline. Confirme el efectovisualizando los 6 primeros registros Ok
head(dataframe[order(dataframe$proline),],6)


#28


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
