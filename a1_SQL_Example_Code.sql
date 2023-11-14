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
CREATE  DATABASE    "1_platziblog_db";
USE     DATABASE    "1_platziblog_db";

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