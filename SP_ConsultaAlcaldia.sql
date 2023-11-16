DELIMITER $$
CREATE or replace PROCEDURE `ConsultaAlcaldia`(IN entidad int)
BEGIN
 -- Consulta las alcaldias para llenar los combos de entidad
 select idEntidad, idAlcaldiaMunicipio, NomAlcaldiaMunicipio
 from dbposgrado.alcaldiamunicipio
 where identidad=entidad
 order by NomAlcaldiaMunicipio;

END$$
DELIMITER ;
