**Desempeño estudiantes PDET y NoPDET en Competencias Ciudadanas**

El presente repositorio tiene como finalidad contestar a la pregunta de investigación: ¿Los estudiantes PDET tienen un desempeño diferencial en la sección Competencias Ciudadanas respecto a los estudiantes NoPDET?

Competencias ciudadanas es una sección de las pruebas del Estado.  Su objetivo es medir la capacidad de los estudiantes para tomar decisiones más informadas como ciudadanos, a partir de sus conocimientos sobre ciencias sociales, la realidad social del país, las instituciones y los mecanismos de participación ciudadana (Palacios Mena, 2018).

El Programa de Desarrollo con Enfoque Territorial (PDET) fue diseñado en el marco del Acuerdo de Paz (2016) entre el gobierno y la guerrilla FARC-EP. Las 16 subregiones PDET cumplen con cuatro criterios: "i) los niveles de pobreza, en particular, de pobreza extrema y de necesidades insatisfechas; ii) el grado de afectación derivado del conflicto; iii) la debilidad de la institucionalidad administrativa y de la capacidad de gestión; y iv) la presencia de cultivos de uso ilícito y de otras economías ilegítimas" (Decreto 893 DE 2017).

**Análisis**

**Primer análisis:**
En este estudio se considera que los estudiantes pertenecientes a una subregión PDET pueden tener un desempeño diferencial en comparación con estudiantes NoPDET en la sección de Competencias Ciudadanas. Esto se debe a que la relación con la institucionalidad y el contexto en el que viven puede impactar la forma en que construyen su identidad ciudadana. Dicha identidad puede ir alineada o no con el discurso de ciudadanía neoliberal que se promueve dentro de la prueba (Palacios Mena, 2018). Para comprobar la idea se va a realizar un *Mann–Whitney U Test* para comparar las medias de los dos grupos (PDET y NoPDET). 

**Segundo Análisis:** 
En el segundo análisis se va a volver a comparar el desempeño entre el grupo PDET y el NoPDet, pero en este caso se va a incluir la Naturaleza del Colegio (Oficial/No Oficial) como variable interviniente. Esto se hace debido a que se considera que en Colombia existe un apartheid educativo, en donde las personas de clase alta y media están inscritas en colegios privados de alta calidad, mientras las personas de clase baja están inscritas en colegios oficiales de baja calidad (Corredor y Álvarez-Rivadulla, 2024). Lo anterior muestra que la naturaleza del colegio puede influir significativamente en los resultados obtenidos por los estudiantes, por lo que es importante incluirla como variable interviniente.

**Bases de datos utilizadas:**

**Examen_Saber_11_20242:**
Para este análisis se va a utilizar como base de datos principal "Examen_Saber_11_20242". Esta tiene los resultados de todos los estudiantes que presentaron el Examen Saber 11 en el período 2024-2. Por temas de peso, el archivo compartido en el repositorio solo incluye las variables generales de caracterización de estudiantes e instituciones educativas, y las correspondientes a Competencias Ciudadanas. Esto con el fin de poder cumplir con el rango de peso aceptado por GitHub.

**Variables:**

Para identificación del estudiante: estu_consecutivo

Demográficas: estu_genero, estu_etnia, estu_cod_reside_mcpio

Sección Competencias Ciudadanas: desemp_sociales_ciudadanas, percentil_sociales_ciudadanas, punt_sociales_ciudadanas.

Puntaje global: punt_global.

Tipo de colegio: cole_calendario, cole_naturaleza.

**Municipios_PDET_20260601:**
Como base de datos secundaria se va a utilizar "Municipios_PDET_20260601". Esta base de datos va a permitir crear los grupos de estudiantes PDET y NoPDET. 

**Variables:** 

Código del Municipio: CodigoMunicipio, esta se contrasta con estu_cod_reside_mcpio para crear la variable PDET.

**Referencias:**

Corredor, J., & Álvarez-Rivadulla, M. J. (2024). The Elephant in the (Class) Room: Cultural Capital as Personal Differences and College Segregation. *International Journal of Qualitative Studies in Education, 37*(10), 2926–2948. https://doi.org/10.1080/09518398.2024.2348777

Decreto 893 DE 2017 [Presidencia de la República de Colombia]. Por el cual se crean los Programas de Desarrollo con Enfoque Territorial -PDET.28 de mayo de 2016.

Palacios Mena, N. (2018). El Currículo de Ciencias Sociales y las Pruebas Saber 11 en Colombia: Consonancias y Disonancias. Voces Y Silencios. *Revista Latinoamericana De Educación, 9*(2), 80-106. https://doi.org/10.18175/vys9.2.2018.06 

**URls bases de datos:** 

Examen Saber 11 2024-2: https://icfesgovco.sharepoint.com/sites/BasesDataIcfes/Documentos%20compartidos/Forms/AllItems.aspx?id=%2Fsites%2FBasesDataIcfes%2FDocumentos%20compartidos%2F01%5FExamen%20Saber%2011%C2%B0%2F01%5FBases%20Nacionales&p=true&ga=1

Municipios PDET: https://www.datos.gov.co/Agricultura-y-Desarrollo-Rural/Municipios-PDET/idrk-ba8y/about_data
