##############################################################
# Generar Stem and leafs e histograma
##############################################################

vals = c(0,1,3,3,4,11,11,15,15,15,15,22,22,22,24,24,24,26,28,28,31,
         49,53,53,59,64,64,64,64,64,76,76,76)
stem(vals)
hist(vals, main = "Histograma", xlab = "valores", col = "lightblue")

##############################################################
# comprobar que los valores obtenidos en un boxplot corresponden con Q1, Q3,....
##############################################################

# generamos unos valores de ejemplo
vals=c(10, 11, 11, 12, 13, 13, 13.5, 14, 14, 16, 17, 18,19,20,25,28)
# boxplot de los valores generados
st = boxplot(vals)


# correspondencia del boxplot con Q1, Q3, IQR, etc...
mediana = median(vals)
cat ( "mediana:", mediana)

quantiles_Q1_Q2_Q3 = quantile (vals, probs = c(0.25, 0.5, 0.75), type = 2)
quantiles_Q1_Q2_Q3

Q3 = quantiles_Q1_Q2_Q3[3]
Q1 = quantiles_Q1_Q2_Q3[1]
cat ( "Q1:", Q1,"    Q3:", Q3)
IQR_vals = unname(Q3 - Q1)
cat ( "IQR:", IQR_vals)

whisker_sup = Q3 + 1.5*IQR_vals
whisker_inf = Q1 - 1.5*IQR_vals
cat ( "whisker_sup:", whisker_sup,"  whisker_inf:", whisker_inf) 
