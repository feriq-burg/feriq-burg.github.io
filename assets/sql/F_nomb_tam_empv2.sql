use data_analysts;
-- La función solicita un id de empresa y retorna su nombre y cuantas personas trabajan aproximadamente
DELIMITER $$
DROP FUNCTION IF EXISTS f_nomb_tam_emp
$$
CREATE FUNCTION f_nomb_tam_emp (p_Id_emp int) returns varchar(300)
READS SQL DATA
BEGIN

	DECLARE v_nomb_emp, v_tam varchar(200);

	IF p_Id_emp <= 0 THEN
		RETURN "Id no existe";
	ELSE IF
		p_Id_emp > 125 THEN
        RETURN "Id no registrado";
	END IF; 
    END IF;
	
	SELECT Nom_empresa, Tam_empresa
	INTO v_nomb_emp, v_tam
	FROM empresa
	WHERE Id_emp = p_Id_emp;
	
    
    IF v_nomb_emp IS NULL THEN
	RETURN "NO EXISTE";

	END IF;
    
    IF v_tam IS NULL THEN
    RETURN "Tamaño no disponible";
    END IF;
    
	RETURN concat("En la empresa ",v_nomb_emp, " trabajan aproximadamente " ,v_tam, " personas ");
end
$$

