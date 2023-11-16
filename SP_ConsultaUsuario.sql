DELIMITER $$
CREATE OR REPLACE  PROCEDURE `ConsultaUsuario`(IN Usuario varchar(13), IN contrasena varchar(20))
BEGIN
    -- Realizar la consulta utilizando el parámetro
    SELECT idusuario, idtipousuario, password
    FROM dbposgrado.usuario
    WHERE idusuario = Usuario 
    AND Password= contrasena
    AND Estatus=1;

    -- Devolver el resultado
 --   SELECT id, tipousuario, contrasena;
END$$
DELIMITER ;
