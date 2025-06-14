USE data_analysts;
-- Selecciona el ID del profesional me dice su nombre y su cargo según el Estado con el número 2

DELIMITER $$
DROP FUNCTION IF EXISTS f_prof_nomb_exp
$$
CREATE FUNCTION f_prof_nomb_exp (p_id_prof int) returns varchar(300)
READS SQL DATA
BEGIN

	DECLARE v_nomb_prof, v_exp varchar(200);
    DECLARE v_max_prof int;
    
    SET v_max_prof = (SELECT MAX(id_prof) FROM profesional);

	IF p_id_prof <= 0 THEN
		RETURN 'Id no existe';
	ELSE IF 
		p_id_prof > v_max_prof THEN
		RETURN 'No existe este profesional';
	END IF;
    END IF;
    
	
    SET v_nomb_prof =(
    
	SELECT Nombre
	FROM profesional as pf
	WHERE Id_prof = p_id_prof);
	
    SET v_exp=(
    
    SELECT Titulo_car
    FROM experiencia
    WHERE Id_prof = p_id_prof AND Estado = 2);
    

	RETURN concat(v_nomb_prof, ' trabaja como ', v_exp);
END
$$
