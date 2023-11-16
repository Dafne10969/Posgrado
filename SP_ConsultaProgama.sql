DELIMITER $$
CREATE PROCEDURE `ConsultaPrograma`()
BEGIN
	--  consulta los programas que ofrece el ITTLA
	select distinct idprograma,claveprograma, Nomprograma 
	from dbposgrado.programa;

END$$
DELIMITER ;
