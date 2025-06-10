
use data_analysts;

-- Creacion de la tabla de log profesional 
CREATE TABLE Log_prof(
Id_prof INT NOT NULL,
Nombre VARCHAR(50),
Apellido VARCHAR(50),
Sexo VARCHAR(2),
Codigo VARCHAR(3),
User_mod VARCHAR(20) NOT NULL,
Tipo_mod VARCHAR(20),
Date_mod DATETIME
);



-- El trigger consiste en que despues de insertar un nuevo profesional a la base de datos se registre su creacion en la tabla Log_prof indicando los datos del profesional, el usuario y la fecha
DELIMITER $$
DROP TRIGGER IF EXISTS Tr_ins_prof
$$
CREATE TRIGGER Tr_ins_prof
AFTER INSERT ON Profesional
FOR EACH ROW
BEGIN

INSERT INTO Log_prof(Id_prof, Nombre, Apellido, Sexo,Codigo,User_mod, Tipo_mod, Date_mod)
VALUES (new.Id_prof, new.Nombre, new.Apellido, new.Sexo, Codigo, current_user,'INSERT', current_timestamp());

END
$$
--


