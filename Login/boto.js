
 // Función para validar la contraseña
function validarContrasena(contrasena) {
  // Simplemente verifica si la contraseña es la correcta o no
  return contrasena === "contrasenaRegistrada";
}

// Función para mostrar una alerta de contraseña incorrecta
function mostrarContrasenaIncorrecta() {
  showAlert("Contraseña incorrecta. Por favor, inténtalo de nuevo.");
}

// Función para validar el formulario
function validarFormulario() {
  // Obtén el valor de la contraseña
  const contrasena = document.getElementById("contrasena").value;

  // Verifica si la contraseña es incorrecta y muestra el mensaje correspondiente
  if (!validarContrasena(contrasena)) {
      mostrarContrasenaIncorrecta();
      // Evita que el formulario se envíe
      return false;
  }

  // Continúa con el envío del formulario si la contraseña es correcta
  return true;
}

