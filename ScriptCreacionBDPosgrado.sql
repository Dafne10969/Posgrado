-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema dbposgrado
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema dbposgrado
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `dbposgrado` DEFAULT CHARACTER SET utf8 ;
USE `dbposgrado` ;

-- -----------------------------------------------------
-- Table `dbposgrado`.`entidadfederativa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbposgrado`.`entidadfederativa` (
  `idEntidad` INT NOT NULL COMMENT 'Numero que identifica la entidad federativa',
  `NomEntidad` VARCHAR(50) NOT NULL COMMENT 'Nombre de la entidad federativa',
  `Abreviatura` VARCHAR(45) NOT NULL COMMENT 'Abreviatura de la entidad federativa',
  PRIMARY KEY (`idEntidad`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dbposgrado`.`alcaldiamunicipio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbposgrado`.`alcaldiamunicipio` (
  `idEntidad` INT NOT NULL COMMENT 'Numero que identifica la alcaldia, viene de la tabla EntidadFederativa',
  `idAlcaldiaMunicipio` INT NOT NULL COMMENT 'Numero que identifica a la alcaldia y municipio',
  `NomAlcaldiaMunicipio` VARCHAR(50) NOT NULL COMMENT 'Nombre de la alcaldia o municipio',
  INDEX `Id_EntidadFederativa_idx` (`idEntidad` ASC),
  CONSTRAINT `fk_idEntidadAlcMun`
    FOREIGN KEY (`idEntidad`)
    REFERENCES `dbposgrado`.`entidadfederativa` (`idEntidad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dbposgrado`.`alerta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbposgrado`.`alerta` (
  `idAlerta` INT NOT NULL AUTO_INCREMENT COMMENT 'Numero que identifica la alerta',
  `NomAlerta` VARCHAR(255) NOT NULL COMMENT 'Descripcion detallada de la alerta que se enviara',
  `SemanaInicio` VARCHAR(45) NULL,
  `SemanaFin` VARCHAR(45) NULL,
  `FechaInicio` DATETIME NOT NULL COMMENT 'Fecha para empezar a enviar la alerta',
  `FechaFin` DATETIME NOT NULL COMMENT 'Fecha del ultimo dia que se enviara la alerta',
  `Repetir` INT NULL COMMENT 'Numero de veces que se mostrara la alerta durante la semana o durante el dia',
  `FechaAltaAlerta` DATETIME NULL COMMENT 'Fecha en la que se crea la alerta',
  `Usuario` VARCHAR(13) NULL COMMENT 'RFC del Usuario que crea la alerta',
  PRIMARY KEY (`idAlerta`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dbposgrado`.`tipousuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbposgrado`.`tipousuario` (
  `idTipoUsuario` INT NOT NULL COMMENT 'Numero consecutivo que identifica al usuario',
  `NomTipoUsuario` VARCHAR(45) NOT NULL COMMENT 'Nombre del tipo de usuario',
  `Descripcion` VARCHAR(150) NULL DEFAULT NULL COMMENT 'Descripcion del tipo de usuario',
  PRIMARY KEY (`idTipoUsuario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dbposgrado`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbposgrado`.`usuario` (
  `idUsuario` VARCHAR(13) NOT NULL COMMENT 'Numero consecutivo asignado por el sistema para identificar un usuario',
  `idTipoUsuario` INT NOT NULL COMMENT 'Desripcion del tipo de usuario Alumno Docente Cordinador Administrador',
  `Password` VARCHAR(15) NOT NULL COMMENT 'Contrasena del usuario',
  `FechaAlta` DATE NOT NULL COMMENT 'Fecha de alta del registro del usuario',
  `FechaModificacion` DATE NULL DEFAULT NULL COMMENT 'Fecha de modificacion del registro del usuario',
  `Estatus` TINYINT(4) NULL DEFAULT NULL COMMENT 'Se refiere al estatus del usuario y se identifica de la siguiente forma 1  Activo 0  Inactivo',
  PRIMARY KEY (`idUsuario`),
  INDEX `fk_TipoUsuario_idx` (`idTipoUsuario` ASC),
  CONSTRAINT `fk_TipoUsuario`
    FOREIGN KEY (`idTipoUsuario`)
    REFERENCES `dbposgrado`.`tipousuario` (`idTipoUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dbposgrado`.`alertausuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbposgrado`.`alertausuario` (
  `idUsuario` VARCHAR(13) NOT NULL COMMENT 'RFC del usuario que recibira alertas',
  `idAlerta` INT NOT NULL COMMENT 'Numero que identifica a la alerta viene de la tabla alerta',
  INDEX `fk_idAlerta_idx` (`idAlerta` ASC),
  INDEX `fk_id_Usuario_idx` (`idUsuario` ASC),
  CONSTRAINT `fk_idAlerta`
    FOREIGN KEY (`idAlerta`)
    REFERENCES `dbposgrado`.`alerta` (`idAlerta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_idUsuario`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `dbposgrado`.`usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dbposgrado`.`tesis`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbposgrado`.`tesis` (
  `idTesis` INT NOT NULL AUTO_INCREMENT COMMENT 'Numero consecutivo de la tesis viene de la tabla PRopuestaTesis',
  `idPresidente` VARCHAR(13) NOT NULL COMMENT 'RFC quien preside la tesis',
  `idDirector` VARCHAR(13) NOT NULL COMMENT 'RFC del director de la tesis',
  `idCodirector` VARCHAR(13) NOT NULL COMMENT 'RFC del codirector de la tesis',
  `idRevisor1` VARCHAR(13) NOT NULL COMMENT 'RFC del Revisor 1 de la tesis',
  `idRevisor2` VARCHAR(13) NOT NULL COMMENT 'RFC del Revisor 2 de la tesis',
  `idSinodal1` VARCHAR(13) NOT NULL COMMENT 'RFC del Sinodal 1 de la tesis',
  `idSinodal2` VARCHAR(13) NOT NULL COMMENT 'RFC del Sinodal 2 de la tesis',
  `idSinodal3` VARCHAR(13) NOT NULL COMMENT 'RFC del Sinodal 3 de la tesis',
  `FechaTesis` DATE NULL DEFAULT NULL COMMENT 'Fecha de elaboracion de la tesis',
  `FechaActa` DATE NULL DEFAULT NULL COMMENT 'Fecha del acta de la tesis ',
  `FechaImpresion` DATE NULL DEFAULT NULL COMMENT 'Fecha de impresion de la tesis',
  `EstatusTesis` TINYINT(4) NULL DEFAULT NULL COMMENT '0 propuesta    1 Tesis asignada al alumno',
  PRIMARY KEY (`idTesis`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dbposgrado`.`beca`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbposgrado`.`beca` (
  `idBeca` INT NOT NULL AUTO_INCREMENT COMMENT 'Numero consecutivo incremental para identificar la beca',
  `NomBeca` VARCHAR(100) NOT NULL COMMENT 'Nombre de la beca asignada al alumno CONACYT o COMECYT',
  `TipoBeca` VARCHAR(45) NOT NULL COMMENT 'Tipo de Beca asignada al alumno',
  PRIMARY KEY (`idBeca`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dbposgrado`.`generacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbposgrado`.`generacion` (
  `idGeneracion` INT NOT NULL AUTO_INCREMENT COMMENT 'Numero consecutivo incremental asignado por el sistema para identificar una generacion',
  `NomGeneracion` VARCHAR(80) NOT NULL COMMENT 'Nombre de la generacion',
  `FechaInicio` DATE NOT NULL COMMENT 'Fecha en la que inicio la generacion',
  `FechaFin` DATE NOT NULL COMMENT 'Fecha en la que culmina una generacion',
  `Periodo` VARCHAR(35) NULL DEFAULT NULL,
  PRIMARY KEY (`idGeneracion`))
ENGINE = InnoDB
AUTO_INCREMENT = 12
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dbposgrado`.`programa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbposgrado`.`programa` (
  `idPrograma` INT NOT NULL AUTO_INCREMENT COMMENT 'Numero consecutivo asignado por el sistema para identificar el programa de estudios',
  `ClavePrograma` VARCHAR(20) NOT NULL COMMENT 'Clave del programa de posgrado',
  `NomPrograma` VARCHAR(150) NOT NULL COMMENT 'Nombre del programa ejemplo Maestria en Ciencias de la Ingenieria',
  `DescPrograma` VARCHAR(255) NULL DEFAULT NULL COMMENT 'Descripcion de programa ejmplo Orientado a la investigacion',
  PRIMARY KEY (`idPrograma`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dbposgrado`.`lgac`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbposgrado`.`lgac` (
  `idLGAC` INT NOT NULL COMMENT 'Numero consecutivo incremental asignado por el sistema para identificar una linea general de aplicacion del conocimiento',
  `CveLgac` VARCHAR(20) NOT NULL COMMENT 'Clave de la Linea general de aplicacion del conocimiento',
  `NomLGAC` VARCHAR(150) NOT NULL COMMENT 'Nombre la la linea general de aplicacion del conocimiento ejemplo Diseno de Materiales en Ingenieria Sustentable',
  `DescLgac` VARCHAR(255) NULL COMMENT 'Descripcion de la linea general de aplicacion del conocimiento',
  PRIMARY KEY (`idLGAC`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dbposgrado`.`nacionalidad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbposgrado`.`nacionalidad` (
  `idNacionalidad` INT NOT NULL AUTO_INCREMENT COMMENT 'Numero consecutivo asignado por el sistema para identificar una nacionalidad',
  `NomNacionalidad` VARCHAR(45) NOT NULL COMMENT 'Nombre de la Nacionalidad',
  `ClaveNacionalidad` VARCHAR(5) NULL DEFAULT NULL COMMENT 'Clave que identiifica una nacionalidad ',
  PRIMARY KEY (`idNacionalidad`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dbposgrado`.`alumno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbposgrado`.`alumno` (
  `idAlumno` VARCHAR(13) NOT NULL COMMENT 'RFC del Alumno del alumno',
  `NoControl` VARCHAR(45) NOT NULL COMMENT 'Numero de control asignado al alumno',
  `NomAlumno` VARCHAR(80) NOT NULL COMMENT 'Nombre(s) del alumno',
  `ApPaterno` VARCHAR(80) NOT NULL COMMENT 'Apellido Paterno',
  `ApMaterno` VARCHAR(80) NOT NULL COMMENT 'Apellido Materno',
  `CURP` VARCHAR(20) NOT NULL COMMENT 'Clave Unica de Poblacion',
  `Genero` VARCHAR(15) NOT NULL COMMENT ' F   FEMENINO  M   MASCULINO   O OTRO',
  `FechaNacimiento` DATE NOT NULL COMMENT 'Fecha de Nacimiento del alumno',
  `idNacionalidad` INT NOT NULL COMMENT 'Nacionalidad del esudiante',
  `EstadoCivil` VARCHAR(10) NULL DEFAULT NULL COMMENT 'Soltero y Casado',
  `Calle` VARCHAR(150) NULL,
  `NumInterior` VARCHAR(10) NULL,
  `NumExterior` VARCHAR(10) NULL,
  `Colonia` VARCHAR(150) NULL,
  `idEntidad` INT NOT NULL COMMENT 'identificador de la entidad donde se ubica el domicilio ',
  `idAlcaldia` INT NULL COMMENT 'identificador de la alcaldia  donde se ubica el domicilio ',
  `CodigoPostal` VARCHAR(10) NULL,
  `idPais` INT NULL,
  `Discapacidad` VARCHAR(100) NULL DEFAULT NULL COMMENT ' Discapacidad Visual   Discapacidad Auditiva',
  `TelCelular` VARCHAR(20) NOT NULL COMMENT 'Numero de Telefono celular a 12 digitos incluye lada',
  `TelParticular` VARCHAR(20) NULL DEFAULT NULL COMMENT 'Numero de Telefono particular a 12 digitos incluye lada',
  `EmailInstitucion` VARCHAR(150) NOT NULL COMMENT 'Email asignado por la Institucion ',
  `EmailParticular` VARCHAR(150) NOT NULL COMMENT 'Email personal',
  `Estatus` VARCHAR(3) NOT NULL COMMENT 'AS  Aspirante    A Alumno  E   Egresad   B   Baja',
  `TipoAlumno` VARCHAR(45) NOT NULL COMMENT 'Interno Externo',
  `NomContacto` VARCHAR(150) NULL COMMENT 'Nombre de la persona de contacto del alumno',
  `DireccionContacto` VARCHAR(255) NULL COMMENT 'Direccion del contacto',
  `TelContact` VARCHAR(20) NULL COMMENT 'Telefono celular o particular del contacto del alumno',
  `EmailContacto` VARCHAR(200) NULL COMMENT 'Correo electronico del contacto del alumno',
  `FechaIngreso` DATE NULL DEFAULT NULL COMMENT 'Fecha en la que ingreso el alumno',
  `FechaEgreso` DATE NULL DEFAULT NULL COMMENT 'Fecha de Egreso del alumno',
  `FechaBaja` DATE NULL DEFAULT NULL COMMENT 'Fecha en caso de haberse dado de baja',
  `CVU` VARCHAR(20) NULL,
  `idTipoUsuario` INT NOT NULL,
  `idPrograma` INT NOT NULL COMMENT 'identificador del programa que cursa',
  `idLGAC` INT NOT NULL COMMENT 'identificador de la linea general de aplicacion elegido en el programa',
  `idGeneracion` INT NULL COMMENT 'Identificador de la generacion a la que pertenece el alumno',
  `IdBeca` INT NULL COMMENT 'Identificador de la beca que le fue asignada al alunno',
  `idTesis` INT NULL,
  INDEX `fk_IdIdentifiUsuario_idx` (`idTipoUsuario` ASC),
  INDEX `fk_Alumno_Generacion_idx` (`idGeneracion` ASC),
  INDEX `fk_Alumno_Beca_idx` (`IdBeca` ASC),
  INDEX `fk_AlumnoTesis_idx` (`idTesis` ASC),
  PRIMARY KEY (`idAlumno`),
  INDEX `fk_alumno_programa1_idx` (`idPrograma` ASC),
  INDEX `fk_alumno_lgac1_idx` (`idLGAC` ASC),
  INDEX `fk_alumno_entidadfederativa1_idx` (`idEntidad` ASC),
  INDEX `fk_alumno_nacionalidad1_idx` (`idNacionalidad` ASC),
  CONSTRAINT `fk_AlumnoTesis`
    FOREIGN KEY (`idTesis`)
    REFERENCES `dbposgrado`.`tesis` (`idTesis`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Alumno_Beca`
    FOREIGN KEY (`IdBeca`)
    REFERENCES `dbposgrado`.`beca` (`idBeca`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Alumno_Generacion`
    FOREIGN KEY (`idGeneracion`)
    REFERENCES `dbposgrado`.`generacion` (`idGeneracion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_IdTipoUsuario`
    FOREIGN KEY (`idTipoUsuario`)
    REFERENCES `dbposgrado`.`usuario` (`idTipoUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_alumno_programa1`
    FOREIGN KEY (`idPrograma`)
    REFERENCES `dbposgrado`.`programa` (`idPrograma`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_alumno_lgac1`
    FOREIGN KEY (`idLGAC`)
    REFERENCES `dbposgrado`.`lgac` (`idLGAC`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_alumno_entidadfederativa1`
    FOREIGN KEY (`idEntidad`)
    REFERENCES `dbposgrado`.`entidadfederativa` (`idEntidad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_alumno_nacionalidad1`
    FOREIGN KEY (`idNacionalidad`)
    REFERENCES `dbposgrado`.`nacionalidad` (`idNacionalidad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dbposgrado`.`gradoacademico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbposgrado`.`gradoacademico` (
  `idGradoAcademico` INT NOT NULL AUTO_INCREMENT COMMENT 'Numero consecutivo incremental asignado por el sistema para identificar un grado',
  `Prefijo` VARCHAR(10) NOT NULL COMMENT 'Prefijo del grado de un alumno o docente, ejemplo DR: Doctor',
  `NomGrado` VARCHAR(150) NOT NULL COMMENT 'Nombre del grado de un alumno o docente',
  PRIMARY KEY (`idGradoAcademico`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dbposgrado`.`plaza`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbposgrado`.`plaza` (
  `idPlaza` INT NOT NULL AUTO_INCREMENT COMMENT 'Numero consecutivo asignado por el sistema para identificar una plaza',
  `NomPlaza` VARCHAR(150) NOT NULL COMMENT 'Nombre de la plaza para un docente ejemplo: Profesor Titutal A\\nProfesor Titutal C\\nInvestigador Titular C\\nProfesor Asociado\\n',
  PRIMARY KEY (`idPlaza`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dbposgrado`.`puesto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbposgrado`.`puesto` (
  `idPuesto` INT NOT NULL AUTO_INCREMENT COMMENT 'Numero consecutivo asignado por el sistema para identificar el puesto',
  `NomPuesto` VARCHAR(255) NOT NULL COMMENT 'Nombre del puesto que ocupa un docente ejemplo: Presidente del consejo de posgrado',
  PRIMARY KEY (`idPuesto`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dbposgrado`.`docente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbposgrado`.`docente` (
  `idDocente` VARCHAR(13) NOT NULL COMMENT 'RFC del docente',
  `IdTipoUsuario` INT NOT NULL COMMENT 'Identificador del tipo de usuario viene de la tabla usuario',
  `idPuesto` INT NOT NULL COMMENT 'Numero que identifica al puesto en la tabla Puesto',
  `idGrado` INT NOT NULL COMMENT 'Numero que identifica el grado en la tabla Grado',
  `idPlaza` INT NOT NULL COMMENT 'Numero que identifica la plaza en la tabla de Plaza',
  `TipoDocente` VARCHAR(3) NOT NULL COMMENT 'El tipo docente se identifica con las siguientes claves INT Interno EXT   Externo',
  `NomDocente` VARCHAR(80) NOT NULL COMMENT 'Nombre del docente',
  `ApPaterno` VARCHAR(80) NOT NULL COMMENT 'Apellido paterno del docente',
  `ApMaterno` VARCHAR(80) NOT NULL COMMENT 'Apellido materno del docente',
  `CURP` VARCHAR(20) NOT NULL COMMENT 'Clave unica de poblacion del docente',
  `Genero` VARCHAR(5) NOT NULL COMMENT 'F Femenino  M Masculino  O otro',
  `FechaNacimiento` DATE NOT NULL COMMENT 'Fecha de nacimiento',
  `EstadoCivil` VARCHAR(10) NULL DEFAULT NULL COMMENT 'Soltero Casado',
  `TelCelular` VARCHAR(20) NOT NULL COMMENT 'Numero de celular a 12 digitos incluye lada',
  `TelParticular` VARCHAR(20) NULL DEFAULT NULL COMMENT 'Numero de particula a 12 digitos incluye lada',
  `EmailInstitucion` VARCHAR(150) NULL DEFAULT NULL COMMENT 'Correo electronico asignado por la Institucion',
  `EmailParticular` VARCHAR(150) NOT NULL COMMENT 'Correo electronico personal del docente',
  `Estatus` TINYINT(4) NOT NULL COMMENT 'o Baja 1 Activo',
  `FechaIngreso` DATE NULL DEFAULT NULL COMMENT 'Fecha en la que ingreso a la DEPI',
  `FechaBaja` DATE NULL DEFAULT NULL COMMENT 'Fecha en la que se retiro de la DEPI',
  `NomContacto` VARCHAR(100) NULL,
  `DireccionContacto` VARCHAR(255) NULL,
  `TelContacto` VARCHAR(20) NULL,
  `EmailContacto` VARCHAR(200) NULL,
  INDEX `fk_id_Puesto_idx` (`idPuesto` ASC),
  INDEX `fk_id_Grado_idx` (`idGrado` ASC),
  INDEX `fk_id_Plaza_idx` (`idPlaza` ASC),
  INDEX `fk_idUsuarioDocente_idx` (`IdTipoUsuario` ASC),
  PRIMARY KEY (`idDocente`),
  CONSTRAINT `fk_idGradoDoc`
    FOREIGN KEY (`idGrado`)
    REFERENCES `dbposgrado`.`gradoacademico` (`idGradoAcademico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_idPlazaDoc`
    FOREIGN KEY (`idPlaza`)
    REFERENCES `dbposgrado`.`plaza` (`idPlaza`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_idPuestoDoc`
    FOREIGN KEY (`idPuesto`)
    REFERENCES `dbposgrado`.`puesto` (`idPuesto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_idUsuarioDocente`
    FOREIGN KEY (`IdTipoUsuario`)
    REFERENCES `dbposgrado`.`usuario` (`idTipoUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dbposgrado`.`revista`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbposgrado`.`revista` (
  `idRevista` INT NOT NULL AUTO_INCREMENT COMMENT 'Numero consecutivo asignado por el sistema para identificar una revista',
  `NomRevista` VARCHAR(255) NOT NULL COMMENT 'Nombre de la Revista ejemplo Applied Sciences',
  `TipoRevista` VARCHAR(45) NOT NULL COMMENT 'Tipo de la revista ejemplo JCR',
  PRIMARY KEY (`idRevista`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dbposgrado`.`articulodocente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbposgrado`.`articulodocente` (
  `idArticulo` INT NOT NULL COMMENT 'RFC del alumno o decente al que pertenece el articulo',
  `idRevista` INT NOT NULL,
  `idDocente` VARCHAR(13) NOT NULL,
  `NomArticulo` VARCHAR(255) NOT NULL COMMENT 'Nombre del articulo',
  `AñoPublicacion` DATE NOT NULL COMMENT 'Año en que es publicado el articulo',
  `DOI` VARCHAR(255) NOT NULL COMMENT 'Identificador de Objeto Digital es la URL para acceder a ese recurso en linea (PDF) del articulo',
  `ISSN` VARCHAR(45) NOT NULL COMMENT 'Numero Internacional Normalizado de Publicaciones Seriadas',
  `Numero` INT NOT NULL COMMENT 'Numero del articulo',
  `Volumen` INT NULL DEFAULT NULL COMMENT 'Numero de Volumen del articulo en caso de tenerlo',
  `Paginas` VARCHAR(45) NULL DEFAULT NULL COMMENT 'Numero de Paginas del articulo',
  `idAutorCorrespondiente` VARCHAR(13) NOT NULL COMMENT 'RFC del Autor principal',
  `idAutor2` VARCHAR(13) NOT NULL COMMENT 'RFC del coautor 2',
  `idAutor3` VARCHAR(13) NULL DEFAULT NULL COMMENT 'RFC del coautor 3',
  `idAutor4` VARCHAR(13) NULL DEFAULT NULL COMMENT 'RFC del coautor 4',
  `idAutor5` VARCHAR(13) NULL DEFAULT NULL COMMENT 'RFC del coautor 5',
  `idAutor6` VARCHAR(13) NULL DEFAULT NULL COMMENT 'RFC del coautor 6',
  `idAutor7` VARCHAR(13) NULL DEFAULT NULL COMMENT 'RFC del coautor 7',
  `idAutor8` VARCHAR(13) NULL DEFAULT NULL COMMENT 'RFC del coautor 8',
  `idAutor9` VARCHAR(13) NULL DEFAULT NULL COMMENT 'RFC del coautor 9',
  `idAutor10` VARCHAR(13) NULL DEFAULT NULL COMMENT 'RFC del coautor 10',
  `KeyWord1` VARCHAR(150) NOT NULL COMMENT 'Palabra clave 1 para consultar un articulo',
  `KeyWord2` VARCHAR(150) NOT NULL COMMENT 'Palabra clave 2 para consultar un articulo',
  `KeyWord3` VARCHAR(150) NOT NULL COMMENT 'Palabra clave 3 para consultar un articulo',
  `KeyWord4` VARCHAR(150) NULL DEFAULT NULL COMMENT 'Palabra clave 4 para consultar un articulo',
  `KeyWord5` VARCHAR(150) NULL DEFAULT NULL COMMENT 'Palabra clave 5 para consultar un articulo',
  `ArticuloPDF` BLOB NULL DEFAULT NULL COMMENT 'Documento en formato PDF del articulo',
  PRIMARY KEY (`idArticulo`),
  INDEX `fk_articulodocente_docente1_idx` (`idDocente` ASC),
  INDEX `fk_articulodocente_revista1_idx` (`idRevista` ASC),
  CONSTRAINT `fk_articulodocente_docente1`
    FOREIGN KEY (`idDocente`)
    REFERENCES `dbposgrado`.`docente` (`idDocente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_articulodocente_revista1`
    FOREIGN KEY (`idRevista`)
    REFERENCES `dbposgrado`.`revista` (`idRevista`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dbposgrado`.`tipoasignaura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbposgrado`.`tipoasignaura` (
  `idTipo` INT NOT NULL AUTO_INCREMENT COMMENT 'Numero consecutivo de la materia optativa asignado automaticamente por el sistema',
  `NomTipoAsignatura` VARCHAR(100) NOT NULL COMMENT 'Nombre del tipo de asignatura',
  PRIMARY KEY (`idTipo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dbposgrado`.`asignatura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbposgrado`.`asignatura` (
  `idAsignatura` INT NOT NULL AUTO_INCREMENT COMMENT 'Numero incremetal asignado por el sistem  para identificar una asignatura',
  `idPrograma` INT NOT NULL COMMENT 'Numero consecutivo que asigan el sistema para identificar el programa al que pertenece la asignatura',
  `idTipoAsignatura` INT NOT NULL COMMENT 'Identificador del tipo de asignatura',
  `ClaveAsignatura` VARCHAR(25) NOT NULL COMMENT 'Clave de  la asignatura  por ejemplo MCING 0301',
  `NomAsignatura` VARCHAR(150) NOT NULL COMMENT 'Nombre de la asignatura',
  `Creditos` INT(11) NOT NULL COMMENT 'Numero de creditos que tiene una asignatura',
  `Doc` INT(11) NOT NULL COMMENT 'Horas de docencia de la asignatura',
  `Tips` INT(11) NOT NULL COMMENT 'Horas de trabajo independiente significativo de la asignatura',
  `Tps` INT(11) NOT NULL COMMENT 'Horas de Trabajo profesional supervisado de la asignatura',
  PRIMARY KEY (`idAsignatura`),
  INDEX `fk_id_programa_idx` (`idPrograma` ASC),
  INDEX `fk_id_TipoAsignatura_idx` (`idTipoAsignatura` ASC),
  CONSTRAINT `fk_idProgramaAsig`
    FOREIGN KEY (`idPrograma`)
    REFERENCES `dbposgrado`.`programa` (`idPrograma`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_idTipoAsignatura`
    FOREIGN KEY (`idTipoAsignatura`)
    REFERENCES `dbposgrado`.`tipoasignaura` (`idTipo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dbposgrado`.`calificacionasignatura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbposgrado`.`calificacionasignatura` (
  `idIdentificador` VARCHAR(13) NOT NULL COMMENT 'RFC del alumno',
  `idAsignatura` INT NOT NULL COMMENT 'Numero consecutivo que identifica la asignatura ',
  `Calificacion` INT NOT NULL COMMENT 'Valor numerico para representar la calificacion de la asignatura',
  INDEX `fk_id_Alumno_idx` (`idIdentificador` ASC),
  CONSTRAINT `fk_idAlumnoCal`
    FOREIGN KEY (`idIdentificador`)
    REFERENCES `dbposgrado`.`alumno` (`idAlumno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dbposgrado`.`tipocongreso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbposgrado`.`tipocongreso` (
  `idTipoCongreso` INT NOT NULL AUTO_INCREMENT COMMENT 'Numero consecutivo asignado por el sistema para identificar un tipo de congreso',
  `NomTipoCongreso` VARCHAR(45) NULL DEFAULT NULL COMMENT 'Nombre del tipo de congreso ejemplo Memoria o Conferencia',
  PRIMARY KEY (`idTipoCongreso`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dbposgrado`.`congreso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbposgrado`.`congreso` (
  `idCongreso` INT NOT NULL AUTO_INCREMENT COMMENT 'Numero consecutivo incremental asignado por el sistema para identificar un congreso',
  `NomCongreso` VARCHAR(255) NOT NULL COMMENT 'Nombre del congreso',
  `TituloTrabajo` VARCHAR(255) NOT NULL COMMENT 'Titulo del trabajo expuesto en el congreso',
  `idTipoCongreso` INT NOT NULL COMMENT 'Numero que identifica el tipo de congreso viene de la tabla TipoCongreso ejemplo Memoria o Conferencia',
  `ISSN` VARCHAR(45) NOT NULL COMMENT 'Numero Internacional Normalizado de Publicaciones Seriadas',
  `DOI` VARCHAR(45) NOT NULL COMMENT 'URL donde se toma el trabajo presentado en el congreso',
  `idRevista` INT NOT NULL COMMENT 'Numero que identifica a la revista viene de la tabla Revista',
  `Volumen` INT NULL DEFAULT NULL COMMENT 'Numero de Volumen del congreso',
  `FechaCongreso` DATE NOT NULL COMMENT 'Fecha en el que se lleva a cabo el congreso',
  `LugarCongreso` VARCHAR(150) NOT NULL COMMENT 'Lugar donde se lleva a cabo el congreso',
  `Paginas` VARCHAR(45) NULL DEFAULT NULL COMMENT 'Numero de paginas del trabajo presentado en el congreso',
  `Keyword1` VARCHAR(45) NOT NULL COMMENT 'Palabra clave 1 en relacion al titulo del congreso',
  `Keyword2` VARCHAR(45) NULL DEFAULT NULL COMMENT 'Palabra clave 2 en relacion al titulo del congreso',
  `Keyword3` VARCHAR(45) NULL DEFAULT NULL COMMENT 'Palabra clave 3 en relacion al titulo del congreso',
  `Keyword4` VARCHAR(45) NULL DEFAULT NULL COMMENT 'Palabra clave 4 en relacion al titulo del congreso',
  `idAutor1` VARCHAR(13) NOT NULL COMMENT 'RFC 1 del autor del congreso',
  `idAutor2` VARCHAR(13) NULL DEFAULT NULL COMMENT 'RFC 2  del autor del congreso',
  `idAutor3` VARCHAR(13) NULL DEFAULT NULL COMMENT 'RFC 3  del autor del congreso',
  `idAutor4` VARCHAR(13) NULL DEFAULT NULL COMMENT 'RFC 4  del autor del congreso',
  `idAutor5` VARCHAR(13) NULL DEFAULT NULL COMMENT 'RFC 5  del autor del congreso',
  `idAutor6` VARCHAR(13) NULL DEFAULT NULL COMMENT 'RFC 6  del autor del congreso',
  `idAutor7` VARCHAR(13) NULL DEFAULT NULL COMMENT 'RFC 7  del autor del congreso',
  `CongresoPDF` BLOB NULL DEFAULT NULL COMMENT 'Archivo en formato PDF del trabajo expuesto en el congreso',
  PRIMARY KEY (`idCongreso`),
  INDEX `fk_id_TipoCongreso_idx` (`idTipoCongreso` ASC),
  CONSTRAINT `fk_idTipoCongreso`
    FOREIGN KEY (`idTipoCongreso`)
    REFERENCES `dbposgrado`.`tipocongreso` (`idTipoCongreso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dbposgrado`.`nivelsni`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbposgrado`.`nivelsni` (
  `IdNivelSNI` INT NOT NULL AUTO_INCREMENT COMMENT 'Numero consecutivo asignado por el sistema para aidentificar un nivel del sistema nacional de investigadores \\n',
  `NomNivelSNI` VARCHAR(100) NOT NULL COMMENT ' I II III Candidato Emerito',
  PRIMARY KEY (`IdNivelSNI`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dbposgrado`.`curriculumdocente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbposgrado`.`curriculumdocente` (
  `idDocente` VARCHAR(13) NOT NULL,
  `CVU` VARCHAR(10) NOT NULL COMMENT 'Numero unico asignado por CONACYT  a cada individuo que trabaja en actividades relacionadas con la investigacion y la ciencia en Mexico',
  `ORCID` VARCHAR(25) NOT NULL COMMENT 'identificador Abierto de Investigador y Colaborador, en español)\\nAsignado por el sistema global de identificación de investigadores',
  `ExpedienteSNI` VARCHAR(10) NOT NULL COMMENT 'Numero de Expediente del Sistema Nacional de Investigadores (SNI)',
  `idNivelSNI` INT NOT NULL COMMENT 'Es la clave del nivel o categoria en el Sistema Nacional de Investigadores (SNI) de un pais.',
  `FechaIngresoSNI` DATE NOT NULL COMMENT 'Fecha en la que ingreso al SNI',
  `FechaVigenciaSNI` DATE NOT NULL COMMENT 'Fecha de vigencia dentro del Sistema Nacional de Investigadores',
  `NombramientoSNI` VARCHAR(80) NOT NULL COMMENT 'Descripcion del nombramiento dentro del SNI',
  `NomIntitucionL` VARCHAR(80) NOT NULL COMMENT 'Nombre de la institucion en la que estudio la licenciatura el alumno o docente',
  `EspecialidadL` VARCHAR(45) NOT NULL COMMENT 'Nombre de la especialidad que curso el alumno o docente en la licenciatura',
  `CedulaL` VARCHAR(25) NOT NULL COMMENT 'Numero de cedula de la licenciatura cursada por el alumno o docente ',
  `FechaInicioL` DATE NOT NULL COMMENT 'Fecha en la que inicio los estudios de licenciatura el alumno o docente',
  `FechaFinL` DATE NOT NULL COMMENT 'Fecha de termino de la licenciatura del alumno o docente',
  `PaisL` VARCHAR(45) NOT NULL COMMENT 'Pais donde curso la licenciatura el alumno o docente',
  `NomIntitucionM` VARCHAR(80) NULL DEFAULT NULL COMMENT 'Nombre de la institucion donde curso la maestria el alumno o docente',
  `EspecialidadM` VARCHAR(45) NULL DEFAULT NULL COMMENT 'Nombre de la especialidad de la maestria del alumno o docente',
  `CedulaM` VARCHAR(25) NULL DEFAULT NULL COMMENT 'Numero de cedula de la maestira del alumno o docente',
  `FechaInicioM` DATE NULL DEFAULT NULL COMMENT 'Fecha en la que incio la maestria el alumno o docente',
  `FechaFinM` DATE NULL DEFAULT NULL COMMENT 'Fecha en la que termino la maestria el alumno o docente',
  `PaisM` VARCHAR(45) NULL DEFAULT NULL COMMENT 'Pais donde curso la maestria el alumno o docente',
  `NomIntitucionD` VARCHAR(80) NULL DEFAULT NULL COMMENT 'Nombre de la institucion sonde curso el doctorado el alumno o docente',
  `EspecialidadD` VARCHAR(45) NULL DEFAULT NULL COMMENT 'Nombre de la especialidad del doctorado del alumno o docente',
  `CedulaD` VARCHAR(25) NULL DEFAULT NULL COMMENT 'Numero de cedula del doctorado del alumno o docente',
  `FechaInicioD` DATE NULL DEFAULT NULL COMMENT 'Fecha en la que inicio estudios del doctorado',
  `FechaFinD` DATE NULL DEFAULT NULL COMMENT 'Fecha en la que finalizo estudios de doctorado del alumno o docente',
  `PaisD` VARCHAR(45) NULL DEFAULT NULL COMMENT 'Pais donde curso el doctorado el alumno o docente',
  `idLGAC` INT NULL DEFAULT NULL COMMENT 'Numero que identifica la linea general de aplicacion del conocimiento, viene de la tabla LGAC',
  `Experiencia` VARCHAR(255) NULL DEFAULT NULL COMMENT 'Texto libre para redactar la experiencia laboral o de investigacion del alumno o docente',
  `Adscripcion` VARCHAR(45) NULL DEFAULT NULL COMMENT 'Nombre de la Adscripcion a la que pertenece el alumno o docente ejemplo: Instituto Tecnologico de Tlalnepantla',
  `idplaza` VARCHAR(45) NULL DEFAULT NULL COMMENT 'Numero que identifica la plaza que ocupa un alumno o docente, viene de la tabla Plaza',
  `Nombramiento` VARCHAR(45) NULL DEFAULT NULL COMMENT 'Descripcion del nombramiento del alumno o docente',
  `PorcentajeIdioma` INT NULL DEFAULT NULL,
  INDEX `fk_id_NivelSNI_idx` (`idNivelSNI` ASC),
  INDEX `fk_curriculumdocente_docente1_idx` (`idDocente` ASC),
  CONSTRAINT `fk_idNivelSNICur`
    FOREIGN KEY (`idNivelSNI`)
    REFERENCES `dbposgrado`.`nivelsni` (`IdNivelSNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_curriculumdocente`
    FOREIGN KEY (`idDocente`)
    REFERENCES `dbposgrado`.`docente` (`idDocente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dbposgrado`.`documento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbposgrado`.`documento` (
  `idDocumento` INT NOT NULL AUTO_INCREMENT COMMENT 'Numero del documento (incremental)',
  `NomDocumento` VARCHAR(150) NOT NULL COMMENT 'Nombre del documento ejemplo: Acta de nacimiento',
  `TipoDocumento` VARCHAR(45) NOT NULL COMMENT 'Tipo Obligatorio, Opcional, ',
  PRIMARY KEY (`idDocumento`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dbposgrado`.`documentoalumno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbposgrado`.`documentoalumno` (
  `idAlumno` VARCHAR(13) NOT NULL COMMENT 'RFC del alumno o docente al que pertenece el documento',
  `idDocumento` INT NOT NULL COMMENT 'Numero que identifica al documento, ejemplo 1 Acta de nacimiento',
  `Valor` VARCHAR(45) NOT NULL COMMENT 'Valor numero de un documento , por ejemplo: Folio para un acta de nacimiento, promedio para un certificado',
  `FechaDocumento` DATE NOT NULL COMMENT 'Fecha en la que se expide el documento',
  `FechaEntrega` DATE NULL DEFAULT NULL COMMENT 'Fecha en la que entrego el documento al area de posgrado',
  `DocumentoPDF` BLOB NULL DEFAULT NULL COMMENT 'Archivo en formato PDF, del documento ',
  INDEX `fk_id_Alumno_idx` (`idAlumno` ASC),
  INDEX `fk_id_Documento_idx` (`idDocumento` ASC),
  CONSTRAINT `fk_idAlumnoDocAlumDoc`
    FOREIGN KEY (`idAlumno`)
    REFERENCES `dbposgrado`.`alumno` (`idAlumno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_idDocumentoDocAlumDoc`
    FOREIGN KEY (`idDocumento`)
    REFERENCES `dbposgrado`.`documento` (`idDocumento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dbposgrado`.`idioma`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbposgrado`.`idioma` (
  `idIdioma` INT NOT NULL AUTO_INCREMENT COMMENT 'Numero consecutivo asignado por el sistema para identificar el idioma',
  `NomIdioma` VARCHAR(45) NOT NULL DEFAULT 'Ingles' COMMENT 'Nobre del idioma',
  PRIMARY KEY (`idIdioma`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dbposgrado`.`pais`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbposgrado`.`pais` (
  `idPais` INT NOT NULL AUTO_INCREMENT COMMENT 'Numero consecutivo asignado por el sistema para identificar el Pais, ejemplo 1: Mexico',
  `NomPais` VARCHAR(45) NOT NULL COMMENT 'Nombre del Pais: ejemplo Mexico',
  `ClavePais` VARCHAR(5) NOT NULL COMMENT 'Clave que identifica al pais: ejemplo MEX',
  PRIMARY KEY (`idPais`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dbposgrado`.`patente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbposgrado`.`patente` (
  `idPatente` INT NOT NULL AUTO_INCREMENT COMMENT 'Numero consecutivo asignado al registro de patente',
  `NomPatente` VARCHAR(255) NOT NULL COMMENT 'Nombre de la patente',
  `TipoPatente` VARCHAR(45) NOT NULL COMMENT 'Tipo de patente',
  `Estatus` VARCHAR(100) NOT NULL COMMENT 'Estatus en el que se encuentra la patente ',
  `NumTramite` VARCHAR(45) NOT NULL COMMENT 'Numero del tramite de la patente',
  `FechaSolicitud` DATE NOT NULL COMMENT 'Fecha de solicitud de la patente',
  `FechaRegistro` DATE NOT NULL COMMENT 'Fecha de registro de la patente',
  `NumRegistro` VARCHAR(45) NOT NULL COMMENT 'Numero de registro de la patente',
  `NumExpediente` VARCHAR(45) NOT NULL COMMENT 'Numero de expediente ',
  `Clasificacion` VARCHAR(45) NOT NULL COMMENT 'Clasificacion de la patente',
  `Año` VARCHAR(5) NOT NULL COMMENT 'Año de la patente',
  `Pais` VARCHAR(45) NOT NULL COMMENT 'Pais donde se desarrolla la patente',
  `idColaborador1` VARCHAR(13) NOT NULL COMMENT 'Colaborador 1 de la patente',
  `idColaborador2` VARCHAR(13) NULL DEFAULT NULL COMMENT 'Colaborador 2 de la patente',
  `idColaborador3` VARCHAR(13) NULL DEFAULT NULL COMMENT 'Colaborador 3 de la patente',
  `idColaborador4` VARCHAR(13) NULL DEFAULT NULL COMMENT 'Colaborador 4 de la patente',
  `idColaborador5` VARCHAR(13) NULL DEFAULT NULL COMMENT 'Colaborador 5 de la patente',
  `idColaborador6` VARCHAR(13) NULL DEFAULT NULL COMMENT 'Colaborador 6 de la patente',
  `idColaborador7` VARCHAR(13) NULL DEFAULT NULL COMMENT 'Colaborador 7 de la patente',
  `PatentePDF` BLOB NULL DEFAULT NULL COMMENT 'Archivo en formato PDF de la patente',
  PRIMARY KEY (`idPatente`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dbposgrado`.`permiso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbposgrado`.`permiso` (
  `idPermiso` INT NOT NULL AUTO_INCREMENT COMMENT 'Numero consecutivo asignado por el sistema para identificar un permiso del sistema',
  `NomPermiso` VARCHAR(45) NOT NULL COMMENT 'Nombre del permiso  ejemplo Lectura Escritura Administrador',
  `Descripcion` VARCHAR(255) NOT NULL COMMENT 'Descripción detallada del permiso para que los administradores o usuarios comprendan mejor su significado',
  `FechaCreacion` DATE NOT NULL COMMENT 'Fecha en la que se crea el permiso',
  PRIMARY KEY (`idPermiso`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8
COMMENT = 'ermi';


-- -----------------------------------------------------
-- Table `dbposgrado`.`usuariopermiso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbposgrado`.`usuariopermiso` (
  `idUsuario` VARCHAR(13) NOT NULL COMMENT 'RFC del usuario',
  `idPermiso` INT NOT NULL COMMENT 'Numero que identifica al permiso otorgado al usuario',
  INDEX `fk_id_Permiso_idx` (`idPermiso` ASC),
  INDEX `fk_id_Usuario_idx` (`idUsuario` ASC),
  CONSTRAINT `fk_idPermisoUsuPer`
    FOREIGN KEY (`idPermiso`)
    REFERENCES `dbposgrado`.`permiso` (`idPermiso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_idUsuarioUsuPer`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `dbposgrado`.`usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dbposgrado`.`curriculumalumno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbposgrado`.`curriculumalumno` (
  `idAlumno` VARCHAR(13) NOT NULL COMMENT 'RFC del alumno',
  `NomIntitucionL` VARCHAR(150) NOT NULL COMMENT 'Nombre de la institucion en la que estudio la licenciatura el alumno',
  `EspecialidadL` VARCHAR(100) NOT NULL COMMENT 'Nombre de la especialidad que curso el alumno en la licenciatura',
  `PromedioL` INT NULL COMMENT 'Promedio de la licenciatura',
  `CedulaL` VARCHAR(40) NOT NULL COMMENT 'Numero de cedula de la licenciatura cursada por el alumno ',
  `FechaInicioL` DATE NOT NULL COMMENT 'Fecha en la que inicio los estudios de licenciatura el alumno ',
  `FechaFinL` DATE NOT NULL COMMENT 'Fecha de termino de la licenciatura del alumno',
  `PaisL` VARCHAR(45) NOT NULL COMMENT 'Pais donde curso la licenciatura el alumno',
  `NomIntitucionM` VARCHAR(150) NULL DEFAULT NULL COMMENT 'Nombre de la institucion donde curso la maestria el alumno',
  `PromedioM` INT NULL COMMENT 'Promedio obtenido en la maestria ',
  `EspecialidadM` VARCHAR(100) NULL DEFAULT NULL COMMENT 'Nombre de la especialidad de la maestria del alumno',
  `CedulaM` VARCHAR(40) NULL DEFAULT NULL COMMENT 'Numero de cedula de la maestria del alumno ',
  `FechaInicioM` DATE NULL DEFAULT NULL COMMENT 'Fecha en la que incio la maestria el alumno',
  `FechaFinM` DATE NULL DEFAULT NULL COMMENT 'Fecha en la que termino la maestria el alumno',
  `PaisM` VARCHAR(45) NULL DEFAULT NULL COMMENT 'Pais donde curso la maestria el alumno',
  `NomPublicacion1` VARCHAR(255) NULL DEFAULT NULL COMMENT 'Nombre de la publicacion 1 en caso de tener',
  `NomPublicacion2` VARCHAR(255) NULL DEFAULT NULL COMMENT 'Titulo de la publicacion 2 en caso de tener',
  `ExperienciaEmpresa` VARCHAR(200) NULL DEFAULT NULL COMMENT 'Nombre de la empresa donde aquirio experiencia',
  `ExperienciaPeriodo` VARCHAR(50) NULL DEFAULT NULL COMMENT 'Periodo en el que obtuvo la experiencia el alumno ',
  `ExperienciaActividad` VARCHAR(255) NULL COMMENT 'Texto libre para redactar las actividadees realizadas para obtener experiencia',
  `idIdioma` INT NULL COMMENT 'Numero que identifica el idioma que domina',
  `PorcentajeIdioma` INT NULL COMMENT 'Porcentaje del idioma ',
  INDEX `fk_curriculumalumno_alumno1_idx` (`idAlumno` ASC),
  CONSTRAINT `fk_curriculumalumno_alumno1`
    FOREIGN KEY (`idAlumno`)
    REFERENCES `dbposgrado`.`alumno` (`idAlumno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dbposgrado`.`documentodocente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbposgrado`.`documentodocente` (
  `IdDocente` VARCHAR(13) NOT NULL COMMENT 'RFC del docente ',
  `idDocumento` INT NOT NULL,
  `Valor` VARCHAR(45) NOT NULL COMMENT 'Valor numero de un documento , por ejemplo: Folio para un acta de nacimiento, promedio para un certificado',
  `FechaDocumento` DATE NOT NULL COMMENT 'Fecha en la que se expide el documento',
  `FechaEntrega` DATE NULL DEFAULT NULL COMMENT 'Fecha en la que entrego el documento al area de posgrado',
  `DocumentoPDF` BLOB NULL DEFAULT NULL COMMENT 'Archivo en formato PDF, del documento ',
  INDEX `fk_documentodocente_documento1_idx` (`idDocumento` ASC),
  CONSTRAINT `fk_DocumentoDocente`
    FOREIGN KEY (`IdDocente`)
    REFERENCES `dbposgrado`.`docente` (`idDocente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_documentodocente_documento1`
    FOREIGN KEY (`idDocumento`)
    REFERENCES `dbposgrado`.`documento` (`idDocumento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dbposgrado`.`articuloalumno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbposgrado`.`articuloalumno` (
  `idArticulo` INT NOT NULL COMMENT 'RFC del alumno o decente al que pertenece el articulo',
  `idAlumno` VARCHAR(13) NOT NULL,
  `NomArticulo` VARCHAR(255) NOT NULL COMMENT 'Nombre del articulo',
  `AñoPublicacion` DATE NOT NULL COMMENT 'Año en que es publicado el articulo',
  `DOI` VARCHAR(255) NOT NULL COMMENT 'Identificador de Objeto Digital es la URL para acceder a ese recurso en linea (PDF) del articulo',
  `ISSN` VARCHAR(45) NOT NULL COMMENT 'Numero Internacional Normalizado de Publicaciones Seriadas',
  `Numero` INT NOT NULL COMMENT 'Numero del articulo',
  `Volumen` INT NULL DEFAULT NULL COMMENT 'Numero de Volumen del articulo en caso de tenerlo',
  `Paginas` VARCHAR(45) NULL DEFAULT NULL COMMENT 'Numero de Paginas del articulo',
  `idAutorCorrespondiente` VARCHAR(13) NOT NULL COMMENT 'RFC del Autor principal',
  `idAutor2` VARCHAR(13) NOT NULL COMMENT 'RFC del coautor 2',
  `idAutor3` VARCHAR(13) NULL DEFAULT NULL COMMENT 'RFC del coautor 3',
  `idAutor4` VARCHAR(13) NULL DEFAULT NULL COMMENT 'RFC del coautor 4',
  `idAutor5` VARCHAR(13) NULL DEFAULT NULL COMMENT 'RFC del coautor 5',
  `idAutor6` VARCHAR(13) NULL DEFAULT NULL COMMENT 'RFC del coautor 6',
  `idAutor7` VARCHAR(13) NULL DEFAULT NULL COMMENT 'RFC del coautor 7',
  `idAutor8` VARCHAR(13) NULL DEFAULT NULL COMMENT 'RFC del coautor 8',
  `idAutor9` VARCHAR(13) NULL DEFAULT NULL COMMENT 'RFC del coautor 9',
  `idAutor10` VARCHAR(13) NULL DEFAULT NULL COMMENT 'RFC del coautor 10',
  `KeyWord1` VARCHAR(150) NOT NULL COMMENT 'Palabra clave 1 para consultar un articulo',
  `KeyWord2` VARCHAR(150) NOT NULL COMMENT 'Palabra clave 2 para consultar un articulo',
  `KeyWord3` VARCHAR(150) NOT NULL COMMENT 'Palabra clave 3 para consultar un articulo',
  `KeyWord4` VARCHAR(150) NULL DEFAULT NULL COMMENT 'Palabra clave 4 para consultar un articulo',
  `KeyWord5` VARCHAR(150) NULL DEFAULT NULL COMMENT 'Palabra clave 5 para consultar un articulo',
  `ArticuloPDF` BLOB NULL DEFAULT NULL COMMENT 'Documento en formato PDF del articulo',
  PRIMARY KEY (`idArticulo`),
  INDEX `fk_articuloalumno_alumno1_idx` (`idAlumno` ASC),
  CONSTRAINT `fk_articuloalumno_alumno1`
    FOREIGN KEY (`idAlumno`)
    REFERENCES `dbposgrado`.`alumno` (`idAlumno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dbposgrado`.`ProgramaLgac`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbposgrado`.`ProgramaLgac` (
  `idPrograma` INT NOT NULL,
  `idLGAC` INT NOT NULL,
  INDEX `fk_ProgramaLgac_programa1_idx` (`idPrograma` ASC),
  INDEX `fk_ProgramaLgac_lgac1_idx` (`idLGAC` ASC),
  CONSTRAINT `fk_ProgramaLgac_programa1`
    FOREIGN KEY (`idPrograma`)
    REFERENCES `dbposgrado`.`programa` (`idPrograma`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ProgramaLgac_lgac1`
    FOREIGN KEY (`idLGAC`)
    REFERENCES `dbposgrado`.`lgac` (`idLGAC`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `dbposgrado` ;

-- -----------------------------------------------------
-- procedure ConsultaUsuario
-- -----------------------------------------------------

DELIMITER $$
USE `dbposgrado`$$
$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure InsertAspirante
-- -----------------------------------------------------

DELIMITER $$
USE `dbposgrado`$$
CREATE DEFINER=`` PROCEDURE `InsertAspirante`(IN RFC varchar(13), IN nocontrol varchar(13), IN nombre varchar(80), IN appaterno varchar(80),
IN apmaterno varchar(80), IN CURP varchar(20), IN genero varchar(5) , IN fechaNac date , IN EstadoCivil varchar(10), IN discapacidad varchar(80),
IN celular varchar(20),IN TelParticular varchar(20), IN EmailInstitucion varchar(150), IN EmailParticular varchar(150), INestatus varchar(3),
IN FechaIngreso date ,IN nacionalidad INT,programa INT)
BEGIN
	INSERT INTO `dbposgrado`.`alumno`
	(`idIdentificador`,`idTipoUsuario`,`NoControl`,`NomAlumno`,`ApPaterno`,`ApMaterno`,`CURP`,`Genero`,`FechaNacimiento`,
	`EstadoCivil`,`Discapacidad`,`TelCelular`,`TelParticular`,`EmailInstitucion`,`EmailParticular`,`Estatus`,`TipoAlumno`, 
    `FechaIngreso`,	`FechaEgreso`,`FechaBaja`,`idGeneracion`,`IdBeca`,`idNacionalidad`,`idPrograma`,`idTesis`)
	VALUES
	(RFC,10,'XXXXXXXXX',nombre,appaterno,apmaterno,CURP,genero,fechaNac,EstadoCivil,Discapacidad,Celular, EmailInstitucion,
	EmailParticular,estatus,null,FechaIngreso,null,null,null,null,nacionalidad,programa,null);

END$$

DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
