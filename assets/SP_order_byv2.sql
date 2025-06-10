USE `data_analysts`;
DROP procedure IF EXISTS `sp_orden_educacion`;


-- El stored procedure se encarga de ordenar la tabla educacion acorde al criterio deseado

DELIMITER $$
USE `data_analysts`$$
CREATE PROCEDURE `sp_orden_educacion` (IN p_criterio varchar(60))
BEGIN
SET @v_consulta = concat('SELECT * FROM educacion ORDER BY ', p_criterio);
        
        SELECT @v_consulta;
        
        PREPARE consulta from @v_consulta;
        EXECUTE consulta;
        DEALLOCATE PREPARE consulta;
END$$


-- Ordenar tabla segun Titulo

call sp_orden_educacion('Titulo');