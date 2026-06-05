# 1.Instalar y llamar paquetes necesarios
install.packages("dplyr")
library(dplyr)
install.packages(ggplot2)
library(ggplot2)
?ggplot

# 2.Poner la base de datos Ciudadanas en un objeto "data" (para no dañar la original) y poner la base de datos con municipios pdet en un objeto. 
data<- read.csv("~/Downloads/Ciudadanas.csv.gz")
pdet<- read.csv("~/Downloads/Municipios_PDET_20260601.csv")

# 3. Crear una nueva columna "PDET" para clasificar los datos en Pdet= 1 NoPDET= 0. Se compara los municipios de "data" con "pdet", los códigos que coincidan son PDET
# 3.1. Verificar que las variables a comparar tienen la misma clase
class(data$estu_cod_reside_mcpio)
class(pdet$CodigoMunicipio)

# 3.2. Crear un vector con los códigos de los municipios. 
# Un vector sirve para agrupar datos de un mismo tipo, en este caso los códigos de los municipios
c_pdet <- pdet$CodigoMunicipio

# 3.3. Crear columna PDET
#if_else: Condicional. Si este valor en estu_cod_reside_mcpio está en c_pdet entonces 1, de lo contrario 0
data <- data %>%
  mutate(PDET = if_else(estu_cod_reside_mcpio %in% c_pdet, 1, 0))

# 4. Primer análisis de datos.
# 4.1. Verificar la clase de las variables y la normalidad de la muestra
class(data$punt_sociales_ciudadanas)
class(data$PDET)
data$PDET<-as.factor(data$PDET)

ks.test(scale(data$punt_sociales_ciudadanas), "pnorm")
# p < 0.05 - La muestra no se distribuye normalmente.

# 4.2.  Mann–Whitney U Test
# Se utiliza cuando se quiere comparar dos grupos y no se cumple el supuesto de normalidad.
U1<- wilcox.test(punt_sociales_ciudadanas ~ PDET, data = data)
U1
#Hay una diferencia estadísticamente significativa entre los grupos. 

# 4.3 Hacer gráfico boxplot. 
#Buena opción para comparar la distribución de puntajes entre grupos. 
#geom_boxplot: Indica la gráfica que se quiere. 
#aes(): la función que permite relacionar los datos con los elementos gráficos. 
#fill: que los cajones tengan colores distintos.
#labs: Para las estiquetas dentro del gráfico. 
ggplot(data = data) +
  geom_boxplot(aes(x = factor(PDET), y = punt_sociales_ciudadanas, fill = PDET)) +
  labs(
    x = "No PDET = 0, PDET = 1",
    y = "Puntaje Competencias Ciudadanas",
    title = "Distribución del puntaje por condición PDET"
  )

# 5. Segundo Análisis de datos
# 5.1. Cambiar OFICIAL/No OFICIAL por 1/0. Poner la variable como factor. 
class(data$cole_naturaleza)
data$cole_naturaleza <- ifelse(data$cole_naturaleza == "OFICIAL", 1, 0)
data$cole_naturaleza<-as.factor(data$cole_naturaleza)

# 5.2. Regresión lineal múltiple con interacción.
# Interacción: Permite ver si el efecto PDET depende de la Naturaleza del colegio.
# Es múltiple por que tiene dos variables independientes (PDET y Naturaleza del colegio)
# Fórmula estadística: Puntaje^=𝛽0+𝛽1PDET+𝛽2cole_naturaleza+𝛽3(PDETxNaturaleza)+𝜀

lm1 <- lm(data$punt_sociales_ciudadanas ~ data$PDET * data$cole_naturaleza)
lm1
summary(lm1)

#Estimates (todos significativos)
# Intercepto: PDET=0, N_Cole=0 -> 51.984
# data$PDET1: PDET=1, N_Cole=0 -> -5.138 -> No oficial y PDET reduce el puntaje.
# data$cole_naturaleza: PDET=0, N_Cole=1 -> -4.477 -> Oficial y No PDET reduce el puntaje.
# data$PDET1:data$cole_naturaleza1: PDET=1, N_Cole=1 -> 1.488 -> Oficial y PDET es menos negativo que No Oficial y PDET

# 5.3.Hacer gráfico
# Poner en un objeto los valores predichos por el modelo. 
pred <- data %>%
  mutate(pred = predict(lm1))

# Gráfico de líneas
# x: El efecto principal, PDET. 
# Group: Lo que modifica el efecto principal, se divide en grupos. 
ggplot(pred, aes(x = PDET, y = pred, color = cole_naturaleza, group = cole_naturaleza)) +
  stat_summary(fun = mean, geom = "line", size = 1.2) +
  stat_summary(fun = mean, geom = "point", size = 3) +
  labs(
    title = "Interacción entre PDET y Naturaleza del colegio",
    x = "0 = No PDET, 1 = PDET",
    y = "Puntaje predicho",
    color = "  0 = No Oficial 
    1 = Oficial"
  ) +
  theme_minimal()
