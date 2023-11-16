<?php
// Configuración de la conexión a la base de datos
$servername = "localhost"; // Cambia esto por la dirección de tu servidor de base de datos
$username = "root";     //  nombre de usuario de la base de datos
$password = "posgrado23";            //  contraseña de la base de datos
$dbname = "dbposgrado";             // Nombre de la base de datos


$cnx = new mysqli($servername, $username, $password, $dbname);

if ($cnx->connect_error) {
    die("Error de conexión: " . $cnx->connect_error) . "Consulte con el administrador del sistema";
}
'echo "Conexión exitosa a la base de datos.";'

/* function conectarBD(){
  // eESTA ES LA PRIMERA OPCION DE CONEXION VALIDAR CUAL ES LA MAS FACTIBLE
// Configuración de la conexión a la base de datos
  $servername = "localhost"; // Cambia esto por la dirección de tu servidor de base de datos
  $username = "root";     //  nombre de usuario de la base de datos
  $password = "posgrado23";            //  contraseña de la base de datos
  $dbname = "dbposgrado";             // Nombre de la base de datos

  try{
     $cnx= new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
     $cnx->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
     return $cnx;
    } catch (PDOException $e) {
      echo "Error de conexión: " . $e->getMessage();  // Maneja cualquier excepción que pueda ocurrir durante la conexión
       return null; // Retorna null para indicar que la conexión ha fallado
    }
  } */
?>

