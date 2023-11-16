DELIMITER $$
CREATE PROCEDURE dbposgrado.ConsultaUsuario(IN Usuario varchar(13) )
BEGIN
    -- Declarar variables si es necesario
    DECLARE Id varchar(13);
    DECLARE tipousuario int;
    DECLARE contrasena varchar(20);
    
    -- Realizar la consulta utilizando el parámetro
    SELECT idusuario, idtipousuario, password
    INTO id, tipousuario, contrasena
    FROM dbposgrado.usuario
    WHERE idusuario = Usuario 
    AND Estatus=1;

    -- Devolver el resultado
    SELECT id, tipousuario, contrasena;
END $$

DELIMITER ;

