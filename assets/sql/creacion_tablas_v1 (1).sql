CREATE DATABASE data_analysts;
USE data_analysts;

-- Crear tabla Profesional
CREATE TABLE Profesional (
Id_prof INT AUTO_INCREMENT NOT NULL,
Nombre VARCHAR(50) NOT NULL,
Apellido VARCHAR(50) NOT NULL,
Sexo VARCHAR(1),
Codigo VARCHAR(3) NOT NULL,
PRIMARY KEY (Id_prof) 
);

-- Crear tabla Educacion
CREATE TABLE Educacion (
Id_ed INT AUTO_INCREMENT NOT NULL,
Id_prof INT NOT NULL,
Institucion VARCHAR(100),
Titulo VARCHAR(150),
Año_ing DATE,
Año_egr DATE,
PRIMARY KEY (Id_ed)
);


-- Crear tabla Experiencia
CREATE TABLE Experiencia (
Id_exp INT AUTO_INCREMENT NOT NULL,
Id_prof INT NOT NULL,
Titulo_car VARCHAR(100) NOT NULL,
Id_emp INT,
Fecha_in DATE,
Fecha_en DATE,
Estado INT NOT NULL,
PRIMARY KEY (Id_exp)
);

-- Crear tabla Certificacion
CREATE TABLE Certificacion (
Id_cert INT AUTO_INCREMENT NOT NULL,
Id_prof INT NOT NULL,
Nom_cert VARCHAR(90),
Entidad VARCHAR(90),
Fecha_emi DATE,
Fecha_venc DATE,
Url TEXT,
PRIMARY KEY (Id_cert)
);


-- Crear tabla Pais
CREATE TABLE Pais (
Codigo VARCHAR(3) NOT NULL,
Nombre VARCHAR (50),
PRIMARY KEY (Codigo)
);

-- Crear tabla Empresa
CREATE TABLE Empresa (
Id_emp INT AUTO_INCREMENT NOT NULL,
Nom_empresa VARCHAR(60),
Industria VARCHAR(60),
Tam_empresa VARCHAR(20),
PRIMARY KEY (Id_emp)
);


-- Crear llave Foranea en tabla Profesional
ALTER TABLE Profesional
ADD FOREIGN KEY (Codigo) REFERENCES Pais (Codigo);

-- Crear llave Foranea en tabla Educacion
ALTER TABLE Educacion
ADD FOREIGN KEY (Id_prof) REFERENCES Profesional (Id_prof);

-- Crear llave Foranea en tabla Experiencia
ALTER TABLE Experiencia
ADD FOREIGN KEY (Id_prof) REFERENCES Profesional (Id_prof);

ALTER TABLE Experiencia
ADD FOREIGN KEY (Id_emp) REFERENCES Empresa (Id_emp);

-- Crear llave Foranea en tabla Certificacion
ALTER TABLE Certificacion
ADD FOREIGN KEY (Id_prof) REFERENCES Profesional (Id_prof);