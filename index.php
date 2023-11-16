
<!doctype html>
<html lang="es">
<head>
    <link rel="icon" type="image/jpg" href="Login/favicon-32x32.png">
    <title>SIP</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v2.1.9/css/unicons.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="Login/styles.css">
</head>
<body>
    <div class="col-md-12 column">
        <header>
            <div class="sombra" align="center"> <img src="Login/union.png" width="1250" height="105"/></div>
        </header>

<form action="controlador_login.php" method="POST"> 
    <div class="container">
        <div class="row full-height justify-content-center">
            <div class="col-12 text-center align-self-center py-5">
                <div class="card-3d-wrap mx-auto">
                    <div class="card-front">
                        <div class="center-wrap">
                            <h4 class="mb-4 pb-3"  >Sistema Integral de Posgrado</h4>
                            <form action="controlador_login.php" method="POST">
                                <div class="form-group">
                                    <input type="text" class="form-style" placeholder="Usuario" name="usuario" required>
                                    <i class="input-icon uil uil-at"></i>
                                </div>
                                <div class="form-group mt-2">
                                    <input type="password" class="form-style" placeholder="Contraseña" name="contrasena" required>
                                    <i class="input-icon uil uil-lock-alt"></i>
                                </div>
                                <div>
                                    <button name="btnIngresar"  type="submit" class="btn mt-4 custom-btn">Ingresar</button>
                                </div>
                            </form>
                            </div>
                         </div>
                    </div>
                 </div>
            </div>
        </div>
    </div>
 </form>
<footer >
    <footer >
        <div class="titulo-final">
            <h2>Instituto Tecnológico de Tlalnepantla<br>&copy; 2023 Todos los derechos reservados </h2>
        </div>
</footer>
</body>
</html>
