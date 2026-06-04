El presente repositorio tiene como finalidad contestar a la pregunta de investigación: ¿Los estudiantes PDET tienen un desempeño diferencial en la sección Competencias Ciudadanas respecto a los estudiantes NoPDET?

Competencias ciudadanas es una sección de las pruebas del Estado.  Su objetivo es medir la capacidad de los estudiantes para tomar decisiones más informadas como ciudadanos, a partir de sus conocimientos sobre ciencias sociales, la realidad social del país, las instituciones y los mecanismos de participación ciudadana (Palacios Mena, 2018).

El Programa de Desarrollo con Enfoque Territorial (PDET) fue diseñado en el marco del Acuerdo de Paz (2016) entre el gobierno y la guerrilla FARC-EP. Las 16 subregiones PDET cumplen con cuatro criterios: i) los niveles de pobreza, en particular, de pobreza extrema y de necesidades insatisfechas; ii) el grado de afectación derivado del conflicto; iii) la debilidad de la institucionalidad administrativa y de la capacidad de gestión; y iv) la presencia de cultivos de uso ilícito y de otras economías ilegítimas (Decreto 893 DE 2017).

En este estudio se considera que los estudiantes pertenecientes a una subregión PDET pueden tener un desempeño diferencial en comparación con estudiantes NoPDET en la sección de Competencias Ciudadanas. Esto se debe a que la relación con la institucionalidad y el contexto en el que viven puede impactar la forma en que construyen su identidad ciudadana. Dicha identidad puede ir alineada o no con el discurso de ciudadanía neoliberal que se promueve dentro de la prueba (Palacios Mena, 2018).


Bases de datos utilizadas:

Para este análisis se va a utilizar como base de datos principal "Examen_Saber_11_20242". Esta tiene los resultados de todos los estudiantes que presentaron el Examen Saber 11 en el período 2024-2. Por temas de peso, el archivo compartido en el repositorio solo incluye las variables generales de caracterización de estudiantes e instituciones educativas, y las correspondientes a Competencias Ciudadanas. Esto con el fin de poder cumplir con el rango de peso aceptado por GitHub.

Variables Examen_Saber_11_20242:

Para identificación del estudiante: estu_consecutivo

Demográficas: estu_genero, estu_etnia, estu_cod_reside_mcpio

Sección Competencias Ciudadanas: desemp_sociales_ciudadanas, percentil_sociales_ciudadanas, punt_sociales_ciudadanas.

Puntaje global: punt_global.

Tipo de colegio: cole_calendario, cole_naturaleza.

Como base de datos secundaria se va a utilizar "Municipios_PDET_20260601". Esta base de datos va a permitir crear los grupos de estudiantes PDET y NoPDET. 

Variables Municipios_PDET_20260601: 

Código del Municipio: CodigoMunicipio, esta se contrasta con estu_cod_reside_mcpio para crear la variable PDET.

URls para descargar bases de datos: 

Examen Saber 11 2024-2: https://icfesgovco.sharepoint.com/sites/BasesDataIcfes/Documentos%20compartidos/Forms/AllItems.aspx?id=%2Fsites%2FBasesDataIcfes%2FDocumentos%20compartidos%2F01%5FExamen%20Saber%2011%C2%B0%2F01%5FBases%20Nacionales&p=true&ga=1

Municipios PDET: https://www.datos.gov.co/Agricultura-y-Desarrollo-Rural/Municipios-PDET/idrk-ba8y/about_data
