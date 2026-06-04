# 1. URl para descargar bases de datos a utilizar: 
# 1.1. Examen Saber 11 2024-2: https://icfesgovco.sharepoint.com/sites/BasesDataIcfes/Documentos%20compartidos/Forms/AllItems.aspx?id=%2Fsites%2FBasesDataIcfes%2FDocumentos%20compartidos%2F01%5FExamen%20Saber%2011%C2%B0%2F01%5FBases%20Nacionales&p=true&ga=1
# 1.2. Municipios PDET: https://www.datos.gov.co/Agricultura-y-Desarrollo-Rural/Municipios-PDET/idrk-ba8y/about_data

# 2. Poner la base de datos Examen Saber 11 en un objeto "data" (para no dañar la original)
# 2.1. Poner la base de datos con municipios pdet en un objeto. 
data<- read.csv("~/Downloads/Examen_Saber_11_20242.txt.gz", sep=";")
pdet<- read.csv("~/Downloads/Municipios_PDET_20260601.csv")

# 3. Limpiar base de datos: Solo mantener las variables con las que se va a trabajar.
names(data)
data <- data %>% 
  select(estu_consecutivo, cole_calendario, cole_naturaleza, estu_genero, estu_etnia, estu_cod_reside_mcpio, desemp_sociales_ciudadanas, percentil_sociales_ciudadanas, punt_sociales_ciudadanas, punt_global)

# 4. Crear una nueva columna "PDET" para clasificar los datos en Pdet= 1 NoPDET= 0. Se compara los municipios de "data" con "pdet", los códigos que coincidan son PDET
#4.1. Intalar y llamar paquete necesario. 
install.packages("dplyr")
library(dplyr)

#4.2. Verificar que las variables a comparar tienen la misma clase
class(data$estu_cod_reside_mcpio)
class(pdet$CodigoMunicipio)

# 4.3. Crear un vector con los códigos de los municipios. 
# Un vector sirve para agrupar datos de un mismo tipo, en este caso los códigos de los municipios
c_pdet <- pdet$CodigoMunicipio

#4.4. Crear columna PDET
#if_else: Condicional. Si este valor en estu_cod_reside_mcpio está en c_pdet entonces 1, de lo contrario 0
data <- data %>%
  mutate(PDET = if_else(estu_cod_reside_mcpio %in% c_pdet, 1, 0))

# 5. Análisis de datos.
# 5.1. Verificar la clase de las variables y la normalidad de la muestra
class(data$punt_sociales_ciudadanas)
class(data$PDET)

ks.test(scale(data$punt_sociales_ciudadanas), "pnorm")

# 5.2.  Mann–Whitney U Test
# Se utiliza cuando se quiere comparar dos grupos y no se cumple el supuesto de normalidad.
U1<- wilcox.test(punt_sociales_ciudadanas ~ PDET, data = data)
U1

# 5.3 Gráficas
# 5.3.1. Instalar y llamar paquete
install.packages(ggplot2)
library(ggplot2)
?ggplot

#5.3.2. Hacer gráfico boxplot. 
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

# 6. 
