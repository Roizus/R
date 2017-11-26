install.packages("googleVis")
library(googleVis)

df=data.frame(country= c("US","GB","UK"), val1=c(10,20,30), val2=c(30,20,10))


Line <- gvisLineChart(df)
plot(Line)
