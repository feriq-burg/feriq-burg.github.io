USE `data_analysts`;
DROP procedure IF EXISTS `sp_in_prof`;

-- El stored procedure te permite ingresar un nuevo profesional
DELIMITER $$
USE `data_analysts`$$
CREATE PROCEDURE `sp_in_prof`
(
    IN p_nombre VARCHAR(50),
    IN p_apellido VARCHAR(50),
    IN p_sexo VARCHAR(2),
    IN p_codigo VARCHAR(3)
 )
BEGIN
	INSERT INTO Profesional (Nombre, Apellido, Sexo, Codigo)
    VALUES (p_nombre, p_apellido, p_sexo, p_codigo);
END$$

DELIMITER ;
-- Este profesional no ha sido agregado a la base de datos. Se puede utilizar para comprobar el funcionamiento del stored procedure
CALL sp_in_prof('Camila','Moscoso','F','ARG');

-- Verificar Creacion
SELECT * FROM Profesional;
