---
layout: post
title: "Data Analyst en la Actualidad"
date: 2023-12-10
img: how-to-start.jpg # Add image post (optional)
description: "Creación de base de datos en Mysql para analizar perfiles de analistas de datos de Linkedin en Chile"
tags: [MySQL, Web Scraping, Tableau ,LinkedIn, Early Project]
excerpt: "Creación de una base de datos relacional y desarrollo de objetos que permitan su mantenimiento sobre perfiles de analistas de datos en LinkedIn en Chile para su posterior análisis."

---

## Indice del proyecto

- [Introducción](#introducción)
- [Notas del autor](#notas-del-autor)
- [Objetivo](#objetivo)
- [Modelo de Negocios](#modelo-de-negocios)
- [Diagramas](#diagramas)
  - [Diagrama entidad-relación conceptual](#Diagrama-entidad-relación-conceptual)
  - [Diagrama entidad-relación técnico](#Diagrama-entidad-relación-técnico)
- [Tablas](#tablas)
 - [Descripción de Tablas](#descripción-de-tablas)
 - [Inserción de Tablas](#inserción-de-tablas)
- [Inserción de Datos](#inserción-de-datos) 
- [Vistas SQL](#vistas)
- [Funciones](#funciones)
- [Stored Procedures](#stored-procedures)
- [Triggers](#triggers)
- [Análisis](#análisis)
- [Herramientas usadas](#herramientas-usadas)
- [Futuras Líneas](#Futuras-Líneas)
- [Apartado del código](#Apartado-del-código)


## Introducción
La digitalización abrió las puertas a nuevas herramientas, oportunidades y trabajos a los que miles de profesionales han logrado acceder a la industria TI, como por ejemplo, el análisis de datos o data analyst. Estas herramientas han dado la oportunidad de encontrar un cambio de profesión y propósito a muchas personas. Sin embargo, frente a la demanda de estos profesionales existen muchas ofertas para lograr esta capacitación y efectuar la transición a esta nueva era, siendo difícil encontrar un camino claro de cómo llegar a ser un analista  de datos.


## Notas del autor
Este proyecto se hizo en el año 2022 como primer paso hacía el análisis de datos. Para este momento se desconocían los programas como Phyton y Tableau, así como tambien los procesos de limpieza de datos, sin embargo, se agregan unos gráficos para tener visualizaciones púlidas en el proyecto hechos en tableau que por limitantes de github pages no puede ser embedido sino son imágenes. Se utilizo webscrapping para la obtención de los datos.

Todos los datos personales han sido anonimados para proteger la privacidad de las personas. Los nombres y apellidos han sido truncados y los enlaces directos (como URLs de certificaciones) clasificados como nulos. Este proyecto tiene fines exclusivamente educativos.

## Objetivo
El objetivo de este proyecto es crear una base de datos relacional y desarrollar objetos que permitan su mantenimiento basada en un modelo de negocios. La base de datos contiene información de perfiles de LinkedIn que sean profesionales en el campo de analista de datos con el propósito de entender y establecer una ruta de aprendizaje que prepare al creador de esta base de datos para trabajar en el área de analista de datos o sea un fuerte candidato a la hora de postular al cargo.

## Modelo de Negocios
La base de datos deberá contener la siguiente información:
- Información real de profesionales que se encuentren en la plataforma de LinkedIn y no se encuentren como conexión directa del creador de la base de datos.
- Estos profesionales deberán haber tenido al menos una experiencia como analista de datos, data analyst o perfil que cumpla similares características.
- Debe estar registrada tanto esa experiencia en su totalidad y otra más ya sea la siguiente al cargo o la antigua siendo el caso de el cargo de analista sea la más reciente.
- La experiencia proviene de una empresa, por lo que la empresa debe ser registrada indicando el tamaño de la empresa y la industria de estar disponible.
- Debe tener al menos dos registros de educación, idealmente no contar los estudios de enseñanza media (14-18 años de edad).
- Debe tener un registro máximo de tres certificaciones de tenerlas indicando la entidad y el nombre de dicha certificación y su fecha de caducidad de tenerla. 

## Diagramas
### Diagrama entidad-relación conceptual

![Alt text](/assets/img/der_conceptual.jpg)

### Diagrama entidad-relación técnico

![Alt text](/assets/img/der_técnico.png)

## Tablas

### Descripción de tablas

#### Tabla: Log_prof

| Campo      | Descripción                           | Clave Primaria | Clave Foránea | Otros       | Tipo de Dato |
|------------|---------------------------------------|----------------|---------------|-------------|--------------|
| Id_prof    | Identificador del profesional         |                |               | NN          | int          |
| Nombre     | Nombres Profesional                   |                |               |             | varchar(50)  |
| Apellido   | Apellidos Profesional                 |                |               |             | varchar(50)  |
| Sexo       | Masculino o Femenino                  |                |               |             | varchar(2)   |
| Codigo     | País residencia profesional           |                |               |             | varchar(3)   |
| User_mod   | Usuario a cargo de la modificación    |                |               | NN          | varchar(20)  |
| Tipo_mod   | Insert, delete, update                |                |               |             | varchar(20)  |
| Date_mod   | Fecha y hora de la modificación       |                |               |             | datetime     |

#### Tabla: Log_exp

| Campo      | Descripción                              | Clave Primaria | Clave Foránea | Otros       | Tipo de Dato |
|------------|------------------------------------------|----------------|---------------|-------------|--------------|
| Id_exp     | Identificador de experiencia             |                |               | NN          | int          |
| Id_prof    | Identificador del profesional            |                |               |             | int          |
| Titulo_car | Cargo de la experiencia                  |                |               |             | varchar(100) |
| Id_emp     | Identificador de empresa                 |                |               |             | int          |
| Fecha_in   | Fecha de inicio de la experiencia        |                |               |             | date         |
| Fecha_en   | Fecha de término de la experiencia       |                |               |             | date         |
| Estado     | 1 = experiencia previa; 2 = reciente     |                |               | NN          | int          |
| User_mod   | Usuario a cargo de la modificación       |                |               | NN          | varchar(20)  |
| Tipo_mod   | Insert, delete, update                   |                |               |             | varchar(20)  |
| Date_mod   | Fecha y hora de la modificación          |                |               |             | datetime     |

#### Tabla: Profesional

| Campo    | Descripción                        | Clave Primaria | Clave Foránea | Otros       | Tipo de Dato |
|----------|------------------------------------|----------------|---------------|-------------|--------------|
| Id_prof  | Identificador del profesional      | ✅              |               | AI, NN       | int          |
| Nombre   | Nombres Profesional                |                |               | NN          | varchar(50)  |
| Apellido | Apellidos Profesional              |                |               | NN          | varchar(50)  |
| Sexo     | Masculino o Femenino               |                |               |             | varchar(1)   |
| Codigo   | País residencia profesional        |                | ✅             | NN          | varchar(3)   |

#### Tabla: Educacion

| Campo     | Descripción                            | Clave Primaria | Clave Foránea | Otros | Tipo de Dato |
|-----------|----------------------------------------|----------------|---------------|-------|--------------|
| Id_ed     | Número identificador de educación      | ✅              |               | AI, NN| int          |
| Id_prof   | Identificador del profesional          |                | ✅             | NN    | int          |
| Institucion | Nombre de la institución             |                |               |       | varchar(100) |
| Titulo    | Nombre del grado académico             |                |               |       | varchar(150) |
| Año_ing   | Año de ingreso                         |                |               |       | date         |
| Año_egr   | Año de egreso                          |                |               |       | date         |

#### Tabla: Experiencia

| Campo      | Descripción                            | Clave Primaria | Clave Foránea | Otros | Tipo de Dato |
|------------|----------------------------------------|----------------|---------------|-------|--------------|
| Id_exp     | Identificador de experiencia           | ✅              |               | AI, NN| int          |
| Id_prof    | Identificador del profesional          |                | ✅             | NN    | int          |
| Titulo_car | Cargo de la experiencia                |                |               | NN    | varchar(100) |
| Id_emp     | Identificador de empresa               |                | ✅             |       | int          |
| Fecha_in   | Fecha de inicio                        |                |               |       | date         |
| Fecha_en   | Fecha de término                       |                |               |       | date         |
| Estado     | 1 = experiencia previa; 2 = reciente   |                |               | NN    | int          |

#### Tabla: Certificacion

| Campo     | Descripción                             | Clave Primaria | Clave Foránea | Otros | Tipo de Dato |
|-----------|-----------------------------------------|----------------|---------------|-------|--------------|
| Id_cert   | Identificador de certificación          | ✅              |               | AI, NN| int          |
| Id_prof   | Identificador del profesional           |                | ✅             | NN    | int          |
| Nom_cert  | Nombre de la certificación              |                |               |       | varchar(90)  |
| Entidad   | Entidad que emite la certificación      |                |               |       | varchar(90)  |
| Fecha_emi | Fecha de emisión                        |                |               |       | date         |
| Fecha_venc| Fecha de vencimiento                    |                |               |       | date         |
| Url       | Link a la certificación (si aplica)     |                |               |       | text         |

#### Tabla: Pais

| Campo  | Descripción        | Clave Primaria | Clave Foránea | Otros | Tipo de Dato |
|--------|--------------------|----------------|---------------|-------|--------------|
| Codigo | Código del país    | ✅              |               | NN    | varchar(3)   |
| Nombre | Nombre del país    |                |               |       | varchar(50)  |

#### Tabla: Empresa

| Campo       | Descripción                         | Clave Primaria | Clave Foránea | Otros | Tipo de Dato |
|-------------|-------------------------------------|----------------|---------------|-------|--------------|
| Id_emp      | Identificador de empresa            | ✅              |               | AI, NN| int          |
| Nom_empresa | Nombre de la empresa                |                |               |       | varchar(60)  |
| Industria   | Rubro o especialización             |                |               |       | varchar(60)  |
| Tam_empresa | Tamaño de la empresa (e.g. 11-50)   |                |               |       | varchar(20)  |


### Inserción de tablas 

🏗️ [Script de creación de tablas](/assets/sql/creacion_tablas_v1.sql)

<pre> ```CREATE DATABASE data_analysts;
USE data_analysts;

-- Crear tabla Profesional
CREATE TABLE Profesional (
Id_prof INT AUTO_INCREMENT NOT NULL,
Nombre VARCHAR(50) NOT NULL,
Apellido VARCHAR(50) NOT NULL,
Sexo VARCHAR(1),
Codigo VARCHAR(3) NOT NULL,
PRIMARY KEY (Id_prof) 
);``` </pre>


## Inserción de datos

Si bien se mencionó que para la inserción de los datos se realizó a través de archivos csv debido a los requerimientos del proyecto se realizó a través de un back up.

📥 [Script de inserción de datos](/assets/sql/v4_bk_inserción_datos)

<pre> ```LOCK TABLES `certificacion` WRITE;
/*!40000 ALTER TABLE `certificacion` DISABLE KEYS */;
INSERT INTO `certificacion` VALUES (1,1,'EF SET English Certificate 71/100 (C2 Proficient)EF SET English','EF','2022-08-01',NULL,NULL),(2,1,'Data, data, data everywhere','Coursera','2022-03-01',NULL,NULL)``` </pre>


## Vistas

A continuación se presentan las 5 vistas realizadas:

- v_personas_por_sexo:  Muestra la relación entre hombres y mujeres que se encuentran en la base de datos.

- v _big_ companies: Muestra la cantidad de empresas que son mayores a 10.000 empleados.

- v_ cargo _data: Muestra la cantidad de experiencias en la que aparece el título de “data”.

- v_titulo_ing: Muestra profesionales que tengan como educación algún grado de Ingeniería.

- v_cert_e_learning: Muestra las certificaciones que pertenecen a las plataformas de aprendizaje no tradicionales como Platzi, Udemy, Coderhouse.

👁️ [Vistas SQL](/assets/sql/Vistas_v2.sql)

## Funciones

- f_prof_nomb_exp: Se inserta algún ID de profesional existente y retorna su nombre y su cargo que se encuentre en estado = 2 de la tabla experiencia.

🧠 [Funcion Nombre-Experiencia](/assets/sql/F_prf_nomb_expv3.sql)

- f_nomb_tam_emp: La función solicita un ID de empresa y retorna el nombre y la cantidad de personas que trabajan en la empresa.

🧠 [Funcion Nombre-Tamaño](/assets/sql/F_nomb_tam_empv2.sql)

## Stored Procedures

- sp_orden_educacion: Ordena la tabla educación acorde al parámetro que selecciones dentro de la tabla.

⚙️ [Stored Procedure Orden Educación](/assets/sql/SP_order_byv2.sql)

- sp_in_prof: El procedimiento se encarga de insertar un nuevo profesional.

⚙️ [Stored Procedure Nuevo Profesional](/assets/sql/SP_in_newprof_v3.sql)

## Triggers

- Tr_ins_prof: El trigger se encarga de registrar en la tabla Log_prof cada vez que se inserta un nuevo profesional indicando el usuario que lo hizo y la fecha así como los datos del profesional.

🔔 [Triggers Historial inserción](/assets/sql/trigger_profesional_insert.sql)


- Tr_mod_exp: El trigger se encarga de notificar cada modificación que se haga en la tabla de experiencia y se registra en la tabla Log_exp tanto el nuevo y antiguo registro.

🔔 [Triggers Modificación experiencia](/assets/sql/trigger_experiencia_update.sql)

## Análisis

Los tres primeros gráficos fueron creados en Tableau Public, sin embargo, como se mencionó más arriba por limitantes de github pages no puede ser embedido.

![Alt text](/assets/img/tableau/genero.jpg)

Respecto a la distribución por género podemos visualizar que la mayoría esta establecida por hombres superando el 65% del total de profesionales.


![Alt text](/assets/img/tableau/tamaño_empresa.jpg)

En lo que respecta a las empresas según tamaño, las grandes empresas son las que destacan en lo que respecta a la base de datos sin embargo no presenta un orden decreciente, es decir, las empresas mas grandes son las que más se repiten, sino que sorprende la presencia de empresas entre 11-50 colaboradores en el 4° lugar. Al parecer otros factores inciden en la necesidad de estos profesionales aparte del tamaño.

![Alt text](/assets/img/tableau/rubro.jpg)

En el rubro sorprende el rubro de la educación liderando con 10 empresas, ignnorando los 16 valores nulos, en conjunto con servicios financieros, seguidos de retail, banca y logística. En lo que respecta al rubro de educación destacan las universidades tradicionales y 1 startup de educación tecnológica.




<body>
    <table class="data-table">
        <thead>
            <tr>
                <th>Institución</th>
                <th>Cantidad</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>Pontificia Universidad Católica de Chile</td>
                <td>15</td>
            </tr>
            <tr>
                <td>Universidad del Desarrollo</td>
                <td>12</td>
            </tr>
            <tr>
                <td>Universidad Adolfo Ibáñez</td>
                <td>11</td>
            </tr>
            <tr>
                <td>Universidad de Chile</td>
                <td>11</td>
            </tr>
            <tr>
                <td>Universidad de Valparaíso</td>
                <td>9</td>
            </tr>
            <tr>
                <td>Universidad Técnica Federico Santa María</td>
                <td>7</td>
            </tr>
            <tr>
                <td>Universidad de Santiago de Chile</td>
                <td>6</td>
            </tr>
            <tr>
                <td>Pontificia Universidad Católica de Valparaíso</td>
                <td>6</td>
            </tr>
            <tr>
                <td>Universidad Andrés Bello</td>
                <td>6</td>
            </tr>
        </tbody>
    </table>
</body>


Respecto a las instituciones educativas más populares por los profesionales se destacan la Pontifica Universidad Católica de Chile, Universidad del Desarrollo, Universidad Adolfo ibañez y Universidad de Chile.

Es importante destacar que el top 1, La Pontificia Universidad Católica de Chile también es clasificada como la mejor universidad de Chile en el puesto 121 mundial según QS World University Rankings 2023: Top global universities. (https://www.topuniversities.com/world-university-rankings/2023?countries=cl)



<body>
    <table class="data-table">
        <thead>
            <tr>
                <th>Carrera</th>
                <th>Cantidad</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>Ingeniería Comercial</td>
                <td>27</td>
            </tr>
            <tr>
                <td>Ingeniería Civil Industrial</td>
                <td>18</td>
            </tr>
            <tr>
                <td>Otras Ingenierías</td>
                <td>19</td>
            </tr>
        </tbody>
    </table>
</body>



Dentro de los estudios de pregrado las carreras mas populares son las ingenierías, especificamente comercial y civil industrial seguido del resto de ingenierías como Ingeniero Agrónomo o Ingeniero en Minas, destacan campos como Publicistas, un geologo y un abogado.





<body>
    <table class="data-table">
        <thead>
            <tr>
                <th>Estudio</th>
                <th>Cantidad</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>Diplomados ciencia de datos o analitica</td>
                <td>14</td>
            </tr>
            <tr>
                <td>Master en ciencia de datos, AI o analítica</td>
                <td>8</td>
            </tr>
            <tr>
                <td>Master en economía y Negocios</td>
                <td>5</td>
            </tr>
        </tbody>
    </table>
</body>



En lo que respecta a postgrados destacamos los diplomados en datos o relacionados por sobre un máster en cualquier otro tipo ya sean MBA's o relacionado a datos.




Las certificaciones son un modelo de enseñanza más disruptivo que posee barreras de entrada más accesibles por costos y admisión. Las entidades más populares que imparten estas certificaciones son:


<body>
    <table class="data-table">
        <thead>
            <tr>
                <th>Institución</th>
                <th>Cantidad</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>Udemy</td>
                <td>14</td>
            </tr>
            <tr>
                <td>Coursera</td>
                <td>13</td>
            </tr>
            <tr>
                <td>Google</td>
                <td>13</td>
            </tr>
            <tr>
                <td>LinkedIn</td>
                <td>11</td>
            </tr>
            <tr>
                <td>Desafío Latam</td>
                <td>10</td>
            </tr>
            <tr>
                <td>Escuela de Postgrado y Educación Continua FCFM Universidad de Chile</td>
                <td>6</td>
            </tr>
            <tr>
                <td>Platzi</td>
                <td>6</td>
            </tr>
        </tbody>
    </table>
</body>


Dentro de las certificaciones más buscadas se encuentran las siguientes

| Certificación | Cantidad | 
|---------------|----------|
| Power BI      | 18 |
| Python        | 16 |
| SQL           | 10 | 
| Inglés        | 10 |
| Excel         | 5  |


La siguiente tabla muestra algunos profesionales con su cargo anterior y actual con el objetivo de entender cuál sería el siguiente paso profesional que toman aquellos profesionales que trabajan como analista de datos:

| Nombre | Apellido | Cargo anterior                                        | Cargo actual                                                  | Empresa anterior                           | Empresa actual                                | Fin cargo anterior | Inicio cargo actual |
|--------|----------|--------------------------------------------------------|----------------------------------------------------------------|--------------------------------------------|------------------------------------------------|--------------------|----------------------|
| Kar    | Cam      | Analista de Datos y Licitaciones                      | Ingeniero de Machine Learning y Desarrollo de Inteligencia Artificial Generativa | Universidad del Desarrollo                | Universidad del Desarrollo                     | 2022-10-06         | 2023-08-01           |
| Mar    | Alb      | Analista de Datos Área Comercial                      | Senior Business Development Representative                     | Finning                                    | Finning                                        | 2023-05-01         | 2023-05-01           |
| Gon    | Día      | Práctica Analista de Datos                            | Analista de datos                                              | Xepelin                                    | Xepelin                                        | 2022-02-01         | 2022-03-01           |
| Dan    | Bra      | Data Analyst                                          | Data Engineer                                                  | ChileCompra                                | ChileCompra                                    | 2023-07-01         | 2023-07-01           |
| Cat    | Sal      | Data Analyst                                          | International Business Development Representative             | University of Oxford                       | Pontificia Universidad Católica de Chile       | 2020-09-01         | 2022-04-01           |
| Alv    | Mun      | Data Analyst - Customer Experience                    | Project Engineer_Customer Experience                           | Wird.                                      | Wird.                                          | 2023-10-06         | 2022-04-01           |
| Jos    | Jab      | Analista de datos                                     | Business Analyst                                               | Liberty Seguros Andes                      | Desis Limitada - Facturación.cl                | 2023-06-01         | 2023-07-01           |
| Car    | Ort      | Tutor de Sucursal - Analista de Datos                 | Python Developer y Analista de Datos                           | BIWISER                                    | Servicios Financieros - Lider BCI              | 2021-01-01         | 2021-02-01           |
| Rod    | Roj      | Analista de datos                                     | Analista BI                                                    | Grupo Unicomer / Unicomer Group            | SMU S.A. (Unimarc, M10, Alvi, Ok Market y Super10) | 2023-02-01         | 2023-02-01           |
| Jos    | Qui      | Analista de Datos y Procesos Post Venta              | DATA ANALYST                                                   | Caja Los Andes                             | BCI Seguros                                    | 2021-07-01         | 2021-07-01           |
| Pau    | Aed      | Analista de datos                                     | Data Analyst                                                   | Cenabast                                   | Walmart Chile                                  | 2022-06-01         | 2022-07-01           |
| Ale    | Fon      | Analista de datos e información                       | Product Owner                                                  | Colegio de Ingenieros de Chile             | Colegio de Ingenieros de Chile                 | 2023-05-01         | 2023-06-01           |
| Con    | Cis      | Analista de datos                                     | Configuration & Data Analyst                                   | Automotores Gildemeister SpA              | REWORTH                                       | 2023-02-01         | 2023-03-01           |
| Fra    | Opo      | Data Analyst                                          | Analista Business Intelligence                                 | Enfoca Digital                             | Walmart Chile                                  | 2023-05-01         | 2023-08-01           |
| Jes    | Mas      | Analista de Datos - Business intelligence analyst     | Científico de datos - Modelador Estadístico                   | Cencosud Scotiabank                         | Cencosud S.A.                                   | 2021-12-01         | 2021-12-01           |



## Herramientas usadas

- LinkedIn: Si bien no es una herramienta,  es la fuente de donde se extrajo toda la información y gracias a esta se elaboró la base de datos.
- Miro: En esta aplicación se realizó el diagrama entidad relación conceptual.
- Phantom Buster: Software que ayudó en hacer web scraping en la página de LinkedIn.
- Google spreadsheets: Se realizó el proceso de preparación y limpieza de la base de datos antes de ser importada a mysql. Además de los gráficos.
- Excel: Luego de unos inconvenientes con las fechas se decidió utilizar excel para importar a mysql.
- MySql Workbench: Creación e implementación de la base de datos.
- Tableau Public: Utilizado para actualizar los gráficos en el apartado de análisis

## Futuras Líneas

A continuación se presentarán una serie de futuros lineamientos que no presentan un orden en particular relacionado a la base de datos presente y futuras bases de datos.
- Para futuras bases de datos sería recomendable utilizar un solo idioma, preferentemente en inglés, no desde la información, sino el nombre de los objetos y sus descripciones.
- En la tabla de educación, similar a lo que fue con experiencia, agregar un estado de 1 y 2 y eliminar las personas que agregaron enseñanza media y buscar más estudios superiores como postgrados para nutrir más el análisis.
- Agregar al menos tres experiencias, una pasada, la de analista de datos y sí existe una futura, con el propósito de visualizar cual es el siguiente paso de los analistas de datos y de donde vienen si es que hicieron un cambio de profesión en todos los profesionales.
- En lo que respecta a funciones, stored procedures y triggers establecen alertas o mensajes de error cuando se inserta información no deseada. 
- Respecto al proceso de análisis persé es necesario buscar una muestra representativa o al menos de un número más elevado, para poder realizar una efectiva limpieza de información irelevante, y corregir signos que la base de datos no es capaz de entender por ejemplo las tildes.
  

## Apartado del código

Sección que agrupa los códigos mostrados a lo largo del proyecto.

- 🏗️ [Script de creación de tablas](/assets/sql/creacion_tablas_v1.sql)
- 📥 [Script de inserción de datos](/assets/sql/v4_bk_inserción_datos)
- 👁️ [Vistas SQL](/assets/sql/Vistas_v2.sql)
- 🧠 [Funcion Nombre-Experiencia](/assets/sql/F_prf_nomb_expv3.sq)
- 🧠 [Funcion Nombre-Tamaño](/assets/sql/F_nomb_tam_empv2.sql)
- ⚙️ [Stored Procedure Orden Educación](/assets/sql/SP_order_byv2.sql)
- ⚙️ [Stored Procedure Nuevo Profesional](/assets/sql/SP_in_newprof_v3.sql)
- 🔔 [Triggers Historial inserción](/assets/sql/trigger_profesional_insert.sql)
- 🔔 [Triggers Modificación experiencia](/assets/sql/trigger_experiencia_update.sql)
  





