DELIMITER $$
CREATE PROCEDURE `ConsultaPais`()
BEGIN   
-- Consulta los paises para llenar los combos de pais
 select idPais, NomPais  from dbposgrado.pais;
   
END$$
DELIMITER ;



