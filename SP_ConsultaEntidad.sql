DELIMITER $$
CREATE or replace  PROCEDURE `ConsultaEntidad`()
BEGIN
-- Consulta la Entidad Federativa para llenar el combo Entidad
 select idEntidad, NomEntidad 
 from dbposgrado.entidadfederativa
 Order by NomEntidad ;
    
END$$
DELIMITER ;
