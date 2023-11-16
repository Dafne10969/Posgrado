DELIMITER $$
CREATE or replace  PROCEDURE `ConsultaIdioma`()
BEGIN   
-- Consulta los paises para llenar los combos de pais
 select ididioma, NomIdioma  from dbposgrado.idioma;
   
END$$
DELIMITER ;
