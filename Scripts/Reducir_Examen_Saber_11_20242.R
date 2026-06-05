#Instalar y llamar paquetes
install.packages("dplyr")
library(dplyr)

#Reducir base de datos "Examen_Saber_11_20242" para subir a GitHub
data<- read.csv("~/Downloads/Examen_Saber_11_20242.txt.gz", sep=";")
names(data)
data <- data %>%
  select(estu_consecutivo, cole_calendario, cole_naturaleza, estu_genero, estu_etnia, estu_cod_reside_mcpio, desemp_sociales_ciudadanas, percentil_sociales_ciudadanas, punt_sociales_ciudadanas, punt_global)
write.csv(data, "C:/Users/sofig/Downloads/Ciudadanas.csv", row.names = FALSE)
