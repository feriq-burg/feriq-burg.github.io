---
layout: post
title: "Data Analyst en la Actualidad"
date: 2022-12-10
description: "Creación de base de datos en Mysql para analizar perfiles de analistas de datos de Linkedin en Chile"
tags: [MySQL, Web Scraping, Tableau ,LinkedIn, Early Project]
---

## Introducción
La digitalización abrió las puertas a nuevas herramientas, oportunidades y trabajos a los que miles de profesionales han logrado acceder a la industria TI, como por ejemplo, el análisis de datos o data analyst. Estas herramientas han dado la oportunidad de encontrar un cambio de profesión y propósito a muchas personas. Sin embargo, frente a la demanda de estos profesionales existen muchas ofertas para lograr esta capacitación y efectuar la transición a esta nueva era, siendo difícil encontrar un camino claro de cómo llegar a ser un analista  de datos.


## Notas del autor
Este proyecto se hizo en el año 2022 como primer paso hacía el análisis de datos. Para este momento se desconocían los programas como Phyton y Tableau, sin embargo se agregan unos gráficos para tener visualizaciones púlidas en el proyecto. Se utilizo webscrapping y una pequeña limpieza en excel ya que el objetivo del proyecto no era ese (se explica más abajo) 

## Objetivo
El objetivo de este proyecto es crear una base de datos relacional para analizar información de perfiles de LinkedIn que sean profesionales en el campo de analista de datos con el propósito de entender y establecer una ruta de aprendizaje que prepare al creador de esta base de datos para trabajar en el área de analista de datos  o sea un fuerte candidato a la hora de postular al cargo.

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

- 🏗️ [Script de creación de tablas](/assets/creacion_tablas_v1.sql)

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

Si bien se mecncioní que para la inserción de los datos se realizó a través de archivos csv debido a los requerimientos del proyecto se realizó a través de un back up.

📥 [Script de inserción de datos](/sql/bk_tablas_v2.sql)

<pre> ```LOCK TABLES `certificacion` WRITE;
/*!40000 ALTER TABLE `certificacion` DISABLE KEYS */;
INSERT INTO `certificacion` VALUES (1,1,'EF SET English Certificate 71/100 (C2 Proficient)EF SET English','EF','2022-08-01',NULL,'https://www.efset.org/cert/fJNfqQ'),(2,1,'Data, data, data everywhere','Coursera','2022-03-01',NULL,'https://www.coursera.org/account/accomplishments/certificate/9FSY6LMW5WZ3')``` </pre>












