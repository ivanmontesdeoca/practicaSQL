use plataformas;

-- 1. vista dos tablas
CREATE OR REPLACE VIEW violencias AS
	(select salud_repartidor.Estado, violencia.tipo_violencia, violencia.arma, violencia.motivo
	from salud_repartidor join violencia
	on salud_repartidor.id_fuente = violencia.id_fuente);

-- 2. vista con filtro de cantidad, 
CREATE OR REPLACE VIEW participacion AS
select accion.accion, organizacion.name_org 
from accion join organizacion 
on accion.id_conflicto = organizacion.id_conflicto
where accion.participantes >= 100;


-- 3. vista 1 tabla con filtros en titulo de palabras que refieren a conflictividad ordenada por id
CREATE OR REPLACE VIEW huelgas AS
select titulo, id_fuente, fecha from fuente
where titulo like '%hue%'
or titulo like '%prot%'
order by id_fuente; 

-- 4. vista tres tablas
CREATE OR REPLACE VIEW conflictividad AS
(select demanda.tipo_demanda, demanda.demanda, accion.tipo_accion, accion.accion, organizacion.name_org, organizacion.tipo_org
from demanda join organizacion
on demanda.id_conflicto = organizacion.id_conflicto 
join accion
on demanda.id_conflicto = accion.id_conflicto);


-- 5. vista filtro judicial en tabla politicas publicas
CREATE or REPLACE VIEW poder as
(select * from politicas_publicas
where objetivo like '%laboral%' 
and institucion like '%judicial%'
or institucion like'%poder%'
order by id_pol);

