<?php
//  Llama al archivo que contiene la conexion a la BD
    require_once('C:/xampp/htdocs/Posgrado/dbconexion.php');

    // Llamada al procedimiento almacenado q
    if($stmt = $cnx->prepare("CALL ConsultaPrograma")){
        $stmt->execute();
        $dataprograma = $stmt->get_result();
     }
        $stmt->close();

     if($stmt = $cnx->prepare("CALL ConsultaNacionalidad")){
        $stmt->execute();
        $dataNacionalidad = $stmt->get_result();
     }
        $stmt->close();

     if($stmt = $cnx->prepare("CALL ConsultaEntidad")){
        $stmt->execute();
        $dataEntidad = $stmt->get_result();
     }
        $stmt->close();
        
    if($stmt = $cnx->prepare("CALL ConsultaPais")){
        $stmt->execute();
        $dataPais = $stmt->get_result();
        }
        $stmt->close();
    
    if($stmt = $cnx->prepare("CALL ConsultaIdioma")){
        $stmt->execute();
        $dataIdioma = $stmt->get_result();
        }
        $stmt->close();

       /*  function LlenaAlcaldia() {
            echo $identidad;
            echo $identidadSeleccionada;
           $identidadSeleccionada = $_GET['idEntidad'];
            if($stmt = $cnx->prepare("CALL ConsultaAlcaldia(?)")){
                $stmt->bind_param("s", $identidadSeleccionada);
                $stmt->execute();
                $dataAlcaldia = $stmt->get_result();        
            }
                $stmt->close(); */
    // Cierra la conexión a la base de datos
    //$cnx->close();
?>

<!DOCTYPE html>
<html lang = "en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Solicitud de admisión</title>
    <link rel="shortcut icon" href="img/favicon-32x32.png" type="img/x-icon">
    <meta name="viewport" content="width=device-width, initial-scale=1" />
   <link rel="stylesheet" href="styles.css" />
     <!--CUSTOM CSS-->
     <link rel="stylesheet" href="main.css">
    
    <script type="text/javascript">
        function LlenaAlcaldia(str){
            var conexion;
            if(str==""){
                document.getelemtbyid("txthint").innerHTML="";
                return;
            }
            if(window.XMLHttpRequest){
                conexion=new XMLHttpRequest();
            }
                conexion.onreadystatechange=function(){
                if conexion.reaadystate== 4 
                }

            }
    </script>

</head>
<body>
    <header>
        <section class="iconos_container">
        <div class="imgicono"> <img src="img/pleca-gob.jpeg" width="700" height="120"/></div>
    </div>
    <div class="col-sm-12 col-md-4 col-lg-4 col-xl-4 ">

        <div class="row_iconhead">
    <a href='https://login.microsoftonline.com/' target='new'><span class='iconsp' title='Correo'><img src="img/outlookim.png" alt=""><i class='fa fa-envelope' aria-hidden='true'></i></span></a>
    <!-- <a href='#' target='new'><span class='iconsp' title='Calendario'><img src="img/calendar.svg" alt="" style="color: white;"><i class='fa fa-calendar' aria-hidden='true'></i></span></a>   -->
    <a href='https://www.tlalnepantla.tecnm.mx/directorio/' target='new'><span class='iconsp' title='Directorio'><img src="img/directorio.png" alt=""><i class='fa fa-contact' aria-hidden='true'></i></span></a>
    <a href='https://www.tlalnepantla.tecnm.mx/' target='new'><span class='iconsp' title='TecNM ITTLA'><img src="img/ittlapag.png" alt=""><i class='fa fa-ittla' aria-hidden='true'></i></span></a>  
    <a href='http://sii.ittla.edu.mx/' target='new'><span class='iconsp' title='Sii'><img src="img/favicon-32x32.png" alt=""><i class='fa fa-sii' aria-hidden='true'></i></span></a> 
    <span class="iconsp"  title="Acesibilidad"><i class="fa fa-eye-slash" aria-hidden="true"></i></span>
    <span class="iconsp ojorojo" id="redne"  title="Contraste"><i class="fa fa fa-adjust" aria-hidden="true"></i></span>
    </div>
    </div>
        </section>
</header>

<!--Datos-->
    <div class="content">
        <h1 class="logo">SOLICITUD DE <span>ADMISIÓN</span></h1>
        <div class="contact-wrapper">
            <div class="contact-form">
                <h3>DATOS PERSONALES</h3>
                <form action="documento.php" method="post">
                    <p class="block">
                        <label for="posgra">Programa:</label>
                        <!-- <input type="text" name="posgra" value="Maestría en Ciencias de la Ingenierias" readonly> -->
                        <select name="programa" class ="form-control">
                            <?php foreach ($dataprograma as $datos):?>
                                <option value="<?php echo $datos['idprograma']?>"><?php echo $datos['Nomprograma']?></option>
                            <?php endforeach ?>    
                        </select>
                    </p>
                    <p>
                        <label for="">Fecha de solicitud:</label>
                        <input type="date" id="start" name="datesol" value="2023-08-01" min="2023-08-01" max="2023-12-20" />
                    </p>
                    <p>
                        <label for="fullname">Apellidos:</label>
                        <input type="text" name="lastname" id="lastname" placeholder="Ej.: García Martínez">
                    </p>
                    <p>
                        <label for="">Nombre (s):</label>
                        <input type="text" name="name" placeholder="Ej.: María Elena">
                    </p>
                    <p>
                        <label for="">Foto:</label>
                        <input type="file" name="imagensubida" accept="image/png, .jpeg, .jpg">
                    </p>
                    <p>
                        <label for="">Fecha de nacimiento:</label>
                        <input type="date" id="start" name="datenac" value="2005-07-22" min="1920-01-01" max="#">
                    </p>
                    <p>
                        <label for="">Género:</label>
                        <select name="genero">
                            <option value="1">Femenino</option>
                            <option value="2">Masculino</option>
                            <option value="2">Otro</option>
                        </select>
                    </p>
                    <p>
                        <label for="">Estado civil:</label>
                        <select name="estadiciv">
                            <option value="1">Soltero</option>
                            <option value="2">Casado</option>
                        </select>
                    </p>
                    <p>
                        <label for="naciona">Nacionalidad:</label> 
                            <select name="nacionalidad" class ="form-control">
                            <?php foreach ($dataNacionalidad as $datos):?>
                                <option value="<?php echo $datos['idNacionalidad']?>"><?php echo $datos['NomNacionalidad']?></option>
                            <?php endforeach ?>     
                        </select>
                    </select>
                    </td>
                    </p>
                    <p>
                        <label for="">Calle y numero:</label>
                        <input type="text" name="callenum" placeholder="Av. Instituto Tecnológico">
                    </p>
                    <p>
                        <label for="">Colonia:</label>
                        <input type="text" name="col" placeholder="Ej.: La Comunidad">
                    </p>
                    <p>
                        <label for="Enti">Entidad Federativa:</label>
                        <select name="Entidad" class ="form-control" onchange="LlenaAlcaldia()>
                            <?php foreach ($dataEntidad as $datos):?>
                                <option value="<?php echo $datos['idEntidad']?>"><?php echo $datos['NomEntidad']?></option>
                            <?php endforeach ?>     
                        </select>

                    </p>
                    <p>
                        <label for="Alcal">Alcaldia:</label>
                        <select name="Alcaldia" class ="form-control">
                            <?php foreach ($dataAlcaldia as $datos):?>
                                <option value="<?php echo $datos['idAlcaldiaMunicipio']?>"><?php echo $datos['NomAlcaldiaMunicipio']?></option>
                            <?php endforeach ?>     
                        </select>
                    </p>
                    <p>
                        <label for="tel">Telefóno celular:</label>
                        <input type="tel" id="phone" name="cel" placeholder="Ej.: 5555653099" pattern="[0-9]{10}" required />
                    </p>
                    <p>
                        <label for="pais">País:</label>                     
                        <select name="Pais" class ="form-control">
                            <?php foreach ($dataPais as $datos):?>
                                <option value="<?php echo $datos['idPais']?>"><?php echo $datos['NomPais']?></option>
                            <?php endforeach ?>     
                        </select>
                        
                    </p>
                    <p class="low">
                        <label for="fullname">Correo electrónico.:</label>
                        <input type="email" name="email" placeholder="Ej.: silvia.sc@tlalnepantla.tecnm.mx" id="email" required><br>
                    </p>
                    <p>
                        <label for="fullname">Telefono particular:</label>
                        <input type="tel" id="phone" name="phone" placeholder="Ej.: 5555653099" pattern="[0-9]{10}" required />
                    </p>                               
            
            <!--Datos 2-->

                        <h3 class="titulodatos">ESTUDIOS REALIZADOS Y FECHAS DE ESTUDIOS DE LICENCIATURA</h3>
                            <p class="block">
                                <label for="college">IES donde estudió la licenciatura:</label>
                                <input type="text" name="college" placeholder="Ej.: Instituto Tecnológico de Tlalnepantla" id="college">
                            </p>
                            <p>
                                <label for="fullname">Entidad Federativa:</label>
                                <input type="text" name="entidad" placeholder="Ej.: Estado de México" id="text">
                            </p>
                            <p class="block">
                                <label for="carrera">Carrera:</label>
                                <input type="carrera" name="carrera" placeholder="Ej.: Ing. en TIC">
                            </p>
                            <p>
                                <label for=""><span>Fecha de ingreso:</span></label>
                                <input type="date" id="feingre" name="trip-start" value="2005-07-22" min="1920-01-01" max="#">
                            </p>
                            <p>
                                <label for=""><span>Fecha de egreso:</span></label>
                                <input type="date" id="feegre" name="trip-start" value="2005-07-22" min="1920-01-01" max="#">
                            </p><p>
                                <label for=""><span>Fecha de titulación:</span></label>
                                <input type="date" id="fetitu" name="trip-start" value="2005-07-22" min="1920-01-01" max="#">
                            </p>
                            <p>
                                <label for="">Promedio general:</label>
                                <input type="number" id="tentacles" name="promedio" min="10" max="100" placeholder="Ej.: 80">
                            </p>
                            <p>
                                <label for="tel">Idioma extranjero:</label>
                                <select name="idioma">
                                    <option value="1">Ingles</option>
                                    <option value="2">Portugues</option>
                                    </select>
                            </p>

            <!--Datos 3-->
            <h3 class="titulodatos">EXPERIENCIA PROFESIONAL Y DE INVESTIGACIÓN</h3>
                            <p class="block">
                                <label for="inves">Título de la(s) publicación (es):</label>
                                <input type="text" name="publi1" id="inves" value="1) ">
                                <input type="text" name="publi2" id="inves" value="2) ">
                            </p>
                            <p class="block">
                                <label for="inves">Experiencia laboral:</label>
                                <input type="text" name="expelab" id="inves" value="Empresa (Docencia): ">                                
                            </p>
                            <p class="block">
                                <label for="carrera">Periodo:</label>
                                <input type="text" name="periodo" placeholder="Ej.: 2005-2013">
                            </p>
                            <p class="block">
                                <label for="carrera">Actividad:</label>
                                <input type="text" name="activi" placeholder="Ej.: Ingeniero en software">
                            </p>
                            <p class="block">
                                <label for="carrera">Línea de generación y/o aplicación del conocimiento de su preferencia (LGAC) (7):</label>
                                <input type="text" name="linea" placeholder="Ej.: Ingeniero en software">
                            </p>
                            <p class="block">
                                <label for="carrera">Datos de persona de contacto. (nombre, dirección, correo electrónico y teléfono) (8):</label>
                                <input type="text" name="datoscontac" placeholder="Ej.: Ingeniero en software">
                            </p>
                            <p class="block">
                                <label for="firma" class="signature">Declaro que la información proporcionada en esta solicitud es verídica.</label>                     
                                <input type="firma" name="signature" value="Firma: ">
                            </p> 
            <!--Documentos-->
            <h3 class="titulodatos">LISTA DE DOCUMENTOS A ENTREGAR POR LA PERSONA ASPIRANTE.</h3>
            <h5 class="titulodatos">(Sube tus archivos escaneados, en formato PDF y que no pasen de 64 KB)</h5>
            <p class="block">
                <label for="inves">Acta de nacimiento*</label>
                <input type="file" name="actanac" accept="application/pdf" pattern="64 kb">
            </p>
            <p class="block">
                <label for="inves">Certificado de Licenciatura*</label>
                <input type="file" name="certilic" accept="application/pdf" pattern="64 kb">
            </p>
            <p class="block">
                <label for="inves">Título de Licenciatura (o Acta de Examen Profesional para las personas egresadas de TecNM)*</label>
                <input type="file" name="titulolic" accept="application/pdf" pattern="64 kb">
            </p>
            <p class="block">
                <label for="inves">Carta que indique la intención, el compromiso y la exclusividad en el programa de posgrado</label>
                <input type="file" name="cartacom" accept="application/pdf" pattern="64 kb">
            </p>
            <p class="block">
                <label for="inves">Currículum Vitae (CONAHCYT)</label>
                <input type="file" name="cv" accept="application/pdf" pattern="64 kb">
            </p>
            <p class="block">
                <label for="inves">Constancia de Idioma Inglés</label>
                <input type="file" name="considioma" accept="application/pdf" pattern="90 kb">
            </p>
                    <p class="block">
                    <button type="submit">
                        Enviar
                    </button>
                </p>
                </form>
             </div>
        </div>
    </div> 

  <!--Pie de Pagina-->
  <footer>
    <div class="titulo-final">
        <h1>Tecnologico Nacional de México</h1>
      <h2>&copy;2023 Instituto Tecnologico de Tlalnepnatla</h2>
    <p>Av. Instituto Tecnológico s/n, La Comunidad, 54070 Tlalnepantla de Baz, Méx.</p>
    <p>Esta página es una obra intelectual protegida por la Ley Federal del Derecho de Autor, puede ser reproducida con fines no lucrativos, siempre y cuando no se mutile, se cite la fuente completa y su dirección electrónica; su uso para otros fines, requiere autorización previa y por escrito del Director del Instituto Tecnológico de Tlalnepantla.</p>
    </div>
    <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
        <img src="https://www.tlalnepantla.tecnm.mx/img/footer/tecnmn.png" class="img-responsive">
      </div>
</footer>
</body>

</html>
