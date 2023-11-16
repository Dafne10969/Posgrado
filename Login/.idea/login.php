<?php
// Configuración de la conexión a la base de datos
$servername = "localhost"; // Cambia esto por la dirección de tu servidor de base de datos
$username = "";     //  nombre de usuario de la base de datos
$password = "";            //  contraseña de la base de datos
$dbname = "bdposgrado";             // Nombre de la base de datos

// Crea una conexión a la base de datos
$conn = new mysqli($servername, $username, $password, $dbname);

// Verifica si la conexión fue exitosa
if ($conn->connect_error) {
    die("La conexión a la base de datos falló: " . $conn->connect_error);
}

// Obtiene los datos del formulario
$usuario = $_POST['usuario'];
$contrasena = $_POST['contrasena'];

// Realiza una consulta SQL para verificar las credenciales en la tabla "Usuario"
$sql = "SELECT * FROM Usuario WHERE nombre_usuario = '$usuario' AND contrasena = '$contrasena'";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // El usuario ha sido autenticado correctamente
    // Puedes redirigirlo a una página de inicio o realizar otras acciones
    echo "Inicio de sesión exitoso.";
} else {
    // Las credenciales son incorrectas
    echo "Inicio de sesión fallido.";
}

// Cierra la conexión a la base de datos
$conn->close();
?>
