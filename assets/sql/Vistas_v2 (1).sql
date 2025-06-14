use data_analysts;
-- Agrupar hombres y mujeres de la base de datos y contar cada grupo
CREATE OR REPLACE VIEW v_personas_por_sexo AS
SELECT count(sexo) AS cantidad_persona_por_sexo, sexo
FROM profesional
GROUP BY sexo;

-- Mostrar cuantas empresas tienen mas de 10.000 personas
CREATE OR REPLACE VIEW v_big_empresas AS
SELECT count(Tam_empresa) AS cantidad_por_empresa, Tam_empresa
FROM empresa
GROUP BY Tam_empresa
HAVING Tam_empresa LIKE '10001';

-- Profesionales que en alguna de sus experiencias tengan en el cargo el título "data"
CREATE OR REPLACE VIEW v_cargo_data AS
SELECT e.Id_prof, e.Titulo_car, p.Nombre, p.Apellido, em.Nom_empresa
FROM experiencia AS e
	INNER JOIN profesional AS p ON (e.Id_prof = p.Id_prof)
    INNER JOIN empresa AS em ON (e.Id_emp = em.Id_emp)
WHERE Titulo_car LIKE '%data%';

-- Profesionales que en su educación se encuentre la palabra "Ingeniería" o similar
CREATE OR REPLACE VIEW v_titulo_ing AS
SELECT *
FROM educacion
WHERE Titulo LIKE "%Ingen%";

-- Certificaciones que provienen de Udemy, Platzi,Coderhouse o Google y agruparlas para su conteo. Google tuvo una subdivisión respecto a Google, Google Active y Google Cloud Skill Boost
CREATE OR REPLACE VIEW v_cert_e_learning AS
SELECT count(Entidad), Entidad
FROM certificacion
WHERE Entidad IN ('Udemy','Platzi','Coderhouse') OR Entidad LIKE '%Google%'
GROUP BY Entidad
ORDER BY count(entidad) DESC;
