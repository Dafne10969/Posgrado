<?php
// Llama al archivo que contiene la conexion a la BD
    require_once('C:/xampp/htdocs/Posgrado/dbConexion.php');
       session_start();

       // Obtiene los datos del formulario
        $user = $_POST['usuario'];
        $psw = $_POST['contrasena'];

    // Llamada al procedimiento almacenado q
    if($stmt = $cnx->prepare("CALL ConsultaUsuario(?,?)")){
      $stmt->bind_param("ss", $user,$psw);
      $stmt->execute();
      
      // Recupera los resultados  manejar los resultados aquí si el procedimiento devuelve datos
      $result = $stmt->get_result();
      $numregistros= mysqli_num_rows($result);
    }
      $stmt->close();

        if ($numregistros !=0) {            
            $_SESSION["idUsuario"]=$datos->idusuario;
          // El usuario ha sido autenticado correctamente
            header("Location: Inicio/inicio.php");
        } else {
          echo '<script>';
          echo 'alert("' . "No se encuentra el usuario" . '");';
          echo 'window.location.href = "index.php";';
          echo '</script>';

    }
    // Cierra la conexión a la base de datos
    $cnx->close();   
?>
