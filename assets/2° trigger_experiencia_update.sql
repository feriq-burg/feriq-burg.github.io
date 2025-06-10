use data_analysts;
-- Creacion de la tabla de log de experiencia
CREATE TABLE Log_exp(
Id_exp INT NOT NULL,
Id_prof INT,
Titulo_car VARCHAR(100),
Id_emp INT,
Fecha_in DATE,
Fecha_en DATE,
Estado INT NOT NULL, 
User_mod VARCHAR(20) NOT NULL,
Tipo_mod VARCHAR(20),
Date_mod DATETIME
);


-- El trigger se encarga de registrar el antes y despues de una modificacion en la tabla experiencia para que sea mas facil visibilizar el cambio realizado respecto a como estaba antes de la modificaion  
DELIMITER $$
DROP TRIGGER IF EXISTS Tr_mod_exp
$$
CREATE TRIGGER Tr_mod_exp
AFTER UPDATE ON Experiencia 
FOR EACH ROW
BEGIN

INSERT INTO Log_exp(Id_exp, Id_prof, Titulo_car, Id_emp, Fecha_in, Fecha_en, Estado ,User_mod, Tipo_mod, Date_mod)
VALUES (old.Id_exp, old.Id_prof, old.Titulo_car, old.Id_emp, old.Fecha_in, old.Fecha_en, old.Estado ,current_user(),'UPDATE BEFORE', current_timestamp()),
			(new.Id_exp, new.Id_prof, new.Titulo_car, new.Id_emp, new.Fecha_in, new.Fecha_en, new.Estado ,current_user(),'UPDATE AFTER', current_timestamp());

END
$$


