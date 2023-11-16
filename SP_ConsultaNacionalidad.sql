DELIMITER $$
CREATE OR REPLACE PROCEDURE `ConsultaNacionalidad`()
BEGIN
-- Consulta la nacionalida para llenar el combo nacionalidad
 select * from dbposgrado.nacionalidad;
END$$
DELIMITER ;
