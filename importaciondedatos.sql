-- en este script vamos a realizar una insercion de datos con importacion.

use plataforma;

-- SHOW VARIABLES LIKE 'secure_file_priv';

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/tabla.fuente.csv'
INTO TABLE fuente 
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@fecha, link_, titulo, texto, seccion)
SET fecha = STR_TO_DATE(@fecha, '%Y-%m-%d');



select fecha, link_, titulo, texto, seccion from fuente;