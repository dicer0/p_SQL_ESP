--CÓDIGO SQL BASE DE DATOS RELACIONAL:
/*Los dos sub-lenguajes más importantes del lenguaje SQL son llamados DDL y DML, primero se explicará el DDL que sirve para 
estructurar la base de datos:
    • DDL (Data Definition Language): La función principal de este sub-lenguaje de SQL es la de crear la estructura de una 
      base de datos. Esto se refiere a las entidades, atributos, relaciones, etc. que son descritos en un diagrama ER o en 
      un diagrama físico. 
      Los 3 comandos con los que cuenta para llevar a cabo la estructuración de datos con el lenguaje DDL son los siguientes:
        o CREATE: Comando que ayuda a crear una base de datos, tabla, vista, índice, etc.
        o ALTER: Comando que ayuda a alterar o modificar una entidad, tabla, tipo de dato, etc.
        o DROP: Comando que ayuda a eliminar elementos de una base de datos. Esta se debe utilizar con mucho cuidado, ya 
          que accidentalmente podríamos borrar nuestra db completa.

    Algunos de los elementos u objetos que se van a manipular con los comandos DDL son los siguientes:
    o DATABASE: Se refiere a la base de datos, a veces también se le llama SCHEMA.
    o TABLE: Las tablas se refieren a la visualización de los datos después de haberlas modelado a través de un diagrama 
    ER o diagrama físico.
    o VIEW: Las vistas se refieren a la forma en la que se pueden interpretar y ordenar los datos extraídos de una database, 
    de tal forma que puedan ser entendidos o de utilidad para el usuario, ya que, en las tablas de las bases de datos, 
    muchas veces la información está segmentada y de esta forma la podemos filtrar y organizar.

    • DML (Data Manipulation Language): La función principal de este sub-lenguaje de SQL es la de manipular los datos de una 
      base de datos, ya sea para crear vistas o para meter, actualizar, borrar o extraer datos. Los 4 comandos con los que 
      cuenta para llevar a cabo la manipulación de datos con el lenguaje DML son los siguientes:
        o INSERT: Comando que permite introducir nuevas filas de datos (también llamados registros o tuplas) a la tabla 
          (entidad) de una base de datos.
        o UPDATE: Comando que actualiza o modifica datos ya existentes en la tabla de una base de datos.
        o DELETE: Instrucción que sirve para borrar toda la fila de datos de una tabla perteneciente a una base de datos.
        o SELECT: Este comando es muy importante, ya que permite traer información de la base de datos, ya sea para crear una 
          vista, extraerla para ponerla en otro lado, etc.*/
/*DEBIDO A LA ESTANDARIZACIÓN DE SQL EL SIGUIENTE CÓDIGO QUE CREA Y DESTRUYE UNA BASE DE DATOS RELACIONAL FUNCIONA CON 
DISTINTOS TIPOS DE BASES DE DATOS, YA SEA EN MYSQL WORKBENCH, EN POSTGRESQL, GOOGLE CLOUD SERVICES, ETC.*/
/*CREAR Y ACTIVAR UNA BASE DE DATOS CON SQL:
CREATE 	DATABASE		“Nombre_Base_de_Datos”;
//La siguiente instrucción no siempre se incluye, porque se da por entendida.
USE 	DATABASE		“Nombre_Base_de_Datos”;*/ 
CREATE  DATABASE    1_platziblog_db;
USE     DATABASE    1_platziblog_db;

/*CREAR UNA NUEVA TABLA O ENTIDAD EN UNA BASE DE DATOS CON SQL:
CREATE 	TABLE	Nombre_Entidad_o_Tabla(
	Nombre_Atributo		Tipo_de_Dato_y_Constraints ,
	Nombre_Atributo		Tipo_de_Dato_y_Constraints
);*/
CREATE  TABLE   people(
    person_id     int,
    last_name     varchar(255),
    first_name    varchar(255),
    address       varchar(255),
    city          varchar(255)
);

/*INSERTAR UNA FILA DE DATOS (REGISTRO O TUPLA) EN LA BASE DE DATOS CON SQL:
INSERT	INTO	Nombre_Entidad_o_Tabla(
	Nombre_Atributo_o_Columna_1,
	Nombre_Atributo_o_Columna_2,
	Nombre_Atributo_o_Columna_n
)
VALUES(
	“Valor_Atributo_o_Columna_1”,
	“Valor_Atributo_o_Columna_2”,
	“Valor_Atributo_o_Columna_n”
);*/
INSERT INTO people(
    last_name, 
    first_name, 
    address, 
    city
)
VALUES(
    "Cervantes", 
    "Diego", 
    "Tu corazón bb <3", 
    "CDMX"
);

/*EXTRAER TODOS LOS DATOS DE UNA COLUMNA PERTENECIENTE A LA TABLA DE UNA BASE DE DATOS CON SQL:
SELECT	Nombre_Atributo_o_Columna_1, Nombre_Atributo_o_Columna_n
FROM	Nombre_Entidad_o_Tabla;*/
SELECT  first_name, last_name
FROM    people;

/*BORRAR UNA TABLA, COLUMNA O BASE DE DATOS CON SQL:
DROP	DATABASE	Nombre_Base_de_Datos;
DROP	TABLE		Nombre_Entidad_o_Tabla;
DROP	COLUMN		Columna_a_Borrar;*/
DROP    TABLE   people;

/*LLENAR UNA BASE DE DATOS CON INFORMACIÓN DE PRUEBA:*/
-- Usuarios
INSERT INTO usuarios (`id`,`login`,`password`,`nickname`,`email`) VALUES (1,'israel','jc8209*(^GCHN_(hcLA','Israel','israel@platziblog.com');
INSERT INTO usuarios (`id`,`login`,`password`,`nickname`,`email`) VALUES (2,'monica','(*&^LKJDHC_(*#YDLKJHODG','Moni','monica@platziblog.com');
INSERT INTO usuarios (`id`,`login`,`password`,`nickname`,`email`) VALUES (3,'laura','LKDJ)_*(-c.M:\"[pOwHDˆåßƒ∂','Lau','laura@platziblog.com');
INSERT INTO usuarios (`id`,`login`,`password`,`nickname`,`email`) VALUES (4,'edgar','LLiy)CX*Y:M<A<SC_(*N>O','Ed','edgar@platziblog.com');
INSERT INTO usuarios (`id`,`login`,`password`,`nickname`,`email`) VALUES (5,'perezoso','&N_*JS)_Y)*(&TGOKS','Oso Pérez','perezoso@platziblog.com');
-- Categorías
INSERT INTO categorias (`id`,`nombre_categoria`) VALUES (1,'Ciencia');
INSERT INTO categorias (`id`,`nombre_categoria`) VALUES (2,'Tecnología');
INSERT INTO categorias (`id`,`nombre_categoria`) VALUES (3,'Deportes');
INSERT INTO categorias (`id`,`nombre_categoria`) VALUES (4,'Espectáculos');
INSERT INTO categorias (`id`,`nombre_categoria`) VALUES (5,'Economía');
-- Etiquetas
INSERT INTO etiquetas (`id`,`nombre_etiqueta`) VALUES (1,'Robótica');
INSERT INTO etiquetas (`id`,`nombre_etiqueta`) VALUES (2,'Computación');
INSERT INTO etiquetas (`id`,`nombre_etiqueta`) VALUES (3,'Teléfonos Móviles');
INSERT INTO etiquetas (`id`,`nombre_etiqueta`) VALUES (4,'Automovilismo');
INSERT INTO etiquetas (`id`,`nombre_etiqueta`) VALUES (5,'Campeonatos');
INSERT INTO etiquetas (`id`,`nombre_etiqueta`) VALUES (6,'Equipos');
INSERT INTO etiquetas (`id`,`nombre_etiqueta`) VALUES (7,'Bolsa de valores');
INSERT INTO etiquetas (`id`,`nombre_etiqueta`) VALUES (8,'Inversiones');
INSERT INTO etiquetas (`id`,`nombre_etiqueta`) VALUES (9,'Brokers');
INSERT INTO etiquetas (`id`,`nombre_etiqueta`) VALUES (10,'Celebridades');
INSERT INTO etiquetas (`id`,`nombre_etiqueta`) VALUES (11,'Eventos');
INSERT INTO etiquetas (`id`,`nombre_etiqueta`) VALUES (12,'Moda');
INSERT INTO etiquetas (`id`,`nombre_etiqueta`) VALUES (13,'Avances');
INSERT INTO etiquetas (`id`,`nombre_etiqueta`) VALUES (14,'Nobel');
INSERT INTO etiquetas (`id`,`nombre_etiqueta`) VALUES (15,'Matemáticas');
INSERT INTO etiquetas (`id`,`nombre_etiqueta`) VALUES (16,'Química');
INSERT INTO etiquetas (`id`,`nombre_etiqueta`) VALUES (17,'Física');
INSERT INTO etiquetas (`id`,`nombre_etiqueta`) VALUES (18,'Largo plazo');
INSERT INTO etiquetas (`id`,`nombre_etiqueta`) VALUES (19,'Bienes Raíces');
INSERT INTO etiquetas (`id`,`nombre_etiqueta`) VALUES (20,'Estilo');
-- Posts
INSERT INTO posts (`id`,`titulo`,`fecha_publicacion`,`contenido`,`estatus`,`usuarios_id`,`categorias_id`) VALUES (43,'Se presenta el nuevo teléfono móvil en evento','2030-04-05 00:00:00','Phasellus laoreet eros nec vestibulum varius. Nunc id efficitur lacus, non imperdiet quam. Aliquam porta, tellus at porta semper, felis velit congue mauris, eu pharetra felis sem vitae tortor. Curabitur bibendum vehicula dolor, nec accumsan tortor ultrices ac. Vivamus nec tristique orci. Nullam fringilla eros magna, vitae imperdiet nisl mattis et. Ut quis malesuada felis. Proin at dictum eros, eget sodales libero. Sed egestas tristique nisi et tempor. Ut cursus sapien eu pellentesque posuere. Etiam eleifend varius cursus.\n\nNullam viverra quam porta orci efficitur imperdiet. Quisque magna erat, dignissim nec velit sit amet, hendrerit mollis mauris. Mauris sapien magna, consectetur et vulputate a, iaculis eget nisi. Nunc est diam, aliquam quis turpis ac, porta mattis neque. Quisque consequat dolor sit amet velit commodo sagittis. Donec commodo pulvinar odio, ut gravida velit pellentesque vitae. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.\n\nMorbi vulputate ante quis elit pretium, ut blandit felis aliquet. Aenean a massa a leo tristique malesuada. Curabitur posuere, elit sed consectetur blandit, massa mauris tristique ante, in faucibus elit justo quis nisi. Ut viverra est et arcu egestas fringilla. Mauris condimentum, lorem id viverra placerat, libero lacus ultricies est, id volutpat metus sapien non justo. Nulla facilisis, sapien ut vehicula tristique, mauris lectus porta massa, sit amet malesuada dolor justo id lectus. Suspendisse sit amet tempor ligula. Nam sit amet nisl non magna lacinia finibus eget nec augue. Aliquam ornare cursus dapibus. Lorem ipsum dolor sit amet, consectetur adipiscing elit.\n\nDonec ornare sem eget massa pharetra rhoncus. Donec tempor sapien at posuere porttitor. Morbi sodales efficitur felis eu scelerisque. Quisque ultrices nunc ut dignissim vehicula. Donec id imperdiet orci, sed porttitor turpis. Etiam volutpat elit sed justo lobortis, tincidunt imperdiet velit pretium. Ut convallis elit sapien, ac egestas ipsum finibus a. Morbi sed odio et dui tincidunt rhoncus tempor id turpis.\n\nProin fringilla consequat imperdiet. Ut accumsan velit ac augue sollicitudin porta. Phasellus finibus porttitor felis, a feugiat purus tempus vel. Etiam vitae vehicula ex. Praesent ut tellus tellus. Fusce felis nunc, congue ac leo in, elementum vulputate nisi. Duis diam nulla, consequat ac mauris quis, viverra gravida urna.','activo',1,2);
INSERT INTO posts (`id`,`titulo`,`fecha_publicacion`,`contenido`,`estatus`,`usuarios_id`,`categorias_id`) VALUES (44,'Tenemos un nuevo auto inteligente','2025-05-04 00:00:00','Phasellus laoreet eros nec vestibulum varius. Nunc id efficitur lacus, non imperdiet quam. Aliquam porta, tellus at porta semper, felis velit congue mauris, eu pharetra felis sem vitae tortor. Curabitur bibendum vehicula dolor, nec accumsan tortor ultrices ac. Vivamus nec tristique orci. Nullam fringilla eros magna, vitae imperdiet nisl mattis et. Ut quis malesuada felis. Proin at dictum eros, eget sodales libero. Sed egestas tristique nisi et tempor. Ut cursus sapien eu pellentesque posuere. Etiam eleifend varius cursus.\n\nNullam viverra quam porta orci efficitur imperdiet. Quisque magna erat, dignissim nec velit sit amet, hendrerit mollis mauris. Mauris sapien magna, consectetur et vulputate a, iaculis eget nisi. Nunc est diam, aliquam quis turpis ac, porta mattis neque. Quisque consequat dolor sit amet velit commodo sagittis. Donec commodo pulvinar odio, ut gravida velit pellentesque vitae. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.\n\nMorbi vulputate ante quis elit pretium, ut blandit felis aliquet. Aenean a massa a leo tristique malesuada. Curabitur posuere, elit sed consectetur blandit, massa mauris tristique ante, in faucibus elit justo quis nisi. Ut viverra est et arcu egestas fringilla. Mauris condimentum, lorem id viverra placerat, libero lacus ultricies est, id volutpat metus sapien non justo. Nulla facilisis, sapien ut vehicula tristique, mauris lectus porta massa, sit amet malesuada dolor justo id lectus. Suspendisse sit amet tempor ligula. Nam sit amet nisl non magna lacinia finibus eget nec augue. Aliquam ornare cursus dapibus. Lorem ipsum dolor sit amet, consectetur adipiscing elit.\n\nDonec ornare sem eget massa pharetra rhoncus. Donec tempor sapien at posuere porttitor. Morbi sodales efficitur felis eu scelerisque. Quisque ultrices nunc ut dignissim vehicula. Donec id imperdiet orci, sed porttitor turpis. Etiam volutpat elit sed justo lobortis, tincidunt imperdiet velit pretium. Ut convallis elit sapien, ac egestas ipsum finibus a. Morbi sed odio et dui tincidunt rhoncus tempor id turpis.\n\nProin fringilla consequat imperdiet. Ut accumsan velit ac augue sollicitudin porta. Phasellus finibus porttitor felis, a feugiat purus tempus vel. Etiam vitae vehicula ex. Praesent ut tellus tellus. Fusce felis nunc, congue ac leo in, elementum vulputate nisi. Duis diam nulla, consequat ac mauris quis, viverra gravida urna.','activo',2,2);
INSERT INTO posts (`id`,`titulo`,`fecha_publicacion`,`contenido`,`estatus`,`usuarios_id`,`categorias_id`) VALUES (45,'Ganador del premio Nobel por trabajo en genética','2023-12-22 00:00:00','Phasellus laoreet eros nec vestibulum varius. Nunc id efficitur lacus, non imperdiet quam. Aliquam porta, tellus at porta semper, felis velit congue mauris, eu pharetra felis sem vitae tortor. Curabitur bibendum vehicula dolor, nec accumsan tortor ultrices ac. Vivamus nec tristique orci. Nullam fringilla eros magna, vitae imperdiet nisl mattis et. Ut quis malesuada felis. Proin at dictum eros, eget sodales libero. Sed egestas tristique nisi et tempor. Ut cursus sapien eu pellentesque posuere. Etiam eleifend varius cursus.\n\nNullam viverra quam porta orci efficitur imperdiet. Quisque magna erat, dignissim nec velit sit amet, hendrerit mollis mauris. Mauris sapien magna, consectetur et vulputate a, iaculis eget nisi. Nunc est diam, aliquam quis turpis ac, porta mattis neque. Quisque consequat dolor sit amet velit commodo sagittis. Donec commodo pulvinar odio, ut gravida velit pellentesque vitae. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.\n\nMorbi vulputate ante quis elit pretium, ut blandit felis aliquet. Aenean a massa a leo tristique malesuada. Curabitur posuere, elit sed consectetur blandit, massa mauris tristique ante, in faucibus elit justo quis nisi. Ut viverra est et arcu egestas fringilla. Mauris condimentum, lorem id viverra placerat, libero lacus ultricies est, id volutpat metus sapien non justo. Nulla facilisis, sapien ut vehicula tristique, mauris lectus porta massa, sit amet malesuada dolor justo id lectus. Suspendisse sit amet tempor ligula. Nam sit amet nisl non magna lacinia finibus eget nec augue. Aliquam ornare cursus dapibus. Lorem ipsum dolor sit amet, consectetur adipiscing elit.\n\nDonec ornare sem eget massa pharetra rhoncus. Donec tempor sapien at posuere porttitor. Morbi sodales efficitur felis eu scelerisque. Quisque ultrices nunc ut dignissim vehicula. Donec id imperdiet orci, sed porttitor turpis. Etiam volutpat elit sed justo lobortis, tincidunt imperdiet velit pretium. Ut convallis elit sapien, ac egestas ipsum finibus a. Morbi sed odio et dui tincidunt rhoncus tempor id turpis.\n\nProin fringilla consequat imperdiet. Ut accumsan velit ac augue sollicitudin porta. Phasellus finibus porttitor felis, a feugiat purus tempus vel. Etiam vitae vehicula ex. Praesent ut tellus tellus. Fusce felis nunc, congue ac leo in, elementum vulputate nisi. Duis diam nulla, consequat ac mauris quis, viverra gravida urna.','activo',3,1);
INSERT INTO posts (`id`,`titulo`,`fecha_publicacion`,`contenido`,`estatus`,`usuarios_id`,`categorias_id`) VALUES (46,'Los mejores vestidos en la alfombra roja','2021-12-22 00:00:00','Phasellus laoreet eros nec vestibulum varius. Nunc id efficitur lacus, non imperdiet quam. Aliquam porta, tellus at porta semper, felis velit congue mauris, eu pharetra felis sem vitae tortor. Curabitur bibendum vehicula dolor, nec accumsan tortor ultrices ac. Vivamus nec tristique orci. Nullam fringilla eros magna, vitae imperdiet nisl mattis et. Ut quis malesuada felis. Proin at dictum eros, eget sodales libero. Sed egestas tristique nisi et tempor. Ut cursus sapien eu pellentesque posuere. Etiam eleifend varius cursus.\n\nNullam viverra quam porta orci efficitur imperdiet. Quisque magna erat, dignissim nec velit sit amet, hendrerit mollis mauris. Mauris sapien magna, consectetur et vulputate a, iaculis eget nisi. Nunc est diam, aliquam quis turpis ac, porta mattis neque. Quisque consequat dolor sit amet velit commodo sagittis. Donec commodo pulvinar odio, ut gravida velit pellentesque vitae. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.\n\nMorbi vulputate ante quis elit pretium, ut blandit felis aliquet. Aenean a massa a leo tristique malesuada. Curabitur posuere, elit sed consectetur blandit, massa mauris tristique ante, in faucibus elit justo quis nisi. Ut viverra est et arcu egestas fringilla. Mauris condimentum, lorem id viverra placerat, libero lacus ultricies est, id volutpat metus sapien non justo. Nulla facilisis, sapien ut vehicula tristique, mauris lectus porta massa, sit amet malesuada dolor justo id lectus. Suspendisse sit amet tempor ligula. Nam sit amet nisl non magna lacinia finibus eget nec augue. Aliquam ornare cursus dapibus. Lorem ipsum dolor sit amet, consectetur adipiscing elit.\n\nDonec ornare sem eget massa pharetra rhoncus. Donec tempor sapien at posuere porttitor. Morbi sodales efficitur felis eu scelerisque. Quisque ultrices nunc ut dignissim vehicula. Donec id imperdiet orci, sed porttitor turpis. Etiam volutpat elit sed justo lobortis, tincidunt imperdiet velit pretium. Ut convallis elit sapien, ac egestas ipsum finibus a. Morbi sed odio et dui tincidunt rhoncus tempor id turpis.\n\nProin fringilla consequat imperdiet. Ut accumsan velit ac augue sollicitudin porta. Phasellus finibus porttitor felis, a feugiat purus tempus vel. Etiam vitae vehicula ex. Praesent ut tellus tellus. Fusce felis nunc, congue ac leo in, elementum vulputate nisi. Duis diam nulla, consequat ac mauris quis, viverra gravida urna.','activo',4,4);
INSERT INTO posts (`id`,`titulo`,`fecha_publicacion`,`contenido`,`estatus`,`usuarios_id`,`categorias_id`) VALUES (47,'Los paparatzi captan escándalo en cámara','2025-01-09 00:00:00','Phasellus laoreet eros nec vestibulum varius. Nunc id efficitur lacus, non imperdiet quam. Aliquam porta, tellus at porta semper, felis velit congue mauris, eu pharetra felis sem vitae tortor. Curabitur bibendum vehicula dolor, nec accumsan tortor ultrices ac. Vivamus nec tristique orci. Nullam fringilla eros magna, vitae imperdiet nisl mattis et. Ut quis malesuada felis. Proin at dictum eros, eget sodales libero. Sed egestas tristique nisi et tempor. Ut cursus sapien eu pellentesque posuere. Etiam eleifend varius cursus.\n\nNullam viverra quam porta orci efficitur imperdiet. Quisque magna erat, dignissim nec velit sit amet, hendrerit mollis mauris. Mauris sapien magna, consectetur et vulputate a, iaculis eget nisi. Nunc est diam, aliquam quis turpis ac, porta mattis neque. Quisque consequat dolor sit amet velit commodo sagittis. Donec commodo pulvinar odio, ut gravida velit pellentesque vitae. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.\n\nMorbi vulputate ante quis elit pretium, ut blandit felis aliquet. Aenean a massa a leo tristique malesuada. Curabitur posuere, elit sed consectetur blandit, massa mauris tristique ante, in faucibus elit justo quis nisi. Ut viverra est et arcu egestas fringilla. Mauris condimentum, lorem id viverra placerat, libero lacus ultricies est, id volutpat metus sapien non justo. Nulla facilisis, sapien ut vehicula tristique, mauris lectus porta massa, sit amet malesuada dolor justo id lectus. Suspendisse sit amet tempor ligula. Nam sit amet nisl non magna lacinia finibus eget nec augue. Aliquam ornare cursus dapibus. Lorem ipsum dolor sit amet, consectetur adipiscing elit.\n\nDonec ornare sem eget massa pharetra rhoncus. Donec tempor sapien at posuere porttitor. Morbi sodales efficitur felis eu scelerisque. Quisque ultrices nunc ut dignissim vehicula. Donec id imperdiet orci, sed porttitor turpis. Etiam volutpat elit sed justo lobortis, tincidunt imperdiet velit pretium. Ut convallis elit sapien, ac egestas ipsum finibus a. Morbi sed odio et dui tincidunt rhoncus tempor id turpis.\n\nProin fringilla consequat imperdiet. Ut accumsan velit ac augue sollicitudin porta. Phasellus finibus porttitor felis, a feugiat purus tempus vel. Etiam vitae vehicula ex. Praesent ut tellus tellus. Fusce felis nunc, congue ac leo in, elementum vulputate nisi. Duis diam nulla, consequat ac mauris quis, viverra gravida urna.','inactivo',4,4);
INSERT INTO posts (`id`,`titulo`,`fecha_publicacion`,`contenido`,`estatus`,`usuarios_id`,`categorias_id`) VALUES (48,'Se mejora la conducción autónoma de vehículos','2022-05-23 00:00:00','Phasellus laoreet eros nec vestibulum varius. Nunc id efficitur lacus, non imperdiet quam. Aliquam porta, tellus at porta semper, felis velit congue mauris, eu pharetra felis sem vitae tortor. Curabitur bibendum vehicula dolor, nec accumsan tortor ultrices ac. Vivamus nec tristique orci. Nullam fringilla eros magna, vitae imperdiet nisl mattis et. Ut quis malesuada felis. Proin at dictum eros, eget sodales libero. Sed egestas tristique nisi et tempor. Ut cursus sapien eu pellentesque posuere. Etiam eleifend varius cursus.\n\nNullam viverra quam porta orci efficitur imperdiet. Quisque magna erat, dignissim nec velit sit amet, hendrerit mollis mauris. Mauris sapien magna, consectetur et vulputate a, iaculis eget nisi. Nunc est diam, aliquam quis turpis ac, porta mattis neque. Quisque consequat dolor sit amet velit commodo sagittis. Donec commodo pulvinar odio, ut gravida velit pellentesque vitae. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.\n\nMorbi vulputate ante quis elit pretium, ut blandit felis aliquet. Aenean a massa a leo tristique malesuada. Curabitur posuere, elit sed consectetur blandit, massa mauris tristique ante, in faucibus elit justo quis nisi. Ut viverra est et arcu egestas fringilla. Mauris condimentum, lorem id viverra placerat, libero lacus ultricies est, id volutpat metus sapien non justo. Nulla facilisis, sapien ut vehicula tristique, mauris lectus porta massa, sit amet malesuada dolor justo id lectus. Suspendisse sit amet tempor ligula. Nam sit amet nisl non magna lacinia finibus eget nec augue. Aliquam ornare cursus dapibus. Lorem ipsum dolor sit amet, consectetur adipiscing elit.\n\nDonec ornare sem eget massa pharetra rhoncus. Donec tempor sapien at posuere porttitor. Morbi sodales efficitur felis eu scelerisque. Quisque ultrices nunc ut dignissim vehicula. Donec id imperdiet orci, sed porttitor turpis. Etiam volutpat elit sed justo lobortis, tincidunt imperdiet velit pretium. Ut convallis elit sapien, ac egestas ipsum finibus a. Morbi sed odio et dui tincidunt rhoncus tempor id turpis.\n\nProin fringilla consequat imperdiet. Ut accumsan velit ac augue sollicitudin porta. Phasellus finibus porttitor felis, a feugiat purus tempus vel. Etiam vitae vehicula ex. Praesent ut tellus tellus. Fusce felis nunc, congue ac leo in, elementum vulputate nisi. Duis diam nulla, consequat ac mauris quis, viverra gravida urna.','activo',1,2);
INSERT INTO posts (`id`,`titulo`,`fecha_publicacion`,`contenido`,`estatus`,`usuarios_id`,`categorias_id`) VALUES (49,'Se descubre nueva partícula del modelo estandar','2023-01-10 00:00:00','Phasellus laoreet eros nec vestibulum varius. Nunc id efficitur lacus, non imperdiet quam. Aliquam porta, tellus at porta semper, felis velit congue mauris, eu pharetra felis sem vitae tortor. Curabitur bibendum vehicula dolor, nec accumsan tortor ultrices ac. Vivamus nec tristique orci. Nullam fringilla eros magna, vitae imperdiet nisl mattis et. Ut quis malesuada felis. Proin at dictum eros, eget sodales libero. Sed egestas tristique nisi et tempor. Ut cursus sapien eu pellentesque posuere. Etiam eleifend varius cursus.\n\nNullam viverra quam porta orci efficitur imperdiet. Quisque magna erat, dignissim nec velit sit amet, hendrerit mollis mauris. Mauris sapien magna, consectetur et vulputate a, iaculis eget nisi. Nunc est diam, aliquam quis turpis ac, porta mattis neque. Quisque consequat dolor sit amet velit commodo sagittis. Donec commodo pulvinar odio, ut gravida velit pellentesque vitae. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.\n\nMorbi vulputate ante quis elit pretium, ut blandit felis aliquet. Aenean a massa a leo tristique malesuada. Curabitur posuere, elit sed consectetur blandit, massa mauris tristique ante, in faucibus elit justo quis nisi. Ut viverra est et arcu egestas fringilla. Mauris condimentum, lorem id viverra placerat, libero lacus ultricies est, id volutpat metus sapien non justo. Nulla facilisis, sapien ut vehicula tristique, mauris lectus porta massa, sit amet malesuada dolor justo id lectus. Suspendisse sit amet tempor ligula. Nam sit amet nisl non magna lacinia finibus eget nec augue. Aliquam ornare cursus dapibus. Lorem ipsum dolor sit amet, consectetur adipiscing elit.\n\nDonec ornare sem eget massa pharetra rhoncus. Donec tempor sapien at posuere porttitor. Morbi sodales efficitur felis eu scelerisque. Quisque ultrices nunc ut dignissim vehicula. Donec id imperdiet orci, sed porttitor turpis. Etiam volutpat elit sed justo lobortis, tincidunt imperdiet velit pretium. Ut convallis elit sapien, ac egestas ipsum finibus a. Morbi sed odio et dui tincidunt rhoncus tempor id turpis.\n\nProin fringilla consequat imperdiet. Ut accumsan velit ac augue sollicitudin porta. Phasellus finibus porttitor felis, a feugiat purus tempus vel. Etiam vitae vehicula ex. Praesent ut tellus tellus. Fusce felis nunc, congue ac leo in, elementum vulputate nisi. Duis diam nulla, consequat ac mauris quis, viverra gravida urna.','activo',2,1);
INSERT INTO posts (`id`,`titulo`,`fecha_publicacion`,`contenido`,`estatus`,`usuarios_id`,`categorias_id`) VALUES (50,'Químicos descubren nanomaterial','2026-06-04 00:00:00','Phasellus laoreet eros nec vestibulum varius. Nunc id efficitur lacus, non imperdiet quam. Aliquam porta, tellus at porta semper, felis velit congue mauris, eu pharetra felis sem vitae tortor. Curabitur bibendum vehicula dolor, nec accumsan tortor ultrices ac. Vivamus nec tristique orci. Nullam fringilla eros magna, vitae imperdiet nisl mattis et. Ut quis malesuada felis. Proin at dictum eros, eget sodales libero. Sed egestas tristique nisi et tempor. Ut cursus sapien eu pellentesque posuere. Etiam eleifend varius cursus.\n\nNullam viverra quam porta orci efficitur imperdiet. Quisque magna erat, dignissim nec velit sit amet, hendrerit mollis mauris. Mauris sapien magna, consectetur et vulputate a, iaculis eget nisi. Nunc est diam, aliquam quis turpis ac, porta mattis neque. Quisque consequat dolor sit amet velit commodo sagittis. Donec commodo pulvinar odio, ut gravida velit pellentesque vitae. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.\n\nMorbi vulputate ante quis elit pretium, ut blandit felis aliquet. Aenean a massa a leo tristique malesuada. Curabitur posuere, elit sed consectetur blandit, massa mauris tristique ante, in faucibus elit justo quis nisi. Ut viverra est et arcu egestas fringilla. Mauris condimentum, lorem id viverra placerat, libero lacus ultricies est, id volutpat metus sapien non justo. Nulla facilisis, sapien ut vehicula tristique, mauris lectus porta massa, sit amet malesuada dolor justo id lectus. Suspendisse sit amet tempor ligula. Nam sit amet nisl non magna lacinia finibus eget nec augue. Aliquam ornare cursus dapibus. Lorem ipsum dolor sit amet, consectetur adipiscing elit.\n\nDonec ornare sem eget massa pharetra rhoncus. Donec tempor sapien at posuere porttitor. Morbi sodales efficitur felis eu scelerisque. Quisque ultrices nunc ut dignissim vehicula. Donec id imperdiet orci, sed porttitor turpis. Etiam volutpat elit sed justo lobortis, tincidunt imperdiet velit pretium. Ut convallis elit sapien, ac egestas ipsum finibus a. Morbi sed odio et dui tincidunt rhoncus tempor id turpis.\n\nProin fringilla consequat imperdiet. Ut accumsan velit ac augue sollicitudin porta. Phasellus finibus porttitor felis, a feugiat purus tempus vel. Etiam vitae vehicula ex. Praesent ut tellus tellus. Fusce felis nunc, congue ac leo in, elementum vulputate nisi. Duis diam nulla, consequat ac mauris quis, viverra gravida urna.','activo',2,1);
INSERT INTO posts (`id`,`titulo`,`fecha_publicacion`,`contenido`,`estatus`,`usuarios_id`,`categorias_id`) VALUES (51,'La bolsa cae estrepitosamente','2024-04-03 00:00:00','Phasellus laoreet eros nec vestibulum varius. Nunc id efficitur lacus, non imperdiet quam. Aliquam porta, tellus at porta semper, felis velit congue mauris, eu pharetra felis sem vitae tortor. Curabitur bibendum vehicula dolor, nec accumsan tortor ultrices ac. Vivamus nec tristique orci. Nullam fringilla eros magna, vitae imperdiet nisl mattis et. Ut quis malesuada felis. Proin at dictum eros, eget sodales libero. Sed egestas tristique nisi et tempor. Ut cursus sapien eu pellentesque posuere. Etiam eleifend varius cursus.\n\nNullam viverra quam porta orci efficitur imperdiet. Quisque magna erat, dignissim nec velit sit amet, hendrerit mollis mauris. Mauris sapien magna, consectetur et vulputate a, iaculis eget nisi. Nunc est diam, aliquam quis turpis ac, porta mattis neque. Quisque consequat dolor sit amet velit commodo sagittis. Donec commodo pulvinar odio, ut gravida velit pellentesque vitae. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.\n\nMorbi vulputate ante quis elit pretium, ut blandit felis aliquet. Aenean a massa a leo tristique malesuada. Curabitur posuere, elit sed consectetur blandit, massa mauris tristique ante, in faucibus elit justo quis nisi. Ut viverra est et arcu egestas fringilla. Mauris condimentum, lorem id viverra placerat, libero lacus ultricies est, id volutpat metus sapien non justo. Nulla facilisis, sapien ut vehicula tristique, mauris lectus porta massa, sit amet malesuada dolor justo id lectus. Suspendisse sit amet tempor ligula. Nam sit amet nisl non magna lacinia finibus eget nec augue. Aliquam ornare cursus dapibus. Lorem ipsum dolor sit amet, consectetur adipiscing elit.\n\nDonec ornare sem eget massa pharetra rhoncus. Donec tempor sapien at posuere porttitor. Morbi sodales efficitur felis eu scelerisque. Quisque ultrices nunc ut dignissim vehicula. Donec id imperdiet orci, sed porttitor turpis. Etiam volutpat elit sed justo lobortis, tincidunt imperdiet velit pretium. Ut convallis elit sapien, ac egestas ipsum finibus a. Morbi sed odio et dui tincidunt rhoncus tempor id turpis.\n\nProin fringilla consequat imperdiet. Ut accumsan velit ac augue sollicitudin porta. Phasellus finibus porttitor felis, a feugiat purus tempus vel. Etiam vitae vehicula ex. Praesent ut tellus tellus. Fusce felis nunc, congue ac leo in, elementum vulputate nisi. Duis diam nulla, consequat ac mauris quis, viverra gravida urna.','activo',2,5);
INSERT INTO posts (`id`,`titulo`,`fecha_publicacion`,`contenido`,`estatus`,`usuarios_id`,`categorias_id`) VALUES (52,'Bienes raices más baratos que nunca','2025-04-11 00:00:00','Phasellus laoreet eros nec vestibulum varius. Nunc id efficitur lacus, non imperdiet quam. Aliquam porta, tellus at porta semper, felis velit congue mauris, eu pharetra felis sem vitae tortor. Curabitur bibendum vehicula dolor, nec accumsan tortor ultrices ac. Vivamus nec tristique orci. Nullam fringilla eros magna, vitae imperdiet nisl mattis et. Ut quis malesuada felis. Proin at dictum eros, eget sodales libero. Sed egestas tristique nisi et tempor. Ut cursus sapien eu pellentesque posuere. Etiam eleifend varius cursus.\n\nNullam viverra quam porta orci efficitur imperdiet. Quisque magna erat, dignissim nec velit sit amet, hendrerit mollis mauris. Mauris sapien magna, consectetur et vulputate a, iaculis eget nisi. Nunc est diam, aliquam quis turpis ac, porta mattis neque. Quisque consequat dolor sit amet velit commodo sagittis. Donec commodo pulvinar odio, ut gravida velit pellentesque vitae. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.\n\nMorbi vulputate ante quis elit pretium, ut blandit felis aliquet. Aenean a massa a leo tristique malesuada. Curabitur posuere, elit sed consectetur blandit, massa mauris tristique ante, in faucibus elit justo quis nisi. Ut viverra est et arcu egestas fringilla. Mauris condimentum, lorem id viverra placerat, libero lacus ultricies est, id volutpat metus sapien non justo. Nulla facilisis, sapien ut vehicula tristique, mauris lectus porta massa, sit amet malesuada dolor justo id lectus. Suspendisse sit amet tempor ligula. Nam sit amet nisl non magna lacinia finibus eget nec augue. Aliquam ornare cursus dapibus. Lorem ipsum dolor sit amet, consectetur adipiscing elit.\n\nDonec ornare sem eget massa pharetra rhoncus. Donec tempor sapien at posuere porttitor. Morbi sodales efficitur felis eu scelerisque. Quisque ultrices nunc ut dignissim vehicula. Donec id imperdiet orci, sed porttitor turpis. Etiam volutpat elit sed justo lobortis, tincidunt imperdiet velit pretium. Ut convallis elit sapien, ac egestas ipsum finibus a. Morbi sed odio et dui tincidunt rhoncus tempor id turpis.\n\nProin fringilla consequat imperdiet. Ut accumsan velit ac augue sollicitudin porta. Phasellus finibus porttitor felis, a feugiat purus tempus vel. Etiam vitae vehicula ex. Praesent ut tellus tellus. Fusce felis nunc, congue ac leo in, elementum vulputate nisi. Duis diam nulla, consequat ac mauris quis, viverra gravida urna.','inactivo',2,5);
INSERT INTO posts (`id`,`titulo`,`fecha_publicacion`,`contenido`,`estatus`,`usuarios_id`,`categorias_id`) VALUES (53,'Se fortalece el peso frente al dolar','2021-10-09 00:00:00','Phasellus laoreet eros nec vestibulum varius. Nunc id efficitur lacus, non imperdiet quam. Aliquam porta, tellus at porta semper, felis velit congue mauris, eu pharetra felis sem vitae tortor. Curabitur bibendum vehicula dolor, nec accumsan tortor ultrices ac. Vivamus nec tristique orci. Nullam fringilla eros magna, vitae imperdiet nisl mattis et. Ut quis malesuada felis. Proin at dictum eros, eget sodales libero. Sed egestas tristique nisi et tempor. Ut cursus sapien eu pellentesque posuere. Etiam eleifend varius cursus.\n\nNullam viverra quam porta orci efficitur imperdiet. Quisque magna erat, dignissim nec velit sit amet, hendrerit mollis mauris. Mauris sapien magna, consectetur et vulputate a, iaculis eget nisi. Nunc est diam, aliquam quis turpis ac, porta mattis neque. Quisque consequat dolor sit amet velit commodo sagittis. Donec commodo pulvinar odio, ut gravida velit pellentesque vitae. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.\n\nMorbi vulputate ante quis elit pretium, ut blandit felis aliquet. Aenean a massa a leo tristique malesuada. Curabitur posuere, elit sed consectetur blandit, massa mauris tristique ante, in faucibus elit justo quis nisi. Ut viverra est et arcu egestas fringilla. Mauris condimentum, lorem id viverra placerat, libero lacus ultricies est, id volutpat metus sapien non justo. Nulla facilisis, sapien ut vehicula tristique, mauris lectus porta massa, sit amet malesuada dolor justo id lectus. Suspendisse sit amet tempor ligula. Nam sit amet nisl non magna lacinia finibus eget nec augue. Aliquam ornare cursus dapibus. Lorem ipsum dolor sit amet, consectetur adipiscing elit.\n\nDonec ornare sem eget massa pharetra rhoncus. Donec tempor sapien at posuere porttitor. Morbi sodales efficitur felis eu scelerisque. Quisque ultrices nunc ut dignissim vehicula. Donec id imperdiet orci, sed porttitor turpis. Etiam volutpat elit sed justo lobortis, tincidunt imperdiet velit pretium. Ut convallis elit sapien, ac egestas ipsum finibus a. Morbi sed odio et dui tincidunt rhoncus tempor id turpis.\n\nProin fringilla consequat imperdiet. Ut accumsan velit ac augue sollicitudin porta. Phasellus finibus porttitor felis, a feugiat purus tempus vel. Etiam vitae vehicula ex. Praesent ut tellus tellus. Fusce felis nunc, congue ac leo in, elementum vulputate nisi. Duis diam nulla, consequat ac mauris quis, viverra gravida urna.','activo',1,5);
INSERT INTO posts (`id`,`titulo`,`fecha_publicacion`,`contenido`,`estatus`,`usuarios_id`,`categorias_id`) VALUES (54,'Tenemos ganador de la formula e','2022-11-11 00:00:00','Phasellus laoreet eros nec vestibulum varius. Nunc id efficitur lacus, non imperdiet quam. Aliquam porta, tellus at porta semper, felis velit congue mauris, eu pharetra felis sem vitae tortor. Curabitur bibendum vehicula dolor, nec accumsan tortor ultrices ac. Vivamus nec tristique orci. Nullam fringilla eros magna, vitae imperdiet nisl mattis et. Ut quis malesuada felis. Proin at dictum eros, eget sodales libero. Sed egestas tristique nisi et tempor. Ut cursus sapien eu pellentesque posuere. Etiam eleifend varius cursus.\n\nNullam viverra quam porta orci efficitur imperdiet. Quisque magna erat, dignissim nec velit sit amet, hendrerit mollis mauris. Mauris sapien magna, consectetur et vulputate a, iaculis eget nisi. Nunc est diam, aliquam quis turpis ac, porta mattis neque. Quisque consequat dolor sit amet velit commodo sagittis. Donec commodo pulvinar odio, ut gravida velit pellentesque vitae. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.\n\nMorbi vulputate ante quis elit pretium, ut blandit felis aliquet. Aenean a massa a leo tristique malesuada. Curabitur posuere, elit sed consectetur blandit, massa mauris tristique ante, in faucibus elit justo quis nisi. Ut viverra est et arcu egestas fringilla. Mauris condimentum, lorem id viverra placerat, libero lacus ultricies est, id volutpat metus sapien non justo. Nulla facilisis, sapien ut vehicula tristique, mauris lectus porta massa, sit amet malesuada dolor justo id lectus. Suspendisse sit amet tempor ligula. Nam sit amet nisl non magna lacinia finibus eget nec augue. Aliquam ornare cursus dapibus. Lorem ipsum dolor sit amet, consectetur adipiscing elit.\n\nDonec ornare sem eget massa pharetra rhoncus. Donec tempor sapien at posuere porttitor. Morbi sodales efficitur felis eu scelerisque. Quisque ultrices nunc ut dignissim vehicula. Donec id imperdiet orci, sed porttitor turpis. Etiam volutpat elit sed justo lobortis, tincidunt imperdiet velit pretium. Ut convallis elit sapien, ac egestas ipsum finibus a. Morbi sed odio et dui tincidunt rhoncus tempor id turpis.\n\nProin fringilla consequat imperdiet. Ut accumsan velit ac augue sollicitudin porta. Phasellus finibus porttitor felis, a feugiat purus tempus vel. Etiam vitae vehicula ex. Praesent ut tellus tellus. Fusce felis nunc, congue ac leo in, elementum vulputate nisi. Duis diam nulla, consequat ac mauris quis, viverra gravida urna.','activo',1,3);
INSERT INTO posts (`id`,`titulo`,`fecha_publicacion`,`contenido`,`estatus`,`usuarios_id`,`categorias_id`) VALUES (55,'Ganan partido frente a visitantes','2023-12-10 00:00:00','Phasellus laoreet eros nec vestibulum varius. Nunc id efficitur lacus, non imperdiet quam. Aliquam porta, tellus at porta semper, felis velit congue mauris, eu pharetra felis sem vitae tortor. Curabitur bibendum vehicula dolor, nec accumsan tortor ultrices ac. Vivamus nec tristique orci. Nullam fringilla eros magna, vitae imperdiet nisl mattis et. Ut quis malesuada felis. Proin at dictum eros, eget sodales libero. Sed egestas tristique nisi et tempor. Ut cursus sapien eu pellentesque posuere. Etiam eleifend varius cursus.\n\nNullam viverra quam porta orci efficitur imperdiet. Quisque magna erat, dignissim nec velit sit amet, hendrerit mollis mauris. Mauris sapien magna, consectetur et vulputate a, iaculis eget nisi. Nunc est diam, aliquam quis turpis ac, porta mattis neque. Quisque consequat dolor sit amet velit commodo sagittis. Donec commodo pulvinar odio, ut gravida velit pellentesque vitae. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.\n\nMorbi vulputate ante quis elit pretium, ut blandit felis aliquet. Aenean a massa a leo tristique malesuada. Curabitur posuere, elit sed consectetur blandit, massa mauris tristique ante, in faucibus elit justo quis nisi. Ut viverra est et arcu egestas fringilla. Mauris condimentum, lorem id viverra placerat, libero lacus ultricies est, id volutpat metus sapien non justo. Nulla facilisis, sapien ut vehicula tristique, mauris lectus porta massa, sit amet malesuada dolor justo id lectus. Suspendisse sit amet tempor ligula. Nam sit amet nisl non magna lacinia finibus eget nec augue. Aliquam ornare cursus dapibus. Lorem ipsum dolor sit amet, consectetur adipiscing elit.\n\nDonec ornare sem eget massa pharetra rhoncus. Donec tempor sapien at posuere porttitor. Morbi sodales efficitur felis eu scelerisque. Quisque ultrices nunc ut dignissim vehicula. Donec id imperdiet orci, sed porttitor turpis. Etiam volutpat elit sed justo lobortis, tincidunt imperdiet velit pretium. Ut convallis elit sapien, ac egestas ipsum finibus a. Morbi sed odio et dui tincidunt rhoncus tempor id turpis.\n\nProin fringilla consequat imperdiet. Ut accumsan velit ac augue sollicitudin porta. Phasellus finibus porttitor felis, a feugiat purus tempus vel. Etiam vitae vehicula ex. Praesent ut tellus tellus. Fusce felis nunc, congue ac leo in, elementum vulputate nisi. Duis diam nulla, consequat ac mauris quis, viverra gravida urna.','activo',2,3);
INSERT INTO posts (`id`,`titulo`,`fecha_publicacion`,`contenido`,`estatus`,`usuarios_id`,`categorias_id`) VALUES (56,'Equipo veterano da un gran espectaculo','2023-12-01 00:00:00','Phasellus laoreet eros nec vestibulum varius. Nunc id efficitur lacus, non imperdiet quam. Aliquam porta, tellus at porta semper, felis velit congue mauris, eu pharetra felis sem vitae tortor. Curabitur bibendum vehicula dolor, nec accumsan tortor ultrices ac. Vivamus nec tristique orci. Nullam fringilla eros magna, vitae imperdiet nisl mattis et. Ut quis malesuada felis. Proin at dictum eros, eget sodales libero. Sed egestas tristique nisi et tempor. Ut cursus sapien eu pellentesque posuere. Etiam eleifend varius cursus.\n\nNullam viverra quam porta orci efficitur imperdiet. Quisque magna erat, dignissim nec velit sit amet, hendrerit mollis mauris. Mauris sapien magna, consectetur et vulputate a, iaculis eget nisi. Nunc est diam, aliquam quis turpis ac, porta mattis neque. Quisque consequat dolor sit amet velit commodo sagittis. Donec commodo pulvinar odio, ut gravida velit pellentesque vitae. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.\n\nMorbi vulputate ante quis elit pretium, ut blandit felis aliquet. Aenean a massa a leo tristique malesuada. Curabitur posuere, elit sed consectetur blandit, massa mauris tristique ante, in faucibus elit justo quis nisi. Ut viverra est et arcu egestas fringilla. Mauris condimentum, lorem id viverra placerat, libero lacus ultricies est, id volutpat metus sapien non justo. Nulla facilisis, sapien ut vehicula tristique, mauris lectus porta massa, sit amet malesuada dolor justo id lectus. Suspendisse sit amet tempor ligula. Nam sit amet nisl non magna lacinia finibus eget nec augue. Aliquam ornare cursus dapibus. Lorem ipsum dolor sit amet, consectetur adipiscing elit.\n\nDonec ornare sem eget massa pharetra rhoncus. Donec tempor sapien at posuere porttitor. Morbi sodales efficitur felis eu scelerisque. Quisque ultrices nunc ut dignissim vehicula. Donec id imperdiet orci, sed porttitor turpis. Etiam volutpat elit sed justo lobortis, tincidunt imperdiet velit pretium. Ut convallis elit sapien, ac egestas ipsum finibus a. Morbi sed odio et dui tincidunt rhoncus tempor id turpis.\n\nProin fringilla consequat imperdiet. Ut accumsan velit ac augue sollicitudin porta. Phasellus finibus porttitor felis, a feugiat purus tempus vel. Etiam vitae vehicula ex. Praesent ut tellus tellus. Fusce felis nunc, congue ac leo in, elementum vulputate nisi. Duis diam nulla, consequat ac mauris quis, viverra gravida urna.','inactivo',2,3);
INSERT INTO posts (`id`,`titulo`,`fecha_publicacion`,`contenido`,`estatus`,`usuarios_id`,`categorias_id`) VALUES (57,'Escándalo con el boxeador del momento','2025-03-05 00:00:00','Phasellus laoreet eros nec vestibulum varius. Nunc id efficitur lacus, non imperdiet quam. Aliquam porta, tellus at porta semper, felis velit congue mauris, eu pharetra felis sem vitae tortor. Curabitur bibendum vehicula dolor, nec accumsan tortor ultrices ac. Vivamus nec tristique orci. Nullam fringilla eros magna, vitae imperdiet nisl mattis et. Ut quis malesuada felis. Proin at dictum eros, eget sodales libero. Sed egestas tristique nisi et tempor. Ut cursus sapien eu pellentesque posuere. Etiam eleifend varius cursus.\n\nNullam viverra quam porta orci efficitur imperdiet. Quisque magna erat, dignissim nec velit sit amet, hendrerit mollis mauris. Mauris sapien magna, consectetur et vulputate a, iaculis eget nisi. Nunc est diam, aliquam quis turpis ac, porta mattis neque. Quisque consequat dolor sit amet velit commodo sagittis. Donec commodo pulvinar odio, ut gravida velit pellentesque vitae. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.\n\nMorbi vulputate ante quis elit pretium, ut blandit felis aliquet. Aenean a massa a leo tristique malesuada. Curabitur posuere, elit sed consectetur blandit, massa mauris tristique ante, in faucibus elit justo quis nisi. Ut viverra est et arcu egestas fringilla. Mauris condimentum, lorem id viverra placerat, libero lacus ultricies est, id volutpat metus sapien non justo. Nulla facilisis, sapien ut vehicula tristique, mauris lectus porta massa, sit amet malesuada dolor justo id lectus. Suspendisse sit amet tempor ligula. Nam sit amet nisl non magna lacinia finibus eget nec augue. Aliquam ornare cursus dapibus. Lorem ipsum dolor sit amet, consectetur adipiscing elit.\n\nDonec ornare sem eget massa pharetra rhoncus. Donec tempor sapien at posuere porttitor. Morbi sodales efficitur felis eu scelerisque. Quisque ultrices nunc ut dignissim vehicula. Donec id imperdiet orci, sed porttitor turpis. Etiam volutpat elit sed justo lobortis, tincidunt imperdiet velit pretium. Ut convallis elit sapien, ac egestas ipsum finibus a. Morbi sed odio et dui tincidunt rhoncus tempor id turpis.\n\nProin fringilla consequat imperdiet. Ut accumsan velit ac augue sollicitudin porta. Phasellus finibus porttitor felis, a feugiat purus tempus vel. Etiam vitae vehicula ex. Praesent ut tellus tellus. Fusce felis nunc, congue ac leo in, elementum vulputate nisi. Duis diam nulla, consequat ac mauris quis, viverra gravida urna.','activo',4,4);
INSERT INTO posts (`id`,`titulo`,`fecha_publicacion`,`contenido`,`estatus`,`usuarios_id`,`categorias_id`) VALUES (58,'Fuccia OS sacude al mundo','2028-10-10 00:00:00','Phasellus laoreet eros nec vestibulum varius. Nunc id efficitur lacus, non imperdiet quam. Aliquam porta, tellus at porta semper, felis velit congue mauris, eu pharetra felis sem vitae tortor. Curabitur bibendum vehicula dolor, nec accumsan tortor ultrices ac. Vivamus nec tristique orci. Nullam fringilla eros magna, vitae imperdiet nisl mattis et. Ut quis malesuada felis. Proin at dictum eros, eget sodales libero. Sed egestas tristique nisi et tempor. Ut cursus sapien eu pellentesque posuere. Etiam eleifend varius cursus.\n\nNullam viverra quam porta orci efficitur imperdiet. Quisque magna erat, dignissim nec velit sit amet, hendrerit mollis mauris. Mauris sapien magna, consectetur et vulputate a, iaculis eget nisi. Nunc est diam, aliquam quis turpis ac, porta mattis neque. Quisque consequat dolor sit amet velit commodo sagittis. Donec commodo pulvinar odio, ut gravida velit pellentesque vitae. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.\n\nMorbi vulputate ante quis elit pretium, ut blandit felis aliquet. Aenean a massa a leo tristique malesuada. Curabitur posuere, elit sed consectetur blandit, massa mauris tristique ante, in faucibus elit justo quis nisi. Ut viverra est et arcu egestas fringilla. Mauris condimentum, lorem id viverra placerat, libero lacus ultricies est, id volutpat metus sapien non justo. Nulla facilisis, sapien ut vehicula tristique, mauris lectus porta massa, sit amet malesuada dolor justo id lectus. Suspendisse sit amet tempor ligula. Nam sit amet nisl non magna lacinia finibus eget nec augue. Aliquam ornare cursus dapibus. Lorem ipsum dolor sit amet, consectetur adipiscing elit.\n\nDonec ornare sem eget massa pharetra rhoncus. Donec tempor sapien at posuere porttitor. Morbi sodales efficitur felis eu scelerisque. Quisque ultrices nunc ut dignissim vehicula. Donec id imperdiet orci, sed porttitor turpis. Etiam volutpat elit sed justo lobortis, tincidunt imperdiet velit pretium. Ut convallis elit sapien, ac egestas ipsum finibus a. Morbi sed odio et dui tincidunt rhoncus tempor id turpis.\n\nProin fringilla consequat imperdiet. Ut accumsan velit ac augue sollicitudin porta. Phasellus finibus porttitor felis, a feugiat purus tempus vel. Etiam vitae vehicula ex. Praesent ut tellus tellus. Fusce felis nunc, congue ac leo in, elementum vulputate nisi. Duis diam nulla, consequat ac mauris quis, viverra gravida urna.','activo',1,2);
INSERT INTO posts (`id`,`titulo`,`fecha_publicacion`,`contenido`,`estatus`,`usuarios_id`,`categorias_id`) VALUES (59,'U.S. Robotics presenta hallazgo','2029-01-10 00:00:00','Phasellus laoreet eros nec vestibulum varius. Nunc id efficitur lacus, non imperdiet quam. Aliquam porta, tellus at porta semper, felis velit congue mauris, eu pharetra felis sem vitae tortor. Curabitur bibendum vehicula dolor, nec accumsan tortor ultrices ac. Vivamus nec tristique orci. Nullam fringilla eros magna, vitae imperdiet nisl mattis et. Ut quis malesuada felis. Proin at dictum eros, eget sodales libero. Sed egestas tristique nisi et tempor. Ut cursus sapien eu pellentesque posuere. Etiam eleifend varius cursus.\n\nNullam viverra quam porta orci efficitur imperdiet. Quisque magna erat, dignissim nec velit sit amet, hendrerit mollis mauris. Mauris sapien magna, consectetur et vulputate a, iaculis eget nisi. Nunc est diam, aliquam quis turpis ac, porta mattis neque. Quisque consequat dolor sit amet velit commodo sagittis. Donec commodo pulvinar odio, ut gravida velit pellentesque vitae. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.\n\nMorbi vulputate ante quis elit pretium, ut blandit felis aliquet. Aenean a massa a leo tristique malesuada. Curabitur posuere, elit sed consectetur blandit, massa mauris tristique ante, in faucibus elit justo quis nisi. Ut viverra est et arcu egestas fringilla. Mauris condimentum, lorem id viverra placerat, libero lacus ultricies est, id volutpat metus sapien non justo. Nulla facilisis, sapien ut vehicula tristique, mauris lectus porta massa, sit amet malesuada dolor justo id lectus. Suspendisse sit amet tempor ligula. Nam sit amet nisl non magna lacinia finibus eget nec augue. Aliquam ornare cursus dapibus. Lorem ipsum dolor sit amet, consectetur adipiscing elit.\n\nDonec ornare sem eget massa pharetra rhoncus. Donec tempor sapien at posuere porttitor. Morbi sodales efficitur felis eu scelerisque. Quisque ultrices nunc ut dignissim vehicula. Donec id imperdiet orci, sed porttitor turpis. Etiam volutpat elit sed justo lobortis, tincidunt imperdiet velit pretium. Ut convallis elit sapien, ac egestas ipsum finibus a. Morbi sed odio et dui tincidunt rhoncus tempor id turpis.\n\nProin fringilla consequat imperdiet. Ut accumsan velit ac augue sollicitudin porta. Phasellus finibus porttitor felis, a feugiat purus tempus vel. Etiam vitae vehicula ex. Praesent ut tellus tellus. Fusce felis nunc, congue ac leo in, elementum vulputate nisi. Duis diam nulla, consequat ac mauris quis, viverra gravida urna.\n','activo',1,2);
INSERT INTO posts (`id`,`titulo`,`fecha_publicacion`,`contenido`,`estatus`,`usuarios_id`,`categorias_id`) VALUES (60,'Cierra campeonato mundial de football de manera impresionante','2023-04-10 00:00:00','Phasellus laoreet eros nec vestibulum varius. Nunc id efficitur lacus, non imperdiet quam. Aliquam porta, tellus at porta semper, felis velit congue mauris, eu pharetra felis sem vitae tortor. Curabitur bibendum vehicula dolor, nec accumsan tortor ultrices ac. Vivamus nec tristique orci. Nullam fringilla eros magna, vitae imperdiet nisl mattis et. Ut quis malesuada felis. Proin at dictum eros, eget sodales libero. Sed egestas tristique nisi et tempor. Ut cursus sapien eu pellentesque posuere. Etiam eleifend varius cursus.\n\nNullam viverra quam porta orci efficitur imperdiet. Quisque magna erat, dignissim nec velit sit amet, hendrerit mollis mauris. Mauris sapien magna, consectetur et vulputate a, iaculis eget nisi. Nunc est diam, aliquam quis turpis ac, porta mattis neque. Quisque consequat dolor sit amet velit commodo sagittis. Donec commodo pulvinar odio, ut gravida velit pellentesque vitae. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.\n\nMorbi vulputate ante quis elit pretium, ut blandit felis aliquet. Aenean a massa a leo tristique malesuada. Curabitur posuere, elit sed consectetur blandit, massa mauris tristique ante, in faucibus elit justo quis nisi. Ut viverra est et arcu egestas fringilla. Mauris condimentum, lorem id viverra placerat, libero lacus ultricies est, id volutpat metus sapien non justo. Nulla facilisis, sapien ut vehicula tristique, mauris lectus porta massa, sit amet malesuada dolor justo id lectus. Suspendisse sit amet tempor ligula. Nam sit amet nisl non magna lacinia finibus eget nec augue. Aliquam ornare cursus dapibus. Lorem ipsum dolor sit amet, consectetur adipiscing elit.\n\nDonec ornare sem eget massa pharetra rhoncus. Donec tempor sapien at posuere porttitor. Morbi sodales efficitur felis eu scelerisque. Quisque ultrices nunc ut dignissim vehicula. Donec id imperdiet orci, sed porttitor turpis. Etiam volutpat elit sed justo lobortis, tincidunt imperdiet velit pretium. Ut convallis elit sapien, ac egestas ipsum finibus a. Morbi sed odio et dui tincidunt rhoncus tempor id turpis.\n\nProin fringilla consequat imperdiet. Ut accumsan velit ac augue sollicitudin porta. Phasellus finibus porttitor felis, a feugiat purus tempus vel. Etiam vitae vehicula ex. Praesent ut tellus tellus. Fusce felis nunc, congue ac leo in, elementum vulputate nisi. Duis diam nulla, consequat ac mauris quis, viverra gravida urna.\n','activo',2,3);
INSERT INTO posts (`id`,`titulo`,`fecha_publicacion`,`contenido`,`estatus`,`usuarios_id`,`categorias_id`) VALUES (61,'Escándalo en el mundo de la moda','2022-04-11 00:00:00','Phasellus laoreet eros nec vestibulum varius. Nunc id efficitur lacus, non imperdiet quam. Aliquam porta, tellus at porta semper, felis velit congue mauris, eu pharetra felis sem vitae tortor. Curabitur bibendum vehicula dolor, nec accumsan tortor ultrices ac. Vivamus nec tristique orci. Nullam fringilla eros magna, vitae imperdiet nisl mattis et. Ut quis malesuada felis. Proin at dictum eros, eget sodales libero. Sed egestas tristique nisi et tempor. Ut cursus sapien eu pellentesque posuere. Etiam eleifend varius cursus.\n\nNullam viverra quam porta orci efficitur imperdiet. Quisque magna erat, dignissim nec velit sit amet, hendrerit mollis mauris. Mauris sapien magna, consectetur et vulputate a, iaculis eget nisi. Nunc est diam, aliquam quis turpis ac, porta mattis neque. Quisque consequat dolor sit amet velit commodo sagittis. Donec commodo pulvinar odio, ut gravida velit pellentesque vitae. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.\n\nMorbi vulputate ante quis elit pretium, ut blandit felis aliquet. Aenean a massa a leo tristique malesuada. Curabitur posuere, elit sed consectetur blandit, massa mauris tristique ante, in faucibus elit justo quis nisi. Ut viverra est et arcu egestas fringilla. Mauris condimentum, lorem id viverra placerat, libero lacus ultricies est, id volutpat metus sapien non justo. Nulla facilisis, sapien ut vehicula tristique, mauris lectus porta massa, sit amet malesuada dolor justo id lectus. Suspendisse sit amet tempor ligula. Nam sit amet nisl non magna lacinia finibus eget nec augue. Aliquam ornare cursus dapibus. Lorem ipsum dolor sit amet, consectetur adipiscing elit.\n\nDonec ornare sem eget massa pharetra rhoncus. Donec tempor sapien at posuere porttitor. Morbi sodales efficitur felis eu scelerisque. Quisque ultrices nunc ut dignissim vehicula. Donec id imperdiet orci, sed porttitor turpis. Etiam volutpat elit sed justo lobortis, tincidunt imperdiet velit pretium. Ut convallis elit sapien, ac egestas ipsum finibus a. Morbi sed odio et dui tincidunt rhoncus tempor id turpis.\n\nProin fringilla consequat imperdiet. Ut accumsan velit ac augue sollicitudin porta. Phasellus finibus porttitor felis, a feugiat purus tempus vel. Etiam vitae vehicula ex. Praesent ut tellus tellus. Fusce felis nunc, congue ac leo in, elementum vulputate nisi. Duis diam nulla, consequat ac mauris quis, viverra gravida urna.\n','activo',4,4);
INSERT INTO posts (`id`,`titulo`,`fecha_publicacion`,`contenido`,`estatus`,`usuarios_id`,`categorias_id`) VALUES (62,'Tenemos campeona del mundial de volleiball','2024-09-09 00:00:00','Phasellus laoreet eros nec vestibulum varius. Nunc id efficitur lacus, non imperdiet quam. Aliquam porta, tellus at porta semper, felis velit congue mauris, eu pharetra felis sem vitae tortor. Curabitur bibendum vehicula dolor, nec accumsan tortor ultrices ac. Vivamus nec tristique orci. Nullam fringilla eros magna, vitae imperdiet nisl mattis et. Ut quis malesuada felis. Proin at dictum eros, eget sodales libero. Sed egestas tristique nisi et tempor. Ut cursus sapien eu pellentesque posuere. Etiam eleifend varius cursus.\n\nNullam viverra quam porta orci efficitur imperdiet. Quisque magna erat, dignissim nec velit sit amet, hendrerit mollis mauris. Mauris sapien magna, consectetur et vulputate a, iaculis eget nisi. Nunc est diam, aliquam quis turpis ac, porta mattis neque. Quisque consequat dolor sit amet velit commodo sagittis. Donec commodo pulvinar odio, ut gravida velit pellentesque vitae. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.\n\nMorbi vulputate ante quis elit pretium, ut blandit felis aliquet. Aenean a massa a leo tristique malesuada. Curabitur posuere, elit sed consectetur blandit, massa mauris tristique ante, in faucibus elit justo quis nisi. Ut viverra est et arcu egestas fringilla. Mauris condimentum, lorem id viverra placerat, libero lacus ultricies est, id volutpat metus sapien non justo. Nulla facilisis, sapien ut vehicula tristique, mauris lectus porta massa, sit amet malesuada dolor justo id lectus. Suspendisse sit amet tempor ligula. Nam sit amet nisl non magna lacinia finibus eget nec augue. Aliquam ornare cursus dapibus. Lorem ipsum dolor sit amet, consectetur adipiscing elit.\n\nDonec ornare sem eget massa pharetra rhoncus. Donec tempor sapien at posuere porttitor. Morbi sodales efficitur felis eu scelerisque. Quisque ultrices nunc ut dignissim vehicula. Donec id imperdiet orci, sed porttitor turpis. Etiam volutpat elit sed justo lobortis, tincidunt imperdiet velit pretium. Ut convallis elit sapien, ac egestas ipsum finibus a. Morbi sed odio et dui tincidunt rhoncus tempor id turpis.\n\nProin fringilla consequat imperdiet. Ut accumsan velit ac augue sollicitudin porta. Phasellus finibus porttitor felis, a feugiat purus tempus vel. Etiam vitae vehicula ex. Praesent ut tellus tellus. Fusce felis nunc, congue ac leo in, elementum vulputate nisi. Duis diam nulla, consequat ac mauris quis, viverra gravida urna.\n','inactivo',2,3);
INSERT INTO posts (`id`,`titulo`,`fecha_publicacion`,`contenido`,`estatus`,`usuarios_id`,`categorias_id`) VALUES (63,'Se descubre la unión entre astrofísica y fisica cuántica','2022-05-03 00:00:00','Phasellus laoreet eros nec vestibulum varius. Nunc id efficitur lacus, non imperdiet quam. Aliquam porta, tellus at porta semper, felis velit congue mauris, eu pharetra felis sem vitae tortor. Curabitur bibendum vehicula dolor, nec accumsan tortor ultrices ac. Vivamus nec tristique orci. Nullam fringilla eros magna, vitae imperdiet nisl mattis et. Ut quis malesuada felis. Proin at dictum eros, eget sodales libero. Sed egestas tristique nisi et tempor. Ut cursus sapien eu pellentesque posuere. Etiam eleifend varius cursus.\n\nNullam viverra quam porta orci efficitur imperdiet. Quisque magna erat, dignissim nec velit sit amet, hendrerit mollis mauris. Mauris sapien magna, consectetur et vulputate a, iaculis eget nisi. Nunc est diam, aliquam quis turpis ac, porta mattis neque. Quisque consequat dolor sit amet velit commodo sagittis. Donec commodo pulvinar odio, ut gravida velit pellentesque vitae. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.\n\nMorbi vulputate ante quis elit pretium, ut blandit felis aliquet. Aenean a massa a leo tristique malesuada. Curabitur posuere, elit sed consectetur blandit, massa mauris tristique ante, in faucibus elit justo quis nisi. Ut viverra est et arcu egestas fringilla. Mauris condimentum, lorem id viverra placerat, libero lacus ultricies est, id volutpat metus sapien non justo. Nulla facilisis, sapien ut vehicula tristique, mauris lectus porta massa, sit amet malesuada dolor justo id lectus. Suspendisse sit amet tempor ligula. Nam sit amet nisl non magna lacinia finibus eget nec augue. Aliquam ornare cursus dapibus. Lorem ipsum dolor sit amet, consectetur adipiscing elit.\n\nDonec ornare sem eget massa pharetra rhoncus. Donec tempor sapien at posuere porttitor. Morbi sodales efficitur felis eu scelerisque. Quisque ultrices nunc ut dignissim vehicula. Donec id imperdiet orci, sed porttitor turpis. Etiam volutpat elit sed justo lobortis, tincidunt imperdiet velit pretium. Ut convallis elit sapien, ac egestas ipsum finibus a. Morbi sed odio et dui tincidunt rhoncus tempor id turpis.\n\nProin fringilla consequat imperdiet. Ut accumsan velit ac augue sollicitudin porta. Phasellus finibus porttitor felis, a feugiat purus tempus vel. Etiam vitae vehicula ex. Praesent ut tellus tellus. Fusce felis nunc, congue ac leo in, elementum vulputate nisi. Duis diam nulla, consequat ac mauris quis, viverra gravida urna.\n','inactivo',3,1);
INSERT INTO posts (`id`,`titulo`,`fecha_publicacion`,`contenido`,`estatus`,`usuarios_id`,`categorias_id`) VALUES (64,'El post que se quedó huérfano','2029-08-08 00:00:00','\'Phasellus laoreet eros nec vestibulum varius. Nunc id efficitur lacus, non imperdiet quam. Aliquam porta, tellus at porta semper, felis velit congue mauris, eu pharetra felis sem vitae tortor. Curabitur bibendum vehicula dolor, nec accumsan tortor ultrices ac. Vivamus nec tristique orci. Nullam fringilla eros magna, vitae imperdiet nisl mattis et. Ut quis malesuada felis. Proin at dictum eros, eget sodales libero. Sed egestas tristique nisi et tempor. Ut cursus sapien eu pellentesque posuere. Etiam eleifend varius cursus.\n\nNullam viverra quam porta orci efficitur imperdiet. Quisque magna erat, dignissim nec velit sit amet, hendrerit mollis mauris. Mauris sapien magna, consectetur et vulputate a, iaculis eget nisi. Nunc est diam, aliquam quis turpis ac, porta mattis neque. Quisque consequat dolor sit amet velit commodo sagittis. Donec commodo pulvinar odio, ut gravida velit pellentesque vitae. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.\n\nMorbi vulputate ante quis elit pretium, ut blandit felis aliquet. Aenean a massa a leo tristique malesuada. Curabitur posuere, elit sed consectetur blandit, massa mauris tristique ante, in faucibus elit justo quis nisi. Ut viverra est et arcu egestas fringilla. Mauris condimentum, lorem id viverra placerat, libero lacus ultricies est, id volutpat metus sapien non justo. Nulla facilisis, sapien ut vehicula tristique, mauris lectus porta massa, sit amet malesuada dolor justo id lectus. Suspendisse sit amet tempor ligula. Nam sit amet nisl non magna lacinia finibus eget nec augue. Aliquam ornare cursus dapibus. Lorem ipsum dolor sit amet, consectetur adipiscing elit.\n\nDonec ornare sem eget massa pharetra rhoncus. Donec tempor sapien at posuere porttitor. Morbi sodales efficitur felis eu scelerisque. Quisque ultrices nunc ut dignissim vehicula. Donec id imperdiet orci, sed porttitor turpis. Etiam volutpat elit sed justo lobortis, tincidunt imperdiet velit pretium. Ut convallis elit sapien, ac egestas ipsum finibus a. Morbi sed odio et dui tincidunt rhoncus tempor id turpis.\n\nProin fringilla consequat imperdiet. Ut accumsan velit ac augue sollicitudin porta. Phasellus finibus porttitor felis, a feugiat purus tempus vel. Etiam vitae vehicula ex. Praesent ut tellus tellus. Fusce felis nunc, congue ac leo in, elementum vulputate nisi. Duis diam nulla, consequat ac mauris quis, viverra gravida urna.\n\'','activo',NULL,NULL);
-- Posts-etiquetas
INSERT INTO posts_etiquetas (`id`,`posts_id`,`etiquetas_id`) VALUES (1,43,3);
INSERT INTO posts_etiquetas (`id`,`posts_id`,`etiquetas_id`) VALUES (2,43,11);
INSERT INTO posts_etiquetas (`id`,`posts_id`,`etiquetas_id`) VALUES (3,44,2);
INSERT INTO posts_etiquetas (`id`,`posts_id`,`etiquetas_id`) VALUES (4,44,4);
INSERT INTO posts_etiquetas (`id`,`posts_id`,`etiquetas_id`) VALUES (5,45,14);
INSERT INTO posts_etiquetas (`id`,`posts_id`,`etiquetas_id`) VALUES (6,45,13);
INSERT INTO posts_etiquetas (`id`,`posts_id`,`etiquetas_id`) VALUES (7,46,10);
INSERT INTO posts_etiquetas (`id`,`posts_id`,`etiquetas_id`) VALUES (8,46,11);
INSERT INTO posts_etiquetas (`id`,`posts_id`,`etiquetas_id`) VALUES (9,46,12);
INSERT INTO posts_etiquetas (`id`,`posts_id`,`etiquetas_id`) VALUES (10,46,20);
INSERT INTO posts_etiquetas (`id`,`posts_id`,`etiquetas_id`) VALUES (11,47,10);
INSERT INTO posts_etiquetas (`id`,`posts_id`,`etiquetas_id`) VALUES (12,48,1);
INSERT INTO posts_etiquetas (`id`,`posts_id`,`etiquetas_id`) VALUES (13,48,2);
INSERT INTO posts_etiquetas (`id`,`posts_id`,`etiquetas_id`) VALUES (14,48,4);
INSERT INTO posts_etiquetas (`id`,`posts_id`,`etiquetas_id`) VALUES (15,48,13);
INSERT INTO posts_etiquetas (`id`,`posts_id`,`etiquetas_id`) VALUES (16,49,13);
INSERT INTO posts_etiquetas (`id`,`posts_id`,`etiquetas_id`) VALUES (17,49,14);
INSERT INTO posts_etiquetas (`id`,`posts_id`,`etiquetas_id`) VALUES (18,49,17);
INSERT INTO posts_etiquetas (`id`,`posts_id`,`etiquetas_id`) VALUES (19,50,13);
INSERT INTO posts_etiquetas (`id`,`posts_id`,`etiquetas_id`) VALUES (20,50,14);
INSERT INTO posts_etiquetas (`id`,`posts_id`,`etiquetas_id`) VALUES (21,50,16);
INSERT INTO posts_etiquetas (`id`,`posts_id`,`etiquetas_id`) VALUES (22,51,7);
INSERT INTO posts_etiquetas (`id`,`posts_id`,`etiquetas_id`) VALUES (23,51,8);
INSERT INTO posts_etiquetas (`id`,`posts_id`,`etiquetas_id`) VALUES (24,51,9);
INSERT INTO posts_etiquetas (`id`,`posts_id`,`etiquetas_id`) VALUES (25,51,18);
INSERT INTO posts_etiquetas (`id`,`posts_id`,`etiquetas_id`) VALUES (26,52,8);
INSERT INTO posts_etiquetas (`id`,`posts_id`,`etiquetas_id`) VALUES (27,52,18);
INSERT INTO posts_etiquetas (`id`,`posts_id`,`etiquetas_id`) VALUES (28,53,7);
INSERT INTO posts_etiquetas (`id`,`posts_id`,`etiquetas_id`) VALUES (29,53,8);
INSERT INTO posts_etiquetas (`id`,`posts_id`,`etiquetas_id`) VALUES (30,54,4);
INSERT INTO posts_etiquetas (`id`,`posts_id`,`etiquetas_id`) VALUES (31,54,5);
INSERT INTO posts_etiquetas (`id`,`posts_id`,`etiquetas_id`) VALUES (32,55,5);
INSERT INTO posts_etiquetas (`id`,`posts_id`,`etiquetas_id`) VALUES (33,55,6);
INSERT INTO posts_etiquetas (`id`,`posts_id`,`etiquetas_id`) VALUES (34,56,5);
INSERT INTO posts_etiquetas (`id`,`posts_id`,`etiquetas_id`) VALUES (35,56,6);
INSERT INTO posts_etiquetas (`id`,`posts_id`,`etiquetas_id`) VALUES (36,56,10);
INSERT INTO posts_etiquetas (`id`,`posts_id`,`etiquetas_id`) VALUES (37,58,2);
INSERT INTO posts_etiquetas (`id`,`posts_id`,`etiquetas_id`) VALUES (38,58,3);
INSERT INTO posts_etiquetas (`id`,`posts_id`,`etiquetas_id`) VALUES (39,58,13);
INSERT INTO posts_etiquetas (`id`,`posts_id`,`etiquetas_id`) VALUES (40,59,1);
INSERT INTO posts_etiquetas (`id`,`posts_id`,`etiquetas_id`) VALUES (41,59,13);
INSERT INTO posts_etiquetas (`id`,`posts_id`,`etiquetas_id`) VALUES (42,57,10);
INSERT INTO posts_etiquetas (`id`,`posts_id`,`etiquetas_id`) VALUES (43,60,5);
INSERT INTO posts_etiquetas (`id`,`posts_id`,`etiquetas_id`) VALUES (44,60,6);
INSERT INTO posts_etiquetas (`id`,`posts_id`,`etiquetas_id`) VALUES (45,61,10);
INSERT INTO posts_etiquetas (`id`,`posts_id`,`etiquetas_id`) VALUES (46,61,12);
INSERT INTO posts_etiquetas (`id`,`posts_id`,`etiquetas_id`) VALUES (47,61,20);
INSERT INTO posts_etiquetas (`id`,`posts_id`,`etiquetas_id`) VALUES (48,62,5);
INSERT INTO posts_etiquetas (`id`,`posts_id`,`etiquetas_id`) VALUES (49,62,10);
INSERT INTO posts_etiquetas (`id`,`posts_id`,`etiquetas_id`) VALUES (50,63,13);
INSERT INTO posts_etiquetas (`id`,`posts_id`,`etiquetas_id`) VALUES (51,63,14);
INSERT INTO posts_etiquetas (`id`,`posts_id`,`etiquetas_id`) VALUES (52,63,17);
INSERT INTO posts_etiquetas (`id`,`posts_id`,`etiquetas_id`) VALUES (53,52,19);



--QUERIES: CONSULTAS A UNA BASE DE DATOS:
/*La estructura básica de un Query se conforma del comando SELECT, FROM y WHERE. Vale la pena mencionar que siempre que se quiera 
obtener información de una entidad, lo que en realidad estará pasando es que se estarán extrayendo todos los datos pertenecientes 
a una columna (atributo) en específico de una tabla. 
  •	Para ello se utiliza el comando SELECT, en el cual se indica el nombre del atributo o columna de datos que se quiere extraer 
    y a qué tabla o entidad pertenecen por medio de la instrucción FROM. Si después de la instrucción se utiliza un asterisco * 
    en vez del nombre de una columna, es porque se quieren extraer todos los datos.
    o	Existe una instrucción adicional que se puede utilizar en conjunto con el comando SELECT y se llama AS, la cual sirve para 
      cambiar el nombre de la columna de datos extraída (darle un alias), cambiando solo la forma en la que se me presentan los 
      datos, no en sí el nombre del atributo en la base de datos.
    o	De igual forma existe el método COUNT() que siempre se debe utilizar alado del método SELECT, el cual recibe como parámetro 
      un atributo de datos pertenecientes a la tabla y retorna el número de filas de datos que pertenecen a dicha columna.
    o	Se había mencionado previamente que a través de la sentencia FROM se indica de qué tabla o entidad se extraerán los datos 
      requeridos, aunque solo se estableció el caso donde esto se realizaba para una sola entidad, pero cuando se quiera extraer 
      datos de dos tablas distintas, se añade la instrucción JOIN, pero es muy importante mencionar que esto solo se podrá realizar 
      en aquellas entidades que se encuentren enlazadas a través de una relación, osea cuando una contenga una PRIMARY KEY y la 
      otra posea una FOREIGN KEY, ambas unidas a través de un índice en el diagrama físico. 
      -	Se puede representar de forma gráfica el funcionamiento de una instrucción JOIN a través de un Diagrama de Venn
        •	Cabe mencionar que, para relacionar los datos de ambas tablas:
          o	Primero se indica a través del método FROM la entidad que tenga cardinalidad de 1 (que adoptará la posición izquierda).
          o	Y luego a través de alguna variante de Diferencia o Intersección del método JOIN se denota la entidad con cardinalidad 
            de N (que tomará la posición derecha). 
          o	Finalmente, ambas se conectan a través de la instrucción ON que se acompaña tanto del atributo que represente el 
            PRIMARY_KEY en la tabla izquierda y esto se iguala al atributo que represente el FOREIGN_KEY de la entidad derecha.
   
 
  •	Además de forma opcional se podrá indicar exactamente a cuáles filas de la tabla nos estamos refiriendo, filtrándola así a 
    través de cierta condición lógica (=, >, <, etc.), ya que la extracción se puede realizar en una o varias filas, para ello se 
    utiliza el comando WHERE acompañado de algún valor.
  •	La sentencia GROUP BY de igual forma es opcional y sirve para crear una agrupación de datos.
  •	El comando ORDER BY también es opcional y su función es la de ordenar una agrupación de datos.
    o	HAVING igualmente se usa de forma opcional y lo que hace es filtrar a través de cierta condición lógica a través del atributo 
      indicado en el comando ORDER BY.
              SELECT		Nombre_Columna_1 AS Nuevo_Nombre_Atributo_1, COUNT(Columna_n)
              FROM		Nombre_Tabla_Izq
                --Unión opcional de Diferencia o Intersección entre dos tablas diferentes.
              JOIN	Entidad_Der ON Atributo_Izq.PRIMARY_KEY = Atributo_Der.FOREIGN_KEY
              WHERE		Nombre_Atributo_o_Columna Operación Lógica "Valor_Fila_Para_Filtro”
              GROUP BY	Nombre_Atributo_o_Columna
              ORDER BY	Nombre_Atributo_o_Columna
              HAVING		Nombre_Atributo_o_Columna Operación Lógica "Valor_Fila_Para_Filtro”;*/

/*INSTRUCCIÓN PARA EXTRAER TODAS LAS COLUMNAS DE LA TABLA POSTS:*/
SELECT 	* 
FROM 	  posts;

/*INSTRUCCIÓN PARA EXTRAER SOLO CIERTAS COLUMNAS DE DATOS DE LA TABLA POSTS:*/
SELECT 	titulo, fecha_publicacion, estatus
FROM 	  posts;

/*INSTRUCCIÓN PARA EXTRAER Y CAMBIAR EL NOMBRE DE SOLO CIERTAS COLUMNAS DE DATOS DE LA TABLA POSTS:*/
SELECT 	titulo AS encabezado, fecha_publicacion AS publicado_en, estatus
FROM 	  posts;

/*COUNT(): MÈTODO QUE DEVUELVE EL NÚMERO DE FILAS QUE CONFORMAN A TODA LA TABLA POSTS:*/
SELECT 	COUNT(*)
FROM 	  posts;

/*INSTRUCCIÓN QUE DEVUELVE EL NÚMERO DE FILAS QUE CONFORMAN A TODA LA TABLA POSTS Y SE LE DA UN ALIAS NUEVO:*/
SELECT 	COUNT(*) AS numero_posts
FROM 	  posts;

/*INSTRUCCIÓN PARA EXTRAER TODAS LAS COLUMNAS DE LA TABLA USUARIOS Y UNIR SU CONTENIDO CON LOS DATOS EXTRAÍDOS DE LA TABLA POSTS,
UNIENDO TODO A TRAVÉS DEL ATRIBUTO QUE REPRESENTA EL PRIMARY KEY DE LA TABLA USUARIOS (QUE CORRESPONDE AL CÍRCULO IZQUIERDO EN EL 
DIAGRAMA DE VENN, YA QUE SE MENCIONÓ PRIMERO CON EL COMANDO FROM) CON EL ATRIBUTO QUE REPRESENTE EL FOREIGN KEY DE LA TABLA POSTS 
(QUE SE SITÚA EN EL LADO DERECHO DEL DIAGRAMA DE VENN PORQUE SE UTILIZÓ A TRAVÉS DEL COMANDO JOIN).*/

--DIAGRAMA DE VENN: DIFERENCIA = A - B.
/*INSTRUCCIÓN DE SQL QUE REPRESENTA EL LEFT JOIN QUE TRAE TODOS LOS DATOS DEL CONJUNTO A (USUARIOS), NO IMPORTANDO SI ESTOS 
APARECEN O NO EN EL CONJUNTO B (POSTS): Osea los usuarios que tengan o no posts.*/
SELECT 	* 
FROM 	  usuarios
  LEFT JOIN posts ON usuarios.id = posts.usuarios_id;
/*INSTRUCCIÓN DE SQL QUE REPRESENTA EL LEFT JOIN QUE TRAE TODOS LOS DATOS DEL CONJUNTO A (USUARIOS) QUE NO APAREZCAN EN EL 
CONJUNTO B (POSTS) = A - B: Osea solo los usuarios que no tengan ningún post.*/
SELECT 	* 
FROM 	  usuarios
  LEFT JOIN posts ON usuarios.id = posts.usuarios_id
WHERE   posts.usuarios_id IS NULL;
/*INSTRUCCIÓN DE SQL QUE REPRESENTA EL RIGHT JOIN QUE TRAE TODOS LOS DATOS DEL CONJUNTO B (POSTS), NO IMPORTANDO SI ESTOS 
APARECEN O NO EN EL CONJUNTO A (USUARIOS): Osea los posts que tengan o no usuarios, aunque se mantiene el órden en el que se 
muestran los datos de la consulta, mostrando primero los del conjunto de la izquierda y luego el del conjunto de la derecha.*/
SELECT 	* 
FROM 	  usuarios
  RIGHT JOIN posts ON usuarios.id = posts.usuarios_id;
/*INSTRUCCIÓN DE SQL QUE REPRESENTA EL LEFT JOIN QUE TRAE TODOS LOS DATOS DEL CONJUNTO A (USUARIOS) QUE NO APAREZCAN EN EL 
CONJUNTO B (POSTS) = A - B: Osea solo los posts que no tengan ningún usuario.*/
SELECT 	* 
FROM 	  usuarios
  RIGHT JOIN posts ON usuarios.id = posts.usuarios_id
WHERE   posts.usuarios_id IS NULL;


--DIAGRAMA DE VENN: INTERSECCIÓN = A ∩ B.
/*INSTRUCCIÓN DE SQL QUE REPRESENTA LA INTERSECCIÓN DE LOS DATOS DEL CONJUNTO A (USUARIOS) Y EL CONJUNTO B (POSTS) = A ∩ B: 
Osea todos los usuarios que tengan un post.*/
SELECT 	* 
FROM 	  usuarios
  INNER JOIN posts ON usuarios.id = posts.usuarios_id;


--DIAGRAMA DE VENN: UNIÓN = A U B.
/*INSTRUCCIÓN DE SQL QUE REPRESENTA LA UNIÓN DE LOS DATOS DEL CONJUNTO A (USUARIOS) Y EL CONJUNTO B (POSTS) = A U B: 
Osea todos los usuarios que tengan un o no un post y todos los posts que tengan o no un usuario.*/
--La siguiente instrucción de unión funciona en algunas bases de datos, pero no en todas, por lo cual existe una alternativa.
/*SELECT 	* 
FROM 	  usuarios
  FULL OUTER JOIN posts ON usuarios.id = posts.usuarios_id;*/
--La alternativa es una combinación de A + B, donde la instrucción UNION significa la suma de dos conjuntos.
SELECT 	* 
FROM 	  usuarios
  LEFT JOIN posts ON usuarios.id = posts.usuarios_id
UNION
SELECT 	* 
FROM 	  usuarios
  RIGHT JOIN posts ON usuarios.id = posts.usuarios_id;


--DIAGRAMA DE VENN: DIFERENCIA SIMÉTRICA = (A-B) U (B-A) = (A-B) + (B-A) = A U B - A ∩ B.
/*INSTRUCCIÓN DE SQL QUE REPRESENTA LA UNIÓN DE LOS DATOS DEL CONJUNTO A (USUARIOS) Y EL CONJUNTO B (POSTS) = A U B: 
Osea solo los usuarios que no tengan ningún post y todos los posts que no tengan ningún usuario.*/
--La alternativa es una combinación de (A-B) + (B-A), donde la instrucción UNION significa la suma de dos conjuntos.
SELECT 	* 
FROM 	  usuarios
  LEFT JOIN posts ON usuarios.id = posts.usuarios_id
WHERE   posts.usuarios_id IS NULL
UNION
SELECT 	* 
FROM 	  usuarios
  RIGHT JOIN posts ON usuarios.id = posts.usuarios_id
WHERE   posts.usuarios_id IS NULL;


/*INSTRUCCIÓN PARA EXTRAER TODAS LAS COLUMNAS DE LA TABLA POSTS, PERO SOLO LAS FILAS DONDE SE CUMPLA LA CONDICIÓN DEL 
COMANDO WHERE, PERO VALE LA PENA MENCIONAR QUE SOLO SE PODRÁN EJECUTAR OPERACIONES LÓGICAS MATEMÁTICAS CON DATOS QUE 
HAYAN SIDO DEFINIDOS EN LA BASE DE DATOS COMO NUMÉRICOS:*/
SELECT 	* 
FROM 	  posts
WHERE   id <= 50;
/*ESTA MISMA INSTRUCCIÓN SE PUEDE APLICAR TAMBIÉN A DATOS DE TIPO DATETIME O TIMESTAMP:*/
SELECT 	* 
FROM 	  posts
WHERE   fecha_publicacion > "2025-01-01";
/*PERO SI SE BUSCA ENCONTRAR UN VALOR QUE SE ENCUENTRE ENTRE CIERTO RANGO, SE UTILIZA LA SENTENCIA BETWEEN:*/
SELECT 	* 
FROM 	  posts
WHERE   fecha_publicacion BETWEEN "2024-01-01" AND "2025-12-31";
/*CON LOS TIPOS DE DATO DATETIME Y TIMESTAMP SE PUEDEN UTILIZAR LOS MÉTODOS YEAR(), MONTH() Y DAY() PARA SOLO CONSIDERAR 
SU AÑO, MES O DÍA Y A TRAVÉS DE ESTO REALIZAR UNA BÚSQUEDA:*/
--AÑO: MÉTODO YEAR()
SELECT 	* 
FROM 	  posts
WHERE   YEAR(fecha_publicacion) BETWEEN "2023" AND "2024";
--MES: MÉTODO MONTH()
SELECT 	* 
FROM 	  posts
WHERE   MONTH(fecha_publicacion) = "12";
--DÍA: MÉTODO DAY()
SELECT 	* 
FROM 	  posts
WHERE   DAY(fecha_publicacion) = "22";


/*INSTRUCCIÓN PARA EXTRAER TODAS LAS COLUMNAS DE LA TABLA POSTS, PERO SOLO LAS FILAS DONDE SE CUMPLA LA CONDICIÓN DEL 
COMANDO WHERE, QUE EN ESTE CASO SE REALIZA CON UN STRING, ESTO SE REALIZA CON DATOS DONDE SE HAYA DECLARADO UN CIERTO
VALOR DEFAULT, PARA QUE SEA MÁS SENCILLA SU EJECUCIÓN Y NOS ASEGUREMOS QUE FUNCIONE:*/
SELECT 	* 
FROM 	  posts
WHERE   estatus != "activo";


/*INSTRUCCIÓN PARA EXTRAER TODAS LAS COLUMNAS DE LA TABLA POSTS, PERO SOLO LAS FILAS DONDE SE CUMPLA LA CONDICIÓN DEL 
COMANDO WHERE, QUE EN ESTE CASO SE REALIZA CON UN STRING PERO UTILIZANDO LA SENTENCIA LIKE, ESTO SE UTILIZA CUANDO 
CONOZCO UNA PARTE DEL STRING QUE ESTOY BUSCANDO, PERO NO TODO LO QUE DICE, DENOTANDO UNA CADENA DE STRINGS CUALQUIERA 
ANTES O DESPUÉS DE UNA PALABRA CLAVE CON EL SÍMBOLO DE %:*/
SELECT 	* 
FROM 	  posts
WHERE   titulo LIKE "%escandalo%";
/*ESTA INSTRUCCIÓN PUEDE SER NEGADA CON EL COMANDO NOT PARA QUE AHORA BUSQUE TODAS LAS FILAS DE DATOS DONDE NO SE CUMPLA
DICHA CONDICIÓN, ADEMÁS VALE LA PENA MENCIONAR QUE SI EL SIGNO DE % SE PONE AL FINAL, BUSCARÁ FRASES QUE EMPIECEN CON
LA PALABRA CLAVE Y SI SE COLOCA AL INICIO BUSCARÁ FRASES QUE TERMINEN CON LA PALABRA CLAVE. 
LA INSTRUCCIÓN NOT SE PUEDE UTILIZAR TANTO CON EL COMANDO LIKE COMO CON EL COMANDO BETWEEN AND.*/
SELECT 	* 
FROM 	  posts
WHERE   titulo NOT LIKE "escandalo%";


/*INSTRUCCIÓN PARA EXTRAER TODAS LAS COLUMNAS DE LA TABLA POSTS, SOLO REALIZANDO CONSULTAS EN LOS TIPOS DE DATOS QUE SON 
NULOS (NULL) O SOLO EN LOS QUE NO SON NULOS, ESTO SE REALIZA TAMBIÉN CON EL COMANDO NOT:*/
--QUERY DE DATOS NULOS:
SELECT 	* 
FROM 	  posts
WHERE   usuarios_id IS NULL;
--QUERY DE DATOS NO NULOS:
/*ADEMÁS CABE MENCIONAR QUE SI SE QUIERE AGREGAR MÁS DE UN FILTRO A UNA BÚSQUEDA, LO QUE SE DEBE HACER ES AGREGAR DESPUÉS 
DEL PRIMER FILTRO LA SENTENCIA AND Y CON ESO SE PODRÁN SUMAR FILTROS ADICIONALES.*/
SELECT 	* 
FROM 	  posts
WHERE   categorias_id IS NOT NULL
  AND estatus = "inactivo"
  AND id < 50;

/*La estructura básica de un Query se conforma de los comandos SELECT, FROM y WHERE para indicar la posición y el elemento 
de donde se busca obtener cierta información. La tabla de la cual se buscan extraer los datos se indica con el comando FROM, 
la columna (atributo) se indica con el comando SELECT y la fila se señala con el comando WHERE. Pero si además se busca 
agrupar dichos datos extraídos se debe utilizar la sentencia GROUP BY, que se refiere también a la condición aplicada a las 
filas de alguna columna de la tabla obtenida.
  - COUNT(): MÈTODO QUE DEVUELVE EL NÚMERO DE FILAS QUE CONFORMAN A TODA UNA TABLA.
  - SUM(): MÈTODO QUE SUMA LOS VALORES NUMÉRICOS DE TODAS LAS FILAS QUE CONFORMAN LA COLUMNA DE UNA TABLA.
  - GROUP BY: INSTRUCCIÓN QUE PERMITE REALIZAR UNA AGRUPACIÓN DE DATOS A TRAVÉS DEL VALOR DE LA FILA DE CIERTA COLUMNA.
    •	La sentencia GROUP BY se aplica de forma opcional y sirve para ordenar la información obtenida de la consulta en forma de 
      filas que agruparán los datos de una forma deseada, esto se logra al aplicar la sentencia a alguna de las dos columnas que 
      hayan sido declaradas previamente en el comando SELECT y su resultado se verá reflejado en la clasificación de la información 
      en función del atributo mencionado. 
        o	Normalmente este tipo de instrucción se declara en conjunto con el método COUNT() o SUM() dentro de los dos atributos a 
          los que se les aplica el método SELECT, para que de esta manera se haga un conteo de los datos de la columna a la que no 
          se le está aplicando el método de conteo y de esta forma se agrupen y cuenten los elementos conforman a cada clasificación 
          de dicho atributo de la tabla.
        o	La forma en la que se utiliza el método GROUP BY depende mucho de la información que contenga la base de datos, ya que a 
          través de ella se podrán hacer informes agrupados por cierta clasificación, pero como podemos ver, existen ciertos 
          algoritmos ya preestablecidos que sirven para obtener cada resultado.
A continuación se presentarán dos ejemplos: 
- Uno donde se tiene una clasificación binaria de valores preestablecidos dentro de una columna y a través del método COUNT() se 
  cuenta el número de elementos de la tabla que conforman cada uno.
- Otro donde se crea un alias de alguna de las columnas de la tabla y a través de ese alias se clasifica por año el número de posts
  que se realizaron.
- Un tercero donde se obtiene la misma información del ejercicio pasado pero en función de los meses utilizando el método 
  MONTHNAME().
- El último donde se declaran 3 atributos del query y dos atributos en la sentencia GROUP BY, esto lo que hará es indicar dos 
  agrupaciones en una misma tabla, separándolos por activo e inactivo, pero a su vez indicando su mes y el conteo de cada uno.*/
--CONTEO DE POSTS POR ESTATUS ACTIVO O INACTIVO:
SELECT 	  estatus, COUNT(*) AS numero_posts
FROM 	    posts
GROUP BY  estatus;
--CONTEO DE POSTS POR AÑO:
SELECT 	  YEAR(fecha_publicacion) AS post_year, COUNT(*) AS numero_posts
FROM 	    posts
GROUP BY  post_year;
--CONTEO DE POSTS POR MES:
SELECT 	  MONTHNAME(fecha_publicacion) AS post_month, COUNT(*) AS numero_posts
FROM 	    posts
GROUP BY  post_month;
--CONTEO DE POSTS POR MES Y ESTATUS, INDICANDO EL ESTATUS, MES Y CONTEO DE CADA UNO:
SELECT 	  estatus, MONTHNAME(fecha_publicacion) AS post_month, COUNT(*) AS numero_posts
FROM 	    posts
GROUP BY  estatus, post_month;



/*El comando ORDER BY también es opcional y su función es la de ordenar una agrupación de datos para observar de mejor manera 
el resultado, cuando se busca que este orden se ejecute de forma ascendente (de menos a más) se incluye la sentencia ASC y cuando 
se quiere que se ordenen de forma descendente (de más a menos) se añade la sentencia DESC.*/
--ORDEN DE FECHA EN FORMA ASCEDENTE (MENOS A MÁS: NUMÉRICO DE ARRIBA PARA ABAJO)
SELECT 	  * 
FROM 	    posts
ORDER BY  fecha_publicacion ASC;
--ORDEN DE TEXTO EN FORMA DESCENDENTE (MÁS A MENOS: DE FORMA ALFABÉTICA INVERSA)
SELECT 	  * 
FROM 	    posts
ORDER BY  titulo DESC;
/*El comando ORDER BY se puede acompañar de la instrucción LIMIT la cual después de haber organizado los datos, limita el número 
de filas que se van a mostrar.*/
--ORDEN DE NUMÉRICO EN FORMA ASCENDENTE (MENOS A MÁS: EL VALOR NULL SE CONSIDERA COMO EL MÍNIMO)
SELECT 	  * 
FROM 	    posts
ORDER BY  usuarios_id ASC
  LIMIT     5;


/*HAVING igualmente se usa de forma opcional y lo que hace es filtrar a través de cierta condición lógica las filas de información 
extraídas de una tabla, de la misma forma cómo funciona el método WHERE, pero si hacemos pruebas con este, podremos ver que no 
funciona después de haber agrupado los datos obtenidos con el método GROUP BY, por lo que se debe reemplazar con la sentencia 
HAVING cuando se cumpla esta condición, pero realiza la misma función.*/
--CONTEO DE POSTS POR MES:
SELECT 	  MONTHNAME(fecha_publicacion) AS post_month, estatus, COUNT(*) AS numero_posts
FROM 	    posts
--Aquí es donde se utilizaría el método WHERE, si se usa después de ORDER BY, obtendré una excepción en el código SQL.
GROUP BY  estatus, post_month
HAVING    numero_posts > 1  --El método HAVING siempre se debe colocar después de GROUP BY.
ORDER BY  post_month;