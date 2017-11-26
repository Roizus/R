install.packages("googleVis")
library(googleVis)

setwd("C:\\Users\\miguel.halys\\proyectos\\estadistica-grafos\\datasets")
df<-read.csv("201709_detalle.csv", sep = ";")

edit(df)

#Sacar por denunciante
?aggregate
?S3
multa_media<-aggregate(df$IMP_BOL, by=list(df$DENUNCIANTE), FUN=mean, na.rm=TRUE)

Pie<- gvisPieChart(multa_media)
plot(Pie)



#Ex1 line chart - (horas frente importe medio)
imp_medio<- mean(df$IMP_BOL)
df1<- aggregate(df$IMP_BOL, by=list(df$HORA), FUN=mean, na.rm=TRUE)
Line <- gvisLineChart(df1)
plot(Line)

#Ex2 bar chart - (número multas por denunciante)
df2 <- aggregate(df$IMP_BOL, by=list(df$DENUNCIANTE), FUN=length)
Bar<- gvisBarChart(df2)
plot(Bar)
#Ex3 bubble chart - (undef) y:importe x:time z:conteo(gravedad) el número de multas por gravedad y por importe al día
summary(df3)
#df3<- aggregate(df$IMP_BOL , by=list(df$CALIFICACION, as.integer(df$HORA)) ,FUN=length)
#colnames(df3)<- c("CALIFICACION","HORA","NUMERO_MULTAS")
#Bubble <- gvisBubbleChart(df3, idvar="CALIFICACION", xvar="HORA", yvar="CALIFICACION",sizevar="NUMERO_MULTAS"
#                          ,options=list(vAxis='{minValue:-250, maxValue:40000}'))
#plot(Bubble)
#Ex3 Bis X: la velocidad y: el importe de la boleta z: el número de registros

df3bis <- na.omit(df[,c("VEL_LIMITE","IMP_BOL","CALIFICACION")])

agg <- aggregate(df3bis, by=list(df3bis$CALIFICACION), FUN=length)

Bubble <- gvisBubbleChart(df3bis, idvar="CALIFICACION", xvar="VEL_LIMITE", yvar="IMP_BOL",)
plot(Bubble)


#Ex4 Column chart
# sacar una tabla que muestre el exceso del límite de circulación por horas
df$DIFF <- df$VEL_CIRCULA-df$VEL_LIMITE
df4 <- df[, c("HORA","DIFF")]
as.integer(df$HORA)
df4 <- aggregate(df4$DIFF, by=list(as.integer(df$HORA)), mean, na.rm=TRUE)
colnames(df4)<-c("HORA","EXCESO_VELOCIDAD")
View(df4)
Column <- gvisColumnChart(df4)
plot(Column)

#Ex5 pie chart - (número multas por Calificación)
df5<-aggregate(df$IMP_BOL, by=list(df$CALIFICACION), FUN=length)
Pie <- gvisPieChart(df5)
plot(Pie)


#Avanzado(X;Y) coordenadas UTM ¿mostrar?
#Annotation chart(día del mes - importe total de multas)
#Histograma( día del mes - importe total de multas)
#Calendar map(día del mes - import medio de multas)