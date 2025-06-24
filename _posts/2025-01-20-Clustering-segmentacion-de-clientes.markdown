---
layout: post
title: "Segmentación de Clientes con Clustering en FreshMart"
date: 2025-01-20
img: cov_img_clust.jpg
excerpt: "Segmentación de clientes mediante RFM y algoritmos de clustering para personalizar la estrategia de marketing de un supermercado."
tags: [Segmentación, Clustering] # add tag
---

## Índice

- [Contexto del Problema](#contexto-del-problema)
- [Objetivos de Negocio](#objetivos-de-negocio)
- [Exploración y Preparación de los Datos](#exploración-y-preparación-de-los-datos)
- [Transformación de Variables (RFM)](#ingeniería-de-variables-rfm)
- [Análisis](Análisis)
- [Clustering y Evaluación](#clustering-y-evaluación)
- [Segmentos y Conclusiones](#segmentos-y-conclusiones)
- [Repositorio del Código](#repositorio-del-código)

## Contexto del problema

FreshMart busca entregar una experiencia personalizada a sus clientes y para ello necesita identificar los diferentes segmentos que se encuentran en su cartera de negocios, es por ello que se utilizarán técnicas de aprendizaje no supervisado para agrupar perfiles según sus patrones de compra. La base de datos contiene información a nivel de boleta de un año del supermercado FreshMart.

## Objetivos de Negocio

- Agrupar clientes en segmentos accionables y diferenciables.
- Comprender hábitos de compra, frecuencia y gasto de cada grupo.
- Facilitar la generación de campañas personalizadas de marketing para cada segmento.

## Exploración y preparación de los datos

- [📁 Dataset del proyecto](Retail_Invoices.xlsx)

  Las definiciones de las variables representan la siguiente información

- InvoiceNo: Nro identificador de cada boleta
- InvoiceDate: Fecha de la boleta
- CustomerId: Nro identificador de cada usuario
- Quantity: Cantidad de unidades totales compradas
- price_total: Precio total de la boleta
- StockCode: Cantidad de unidades diferentes compradas

La información en un inicio se encuentra distribuida de la siguiente manera:

![Alt text](/assets/img/seg/df_head.jpg)

Durante la investigación del dataset se encontraron facturas con el prefijo C. Estos valores en cantidad y precio total presentan un número negativo. La anomalía puede tratarse por varias razones como devoluciones de productos o correciones en el stock o inventario. Sin embargo, debido a la inexactitud de la pertenencia de estos valores, se opta por eliminarlos aunque representen el 16% del dataset. Se debe agregar que es importante monitorear su comportamiento y estado a lo largo del tiempo ya que puede representar un motivo de análisis e investigación para corregir estos eventos ya sea una mala práctica de inventario o mala calidad del producto si se refiere a devoluciones.

(mostrar los datos que tienen el prefijo de C)


![Alt text](/assets/img/seg/df_c_val.jpg)


## Transformación de Variables (RFM)

Como se mencionó más arriba la distribución del dataset se encuentra a nivel de facturas y el objetivo del proyecto es analizar y segmentar los clientes del supermercado de FreshMart, es por ello que se realizará una transformación en la distribución del dataset por CustomerID agregando las variables última compra, frecuencia de compra (cantidad de veces que el cliente decidió comprar), promedio de artículos adquiridos, artículos totales comprados, promedio del monto de compra, monto total de compra y promedio de artículos distintos comprados. La tabla quedo de la siguiente manera:


![Alt text](/assets/img/seg/rmf.jpg)

## Análisis

En lo que respecta a la distrubución de los datos finalmente tenemos información de aproximadamente 4000 clientes durante un año calendario del supermercado FreshMart. A pesar de haber eliminado valores atípicos usando el rango intercuartil, siguen presentándose valores fuera de la norma en las variables cuantitativas como se muestra en el gráfico de más abajo.

![Alt text](/assets/img/seg/EDA.jpg)

Aquí se muestran las correlaciones existentes a lo largo del dataset de las variables cuantitativas.

![Alt text](/assets/img/seg/cor.jpg)

## Clustering y Evaluación

Respecto a los algoritmos de clustering y evaluación se proceden a utiizar dos algoritmos; el primero de ellos es K-means; y el segundo es Fuzzy C-means debido a que todas las variables se presentan en formato cuantitativo y no se presenta información cualitativa que impida el uso de ambos modelos. 

Debido a que ambos algoritmos son sensibles a la inicialización se procede a utlizar un rango preajustado de clusters entre 2-11 para luego calcular las metricas de Silhouette, Davies_bouldin y el método del codo para su posterior visualización con el fin de determinar el óptimo número de clusters para el dataset en ambos modelos.


![Alt text](/assets/img/seg/k_m_f.jpg)

Arriba se muestran los tres gráficos del algoritmo K-means. Tanto Silhouette como Davies-Bouldin muestran que el óptimo número de clusters para el modelo son 4 clusters por lo que se procede instanciar con 4 clusters.

![Alt text](/assets/img/seg/clus_k_m.jpg)

Respecto a la visualización de más arriba se destaca el uso de reducción de dimensionalidad a través de PCA para la visualización. Los resultados de las metricas de Silhouette y Davies-Bouldin son las siguientes:

- K-Means Silhouette Score: 0.35010922125461674
- K-Means Davies Bouldin Score: 0.9688725504594399


![Alt text](/assets/img/seg/f_c_f.jpg)

El gráfico de arriba muestra el cálculo ideal de clusters para fuzzy c-means con un valor de m de 1.4 muy cercano a 1, es decir, una división un poco rígida casi similar a K-means.

![Alt text](/assets/img/seg/clus_f_m.jpg)

Similar a K-means se utilizo PCA para la visualización y los resultados de las métricas para Fuzzy C-means son las siguientes.

- Fuzzy C-Means Silhouette Score: 0.34022744188059084
- Fuzzy C-Means Davies Bouldin Score: 1.0839801221997591

## Segmentos y conclusiones

Para la segmentación y conclusiones traemos a la palestra los resultados de las metricas para K-means y Fuzzy C-means. Dentro de estos resultados podemos obtener los siguientes.

- K-Means Silhouette Score: 0.35010922125461674
- K-Means Davies Bouldin Score: 0.9688725504594399

- Fuzzy C-Means Silhouette Score: 0.34022744188059084
- Fuzzy C-Means Davies Bouldin Score: 1.0839801221997591

Observando los valores de Silhouette y Davies-Bouldin se concluye que K-means tiene un mejor resultado para los clusters del dataframe que Fuzzy C-means, sin embargo, estos valores no son perfectos y hay oportunidad de mejora. Si bien tenemos 4000 registros, se recomienda recopilar más información respecto a nuevos y actuales clientes por al menos otro año, además considerar agregar mas atributos como la categoría de productos que se adquieren.

A continuación habiendo elegido K-means como mejor modelo se procede a realizar la segmentación de estos clientes acorde a sus características.

### Clientes ocasionales

Con una frecuencia de compra baja comparada al resto de segmentos al igual que el total de compra y cantidad de productos, estos clientes se presentan como un tipo de compradores ocasionales que visitan la zona o se encuentran de paso hacia un destino en particular. Este número de clientes es el más alto lo que puede indicar que la geolocalización del supermercado es cercana a algún lugar turístico o cercano a un lugar donde se suele reunir una gran cantidad de gente por periodos estacionales durante la temporada. Todo esto considerando que la separación entre clusters es muy baja. Considerando la información anterior, sería de gran utlilidad para un futuro análisis saber si el supermercado es cercano a algún lugar turístico o frecuenta gran cantidad de personas de ser así, en fechas donde hay una gran afluencia de personas, generar eventos de activación de marca presenciales y a través de las redes sociales. Aunque se debe considerar que es peligroso que la mayor cantidad de clientes sea de este tipo.


### Buscadores de ofertas

Con una frecuencia de compra similar a los clientes ocasionales pero un significativo aumento en la cantidad de productos, compra total y la compra de productos diferentes mas alta del segmento , estos clientes se pueden clasificar como buscadores de ofertas. Estos clientes aparecen en cambios de temporada, renovación de stock de productos electrodomésticos (si es que el supermercado ofrece), ropa, entre otros. Como bien lo dice el nombre estos clientes buscan ofertas en periodos específicos del año como por ejemplo, en Chile exista una migración por parte de Argentinos debido a que los precios a productos electrodomésticos son más baratos en nuestro país. La estrategia que se pude tomar con este tipo de clientes es ofrecer descuentos en volumenes de productos y promociones por tiempo limitado si es que el negocio e identidad del supermercado hace fit con esta estrategia.


### Clientes Fieles

En el cluster número 3 tenemos clientes que tienen el segundo monto total más alto, presentan una media de 15 visitas al supermercado al año y un gasto promedio de 330. Se clasificarían como los compradores regulares o fieles que abastecen todas sus necesidades con aproximadamente una visita por mes al supermercado. A nivel general no solo en este segmento lo que se puede hacer es crear un programa de fidelización que permita ofrecer a todos los clientes acorde a sus comportamientos de compra las mejores ofertas.


### Outliers

Encontramos en el cluster numero 2, 9 elementos que sobresalen de toda norma y medio, se van totalmente al extremo en cantidades compradas y totales lo que recibiran el nombre de Outliers, sera interesante investigar mas sobre estos 9 clientes ya que puede deberse a que por su comportamiento de compra se pueda tratar de negocios minoristas que se mueven a un supermercado central (teoría de geolocalización) para comprar y vender en zonas más alejadas a lugares con una gran afluencia de clientes. Si la filosofía e identidad del supermercado condice, se puede tomar una perspectiva colaborativa y ofrecer el despacho de estos productos a los revendedores o comerciantes si es que se desea fidelizar y ofrecer un servicio completo pudiendo abarcar mas zonas y atraer posibles nuevos comerciantes.


## Repositorio del Código

Abajo se encuentra nuevamente el dataset del proyecto así como tambien el código y ejecución de los algoritmos.

- [📁 Dataset del proyecto](assets/cluster/Retail_Invoices.xlsx)
- [🗃️ Implementación del algoritmo](assets/cluster/Clustering.ipynb)



