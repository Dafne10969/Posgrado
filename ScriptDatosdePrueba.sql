-- DATOS DE PRUEBA PARA LA TABLA USUARIO 

INSERT INTO `dbposgrado`.`tipousuario` VALUES (1,"Administrador","Este tipo de usuario tiene acceso a toda la aplicacion");
INSERT INTO `dbposgrado`.`tipousuario` VALUES (2,"Coordinador","Este tipo de usuario tiene acceso a toda la aplicacion");
-- Select * from dbposgrado.tipousuario

INSERT INTO `dbposgrado`.`usuario` VALUES ("MOPA740518PQA",1,"cereal",now(),now(),1);
INSERT INTO `dbposgrado`.`usuario` VALUES ("LACM551230UX9",2,"drLazo",now(),now(),1);
INSERT INTO `dbposgrado`.`usuario` VALUES ("PAGL770812",1,"DraLaura",now(),now(),1);
INSERT INTO `dbposgrado`.`usuario` VALUES ("SOMD921706",2,"INACTIVO",now(),now(),0);
-- Select * from dbposgrado.usuario

INSERT INTO `dbposgrado`.`alerta` VALUES (1,"Entegar la lista de Aspirantes a Servicios Escolares a mas tardar el:",1,2,now(),DATE_ADD(now(), INTERVAL 2 MONTH),3,NOW(),"MOPA740518PQA");
INSERT INTO `dbposgrado`.`alerta` VALUES (2,"Entrega de Formato de Evaluacion de Desempaño ",1,2,now(),DATE_ADD(NOW(), INTERVAL 2 MONTH),3,NOW(),"MOPA740518PQA");
INSERT INTO `dbposgrado`.`alerta` VALUES (3,"Segundo seguimiento del gestion del curso ",1,2,now(),DATE_ADD(now(), INTERVAL 2 MONTH),3,NOW(),"MOPA740518PQA");
INSERT INTO `dbposgrado`.`alerta` VALUES (4,"Preparar Documentacion para Auditoria Interna de seguimiento ISO 9001:2015 e ISO 14001",1,2,now(),DATE_ADD(now(), INTERVAL 2 MONTH),2,NOW(),"MOPA740518PQA");
-- Select * from dbposgrado.alerta

INSERT INTO `dbposgrado`.`alertausuario` VALUES ("MOPA740518PQA",1);
INSERT INTO `dbposgrado`.`alertausuario` VALUES ("MOPA740518PQA",2);
INSERT INTO `dbposgrado`.`alertausuario` VALUES ("LACM551230UX9",1);
INSERT INTO `dbposgrado`.`alertausuario` VALUES ("LACM551230UX9",2);
INSERT INTO `dbposgrado`.`alertausuario` VALUES ("LACM551230UX9",3);
INSERT INTO `dbposgrado`.`alertausuario` VALUES ("LACM551230UX9",4);
INSERT INTO `dbposgrado`.`alertausuario` VALUES ("PAGL770812",3);
INSERT INTO `dbposgrado`.`alertausuario` VALUES ("PAGL770812",4);

-- select * from dbposgrado.alertausuario


INSERT INTO `dbposgrado`.`permiso` VALUES (1, "Lectura","Acceso solo de lectura a los diferentes modilos de la pagina",now());
INSERT INTO `dbposgrado`.`permiso` VALUES (2, "Escritura","Puede realizar consultas y dar de alta y modificar informacion",now());
INSERT INTO `dbposgrado`.`permiso` VALUES (3, "Administrador","Acceso solo de lectura a los diferentes modilos de la pagina",now());
-- select * from dbposgrado.permiso
 

INSERT INTO `dbposgrado`.`usuariopermiso` VALUES ("MOPA740518PQA",3);
INSERT INTO `dbposgrado`.`usuariopermiso` VALUES ("PAGL770812",1);
INSERT INTO `dbposgrado`.`usuariopermiso` VALUES ("LACM551230UX9",2);
-- Select * from dbposgrado.usuariopermiso

INSERT INTO `dbposgrado`.`programa` VALUES (1,"MCING-2011-45","Maestria en Ciencias de la Ingenieria","Orientado a la investigación");
INSERT INTO `dbposgrado`.`programa` VALUES (2,"","Doctorado en Ciencias de la Ingenieria","Orientado a la investigación");
INSERT INTO `dbposgrado`.`programa` VALUES (3,"","Maestria en Administracion","Profesionalizante");
-- Select * from dbposgrado.programa


INSERT INTO `dbposgrado`.`lgac` VALUES (1,"SUP-01","Ingeniería de Superficies");
INSERT INTO `dbposgrado`.`lgac` VALUES (2,"MAT-01","Diseño de Materiales en Ingeniería SustentableNomLGAC");
INSERT INTO `dbposgrado`.`lgac` VALUES (3,"COMP-01","Ingeniería de Cómputo");
INSERT INTO `dbposgrado`.`lgac` VALUES (2,1,"Ingeniería de Cómputo");
INSERT INTO `dbposgrado`.`lgac` VALUES (2,2,"Ingeniería de Superficies en materiales");
-- Select * from dbposgrado.lgac

INSERT INTO `dbposgrado`.`generacion` VALUES (1,"Primera",'2017-02-20','2019-02-19',"Ene-Jun");
INSERT INTO `dbposgrado`.`generacion` VALUES (2,"Segunda",'2018-02-20','2020-02-20',"Ene-Jun");
INSERT INTO `dbposgrado`.`generacion` VALUES (3,"Tercera",'2020-02-20','2021-02-20',"Ene-Jun");
INSERT INTO `dbposgrado`.`generacion` VALUES (4,"Cuarta",'2020-02-20','2022-02-20',"Ene-Jun");
INSERT INTO `dbposgrado`.`generacion` VALUES (5,"Quinta",'2020-08-20','2019-12-23',"Ago-Dic");
INSERT INTO `dbposgrado`.`generacion` VALUES (6,"Sexta",'2021-02-20','2023-02-23',"Ene-Jun");
INSERT INTO `dbposgrado`.`generacion` VALUES (7,"Septima",'2021-08-20','2019-12-24',"Ago-Dic");
INSERT INTO `dbposgrado`.`generacion` VALUES (8,"Octava",'2020-02-20','2024-02-20',"Ene-Jun");
INSERT INTO `dbposgrado`.`generacion` VALUES (9,"Novena",'2022-08-20','2019-12-25',"Ago-Dic");
INSERT INTO `dbposgrado`.`generacion` VALUES (10,"Decima",'2023-02-20','2019-02-25',"Ene-Jun");
INSERT INTO `dbposgrado`.`generacion` VALUES (11,"Decima Primera",'2023-08-20','2026-12-20',"Ene-Jun");
-- Select * from  dbposgrado.generacion 

INSERT INTO `dbposgrado`.`Beca` VALUES (1,"CONACYT","Beca otorgada por CONACYT");
INSERT INTO `dbposgrado`.`Beca` VALUES (2,"COMECYT","Beca otorgada por COMECYT");
-- Select * from  dbposgrado.Beca 

INSERT INTO `dbposgrado`.`entidadfederativa` VALUES (1,"AGUASCALIENTES","AGS");
INSERT INTO `dbposgrado`.`entidadfederativa` VALUES (2,"BAJA CALIFORNIA","BC");
INSERT INTO `dbposgrado`.`entidadfederativa` VALUES (3,"BAJA CALIFORNIA SUR","BCS");
INSERT INTO `dbposgrado`.`entidadfederativa` VALUES (4,"CAMPECHE","CAMP");
INSERT INTO `dbposgrado`.`entidadfederativa` VALUES (5,"COAHUILA DE ZARAGOZA","COAH");
INSERT INTO `dbposgrado`.`entidadfederativa` VALUES (6,"COLIMA","COL");
INSERT INTO `dbposgrado`.`entidadfederativa` VALUES (7,"CHIAPAS","CHIS");
INSERT INTO `dbposgrado`.`entidadfederativa` VALUES (8,"CHIHUAHUA","CHIH");
INSERT INTO `dbposgrado`.`entidadfederativa` VALUES (9,"CIUDAD DE MÉXICO","CDMX");
INSERT INTO `dbposgrado`.`entidadfederativa` VALUES (10,"DURANGO","DGO");
INSERT INTO `dbposgrado`.`entidadfederativa` VALUES (11,"GUANAJUATO","GTO");
INSERT INTO `dbposgrado`.`entidadfederativa` VALUES (12,"GUERRERO","GRO");
INSERT INTO `dbposgrado`.`entidadfederativa` VALUES (13,"HIDALGO","HGO");
INSERT INTO `dbposgrado`.`entidadfederativa` VALUES (14,"JALISCO","JAL");
INSERT INTO `dbposgrado`.`entidadfederativa` VALUES (15,"MÉXICO","MEX");
INSERT INTO `dbposgrado`.`entidadfederativa` VALUES (16,"MICHOACÁN DE OCAMPO","MICH");
INSERT INTO `dbposgrado`.`entidadfederativa` VALUES (17,"MORELOS","MOR");
INSERT INTO `dbposgrado`.`entidadfederativa` VALUES (18,"NAYARIT","NAY");
INSERT INTO `dbposgrado`.`entidadfederativa` VALUES (19,"NUEVO LEÓN","NL");
INSERT INTO `dbposgrado`.`entidadfederativa` VALUES (20,"OAXACA","OAX");
INSERT INTO `dbposgrado`.`entidadfederativa` VALUES (21,"PUEBLA","PUE");
INSERT INTO `dbposgrado`.`entidadfederativa` VALUES (22,"QUERÉTARO","QRO");
INSERT INTO `dbposgrado`.`entidadfederativa` VALUES (23,"QUINTANA ROO","QROO");
INSERT INTO `dbposgrado`.`entidadfederativa` VALUES (24,"SAN LUIS POTOSÍ","SLP");
INSERT INTO `dbposgrado`.`entidadfederativa` VALUES (25,"SINALOA","SIN");
INSERT INTO `dbposgrado`.`entidadfederativa` VALUES (26,"SONORA","SON");
INSERT INTO `dbposgrado`.`entidadfederativa` VALUES (27,"TABASCO","TAB");
INSERT INTO `dbposgrado`.`entidadfederativa` VALUES (28,"TAMAULIPAS","TAMPS");
INSERT INTO `dbposgrado`.`entidadfederativa` VALUES (29,"TLAXCALA","TLAX");
INSERT INTO `dbposgrado`.`entidadfederativa` VALUES (30,"VERACRUZ","VER");
INSERT INTO `dbposgrado`.`entidadfederativa` VALUES (31,"YUCATÁN","YUC");
INSERT INTO `dbposgrado`.`entidadfederativa` VALUES (32,"ZACATECAS","ZAC");
-- Select * from  dbposgrado.entidadfederativa 

-- La alcaldia  estan el en archivo del mismo nombre correr aparte.
-- select * from `dbposgrado`.`alcaldiamunicipio` 

INSERT INTO `dbposgrado`.`pais` VALUES (1,"Alemania","DE");
INSERT INTO `dbposgrado`.`pais` VALUES (2,"Argentina","AR");
INSERT INTO `dbposgrado`.`pais` VALUES (3,"Bélgica","BE");
INSERT INTO `dbposgrado`.`pais` VALUES (4,"Belice","BZ");
INSERT INTO `dbposgrado`.`pais` VALUES (5,"Bolivia","BO");
INSERT INTO `dbposgrado`.`pais` VALUES (6,"Brasil","BR");
INSERT INTO `dbposgrado`.`pais` VALUES (7,"Bulgaria","BG");
INSERT INTO `dbposgrado`.`pais` VALUES (8,"Chile","CL");
INSERT INTO `dbposgrado`.`pais` VALUES (9,"Chipre","CY");
INSERT INTO `dbposgrado`.`pais` VALUES (10,"Colombia","CO");
INSERT INTO `dbposgrado`.`pais` VALUES (11,"Costa Rica","CR");
INSERT INTO `dbposgrado`.`pais` VALUES (12,"Croacia","HR");
INSERT INTO `dbposgrado`.`pais` VALUES (13,"Cuba","CU");
INSERT INTO `dbposgrado`.`pais` VALUES (14,"Dinamarca","DK");
INSERT INTO `dbposgrado`.`pais` VALUES (15,"Ecuador","EC");
INSERT INTO `dbposgrado`.`pais` VALUES (16,"El Salvador","SV");
INSERT INTO `dbposgrado`.`pais` VALUES (17,"Eslovenia","SI");
INSERT INTO `dbposgrado`.`pais` VALUES (18,"Estonia","EE");
INSERT INTO `dbposgrado`.`pais` VALUES (19,"Finlandia","FI");
INSERT INTO `dbposgrado`.`pais` VALUES (20,"Francia","FR");
INSERT INTO `dbposgrado`.`pais` VALUES (21,"Gran Bretaña","GB");
INSERT INTO `dbposgrado`.`pais` VALUES (22,"Grecia","GR");
INSERT INTO `dbposgrado`.`pais` VALUES (23,"Guatemala","GT");
INSERT INTO `dbposgrado`.`pais` VALUES (24,"Haití","HT");
INSERT INTO `dbposgrado`.`pais` VALUES (25,"Holanda","NL");
INSERT INTO `dbposgrado`.`pais` VALUES (26,"Honduras","HN");
INSERT INTO `dbposgrado`.`pais` VALUES (27,"Hungría","HU");
INSERT INTO `dbposgrado`.`pais` VALUES (28,"Irlanda","IE");
INSERT INTO `dbposgrado`.`pais` VALUES (29,"Italia","IT");
INSERT INTO `dbposgrado`.`pais` VALUES (30,"Letonia","LV");
INSERT INTO `dbposgrado`.`pais` VALUES (31,"Lituania","LT");
INSERT INTO `dbposgrado`.`pais` VALUES (32,"Luxenburgo","LU");
INSERT INTO `dbposgrado`.`pais` VALUES (33,"Malta","MT");
INSERT INTO `dbposgrado`.`pais` VALUES (34,"México","MX");
INSERT INTO `dbposgrado`.`pais` VALUES (35,"Nicaragua","NI");
INSERT INTO `dbposgrado`.`pais` VALUES (36,"Panamá","PA");
INSERT INTO `dbposgrado`.`pais` VALUES (37,"Paraguay","PY");
INSERT INTO `dbposgrado`.`pais` VALUES (38,"Perú","PE");
INSERT INTO `dbposgrado`.`pais` VALUES (39,"Polonia","PL");
INSERT INTO `dbposgrado`.`pais` VALUES (40,"Portugal","PT");
INSERT INTO `dbposgrado`.`pais` VALUES (41,"Puerto Rico","PR");
INSERT INTO `dbposgrado`.`pais` VALUES (42,"República Checa","CZ");
INSERT INTO `dbposgrado`.`pais` VALUES (43,"República Dominicana","DO");
INSERT INTO `dbposgrado`.`pais` VALUES (44,"República Eslovaca","SK");
INSERT INTO `dbposgrado`.`pais` VALUES (45,"Rumanía","RO");
INSERT INTO `dbposgrado`.`pais` VALUES (46,"Suecia","SE");
INSERT INTO `dbposgrado`.`pais` VALUES (47,"Uruguay","UY");
INSERT INTO `dbposgrado`.`pais` VALUES (48,"Venezuela","VE");
-- select * from pais

INSERT INTO `dbposgrado`.`nacionalidad` VALUES (1,"Mexicana","MX");
INSERT INTO `dbposgrado`.`nacionalidad` VALUES (2,"Alemana","DE");
INSERT INTO `dbposgrado`.`nacionalidad` VALUES (3,"Argentina","AR");
INSERT INTO `dbposgrado`.`nacionalidad` VALUES (4,"Belga","BE");
INSERT INTO `dbposgrado`.`nacionalidad` VALUES (5,"Belice","BZ");
INSERT INTO `dbposgrado`.`nacionalidad` VALUES (6,"Boliviana","BO");
INSERT INTO `dbposgrado`.`nacionalidad` VALUES (7,"Brasileño","BR");
INSERT INTO `dbposgrado`.`nacionalidad` VALUES (8,"Bulgara","BG");
INSERT INTO `dbposgrado`.`nacionalidad` VALUES (9,"Chilena","CL");
INSERT INTO `dbposgrado`.`nacionalidad` VALUES (10,"Chipriota","CY");
INSERT INTO `dbposgrado`.`nacionalidad` VALUES (11,"Colombiana","CO");
INSERT INTO `dbposgrado`.`nacionalidad` VALUES (12,"Costarricense","CR");
INSERT INTO `dbposgrado`.`nacionalidad` VALUES (13,"Croacta","HR");
INSERT INTO `dbposgrado`.`nacionalidad` VALUES (14,"Cubana","CU");
INSERT INTO `dbposgrado`.`nacionalidad` VALUES (15,"Danesa","DK");
INSERT INTO `dbposgrado`.`nacionalidad` VALUES (16,"Ecuatoriano","EC");
INSERT INTO `dbposgrado`.`nacionalidad` VALUES (17,"Salvadoreña","SV");
INSERT INTO `dbposgrado`.`nacionalidad` VALUES (18,"Eslovaco","SI");
INSERT INTO `dbposgrado`.`nacionalidad` VALUES (19,"Estonia","EE");
INSERT INTO `dbposgrado`.`nacionalidad` VALUES (20,"Finlandes","FI");
INSERT INTO `dbposgrado`.`nacionalidad` VALUES (21,"Frances","FR");
INSERT INTO `dbposgrado`.`nacionalidad` VALUES (22,"Britanica","GB");
INSERT INTO `dbposgrado`.`nacionalidad` VALUES (23,"Griego","GR");
INSERT INTO `dbposgrado`.`nacionalidad` VALUES (24,"Guatemalteca","GT");
INSERT INTO `dbposgrado`.`nacionalidad` VALUES (25,"Haitíano","HT");
INSERT INTO `dbposgrado`.`nacionalidad` VALUES (26,"Holandes","NL");
INSERT INTO `dbposgrado`.`nacionalidad` VALUES (27,"hondureña","HN");
INSERT INTO `dbposgrado`.`nacionalidad` VALUES (28,"Húngara","HU");
INSERT INTO `dbposgrado`.`nacionalidad` VALUES (29,"Irlandes","IE");
INSERT INTO `dbposgrado`.`nacionalidad` VALUES (30,"Italiano","IT");
INSERT INTO `dbposgrado`.`nacionalidad` VALUES (31,"Letones","LV");
INSERT INTO `dbposgrado`.`nacionalidad` VALUES (32,"Lituania","LT");
INSERT INTO `dbposgrado`.`nacionalidad` VALUES (33,"Luxemburgueses","LU");
INSERT INTO `dbposgrado`.`nacionalidad` VALUES (34,"Malta","MT");
INSERT INTO `dbposgrado`.`nacionalidad` VALUES (35,"Nicaraguense","NI");
INSERT INTO `dbposgrado`.`nacionalidad` VALUES (36,"Panameña","PA");
INSERT INTO `dbposgrado`.`nacionalidad` VALUES (37,"Paraguaya","PY");
INSERT INTO `dbposgrado`.`nacionalidad` VALUES (38,"Peruana","PE");
INSERT INTO `dbposgrado`.`nacionalidad` VALUES (39,"Polaca","PL");
INSERT INTO `dbposgrado`.`nacionalidad` VALUES (40,"Portuguesa","PT");
INSERT INTO `dbposgrado`.`nacionalidad` VALUES (41,"puertorriqueña ","PR");
INSERT INTO `dbposgrado`.`nacionalidad` VALUES (42,"República Checa","CZ");
INSERT INTO `dbposgrado`.`nacionalidad` VALUES (43,"Dominicana","DO");
INSERT INTO `dbposgrado`.`nacionalidad` VALUES (44,"República Eslovaca","SK");
INSERT INTO `dbposgrado`.`nacionalidad` VALUES (45,"Rumanía","RO");
INSERT INTO `dbposgrado`.`nacionalidad` VALUES (46,"Sueco","SE");
INSERT INTO `dbposgrado`.`nacionalidad` VALUES (47,"Uruguaya","UY");
INSERT INTO `dbposgrado`.`nacionalidad` VALUES (48,"Venezolana","VE");
-- select * from `dbposgrado`.`nacionalidad`;


INSERT INTO `dbposgrado`.`Tesis` VALUES (1,'LACM551230UX9','LACM551230UX9','LACM551230UX9','LACM551230UX9','LACM551230UX9','LACM551230UX9','LACM551230UX9','LACM551230UX9',now(),now(),now(),1);
-- select * from  dbposgrado.tesis 




