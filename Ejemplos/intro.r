setwd("C:/Users/miguel.halys/datasets/")
multas<-read.csv("201709_detalle.csv",sep=";")
class(multas)
str(multas)# me describe los metadatos
summary(multas)# me hace un resumen de estadística descriptiva de los datos
multas[,2]
multas$IMP_BOL #$ es un puntero de columna
boxplot(multas$IMP_BOL) #hacer un boxplot de multas
boxplot(multas$VEL_CIRCULA)

multas2<-order(multas$IMP_BOL) #comando para ordenar un DF
class(multas2)
?sort
mean(multas$VEL_CIRCULA,na.rm = TRUE) # na.rm: elimina valores NA
median()
max()
2+NA

list("soy",1,TRUE) # lista -> n tipos

c(1,2,3) #array -> sólo 1 tipo

?subset
multas_90 <- subset(multas,VEL_CIRCULA==90)

quantile(multas_90$PUNTOS, probs = seq(0,1,0.1))

summary(multas_90)

# almacena en el dataframe multas_90 el dataframe editado
multas_90<- edit(multas_90)


order(multas_90)
