--CONSULTAS AVANZADAS SQL:
/*1.	Realiza una consulta SQL que obtenga siempre el primer registro o fila de cualquier tabla, sin utilizar para ello su 
columna id. Para ello todos los siguientes códigos son equivalentes y en pgAdmin se ejecutan al seleccionar la opción de: 
Tools → Query Tool.*/
/*- FETCH: Este comando se puede usar de diversas maneras para controlar y limitar el número de filas devueltas por una 
    consulta. Las variaciones de FETCH se centran principalmente en las palabras clave que lo acompañan, como FIRST, NEXT, 
    PERCENT, ROWS ONLY y WITH TIES.
      - FETCH FIRST n ROWS ONLY: Recupera las primeras n filas.
      - FETCH NEXT  n ROWS ONLY: Recupera las siguientes n filas, aunque es equivalente a FETCH FIRST si no se usa junto 
        al comando OFFSET.
          - OFFSET x ROWS FETCH NEXT n ROWS ONLY: Recupera n filas después de saltar x registros inicialmente.
      - FETCH FIRST numero_porcentaje PERCENT ROWS ONLY: Recupera el primer porcentaje especificado de filas pertenecientes 
        a las totales de una tabla.
      - FETCH FIRST n ROWS WITH TIES: Recupera n filas de la tabla, pero si existen registros adicionales que tengan su mismo 
        valor, también se incluyen de forma automática, no estando limtado entonces a traer n filas forzosamente.*/
SELECT 	*
FROM	  ejercicios.alumnos
FETCH FIRST 1 ROWS ONLY;
/*- LIMIT: Este comando sirve para limitar el número de filas que se van a obtener a través de una consulta. Aunque se suele 
    utilizar después del comando ORDER BY, se puede usar cuando sea.*/
SELECT 	*
FROM	  ejercicios.alumnos
LIMIT   1;
/*Consultas Anidadas: Se denotan por encontrarse entre paréntesis después de un comando SQL y casi siempre forzosamente se les 
debe asignar un alias a través del comando AS, pero hay que tener en cuenta que lo que retorne esta operación interna, será 
utilizado por el comando exterior, por lo que las Nested Queries no están limitadas a un uso, sino a una infinidad, dependiendo 
del comando exterior al que se aplique y la acción interna que sea descrita entre sus paréntesis.
En este caso como se aplica al método FROM, solo se ejecutará una vez y sirve para crear una nueva tabla con un id agregado.
  - SELECT: Comando que indica las columnas de datos que se quiere extraer y mostrar, si se quiere mostrar todas, se utiliza 
    un asterisco *.
  - FROM: Comando que indica la tabla de donde se tomarán los datos.
  - ROW_NUMBER(): Comando de tipo Window Function que asigna un número único y secuencial a cada fila dentro de una consulta, 
    comenzando desde 1 y siempre estando acompañado de la función OVER().
      - OVER(): Comando que define las columnas de la tabla sobre las que opera el comando ROW_NUMBER(). Si la función no 
        recibe ningún parámetro, la Window Function se aplica sobre todas las filas sin particionar (clasificar) ni ordenar 
        los datos.
  - AS: Es una instrucción opcional que se puede utilizar en conjunto con el comando SELECT, FROM o JOIN, la cual sirve para 
    cambiar el nombre de la columna de datos extraída y asignarle un alias o nombre de variable, cambiando solo la forma en 
    la que se representan los datos extraídos, no su nombre en la base de datos.
    En este caso se utiliza para indicar el nombre de la nueva columna de conteo creada por el comando ROW_NUMBER() y luego 
    se añade un asterisco * para extraer todos los demás datos de la tabla sin cambiar sus nombres de columna.
  - WHERE: Comando para indicar cuáles filas de la tabla queremos extraer, filtrando así la consulta a través de cierta 
    condición matemática (=, >, <, etc.) aplicada a alguna columna de la tabla.
ROW_NUMBER(), RANK(), DENSE_RANK(), etc. son comandos de tipo Window Function (Función de Ventana) que nos permiten ordenar 
la forma en la que se muestran los datos o realizar cálculos de posición, promedio, suma, etc. sobre un grupo de filas 
relacionadas, agregando información extra a cada fila de la tabla para poder realizarlos.*/
SELECT 	*
FROM	(
	SELECT ROW_NUMBER() OVER() AS row_id, *
	FROM	ejercicios.alumnos
) AS query_alumnos_anidado
WHERE row_id = 1;





/*2.	Realiza una consulta SQL que obtenga el registro o fila del atributo colegiatura perteneciente a la tabla alumnos que 
tenga el segundo valor más alto. Para ello todos los siguientes códigos son equivalentes. Para ello todos los siguientes 
códigos son equivalentes y en pgAdmin se ejecutan al seleccionar la opción de: Tools → Query Tool.*/
/*Consultas Anidadas: Se denotan por encontrarse entre paréntesis después de un comando SQL y casi siempre forzosamente se les 
debe asignar un alias a través del comando AS, pero hay que tener en cuenta que lo que retorne esta operación interna, será 
utilizado por el comando exterior, por lo que las Nested Queries no están limitadas a un uso, sino a una infinidad, dependiendo 
del comando exterior al que se aplique y la acción interna que sea descrita entre sus paréntesis.
En este caso como se aplica al método WHERE, se ejecutará 1 vez para cada fila de la tabla indicada en el comando FROM.
  - SELECT: Comando que indica las columnas de datos que se quiere extraer y mostrar.
  - DISTINCT: Este comando se usa para eliminar las filas duplicadas en los resultados obtenidos de una consulta, mostrando 
    solo los registros únicos.
  - FROM: Comando que indica la tabla de donde se tomarán los datos.
  - AS: Es una instrucción opcional que se puede utilizar en conjunto con el comando SELECT, FROM o JOIN, la cual sirve para 
    cambiar el nombre de la columna de datos extraída y asignarle un alias o nombre de variable, cambiando solo la forma en 
    la que se representan los datos extraídos, no su nombre en la base de datos.
  - COUNT(): Método que cuando se utiliza, siempre se debe poner después del método SELECT; este recibe como parámetro un 
    atributo de los datos pertenecientes a la tabla y retorna el número de filas de datos que pertenecen a dicha columna.
  - WHERE: Comando para indicar cuáles filas de la tabla queremos extraer, filtrando así la consulta a través de cierta 
    condición matemática (=, >, <, etc.) aplicada a alguna columna de la tabla.
En esta ocasión, en la subconsulta tanto a1 como a2 representan las filas de la tabla ejercicios.alumnos, pero en el nested 
query, el método COUNT() se utiliza para contar cuántos valores de colegiatura en a2 son mayores o iguales al valor de 
colegiatura de la fila actual a1. Esto se hace para cada fila en a1, lo que nos permite realizar comparaciones entre cada 
fila de la tabla original y todas las demás filas, por lo que si 2 valores de a2 son mayores o iguales a a1, esto significa 
que esa es la 2da colegiatura mayor.*/
SELECT 	DISTINCT colegiatura
FROM 	  ejercicios.alumnos AS a1
WHERE (
	SELECT 	COUNT(DISTINCT colegiatura)
	FROM 	  ejercicios.alumnos AS a2
	WHERE 	a1.colegiatura <= a2.colegiatura
) = 2;
/*- ORDER BY: Comando opcional cuya función es la de ordenar una agrupación de datos para observar de mejor manera su 
    resultado, cuando se busca que este orden se ejecute de forma ascendente (de menos a más viéndolos de arriba hacia abajo 
    en función del valor de cierto atributo) se incluye la sentencia ASC y cuando se quiere que se ordenen de forma 
    descendente (de más a menos) se añade la sentencia DESC.
  - LIMIT: Este comando sirve para limitar el número de filas que se van a obtener a través de una consulta. Aunque se suele 
    utilizar después del comando ORDER BY, se puede usar cuando sea.
  -	OFFSET: Este comando se utiliza en conjunto con la instrucción LIMIT, ya que indica cuántos datos nos tenemos que saltar 
    o ignorar de arriba hacia abajo, para que desde ahí se empiece a recabar la información del Query.*/
SELECT 	DISTINCT colegiatura
FROM 	  ejercicios.alumnos
ORDER BY colegiatura DESC
LIMIT 1 OFFSET 1;
/*Consultas Anidadas: Se denotan por encontrarse entre paréntesis después de un comando SQL y casi siempre forzosamente se les 
debe asignar un alias a través del comando AS, pero hay que tener en cuenta que lo que retorne esta operación interna, será 
utilizado por el comando exterior, por lo que las Nested Queries no están limitadas a un uso, sino a una infinidad, dependiendo 
del comando exterior al que se aplique y la acción interna que sea descrita entre sus paréntesis.
En este caso como se aplica al método INNER JOIN, se ejecutará 1 vez para cada fila de la tabla indicada en el comando FROM.
  - SELECT: Comando que indica las columnas de datos que se quiere extraer y mostrar.
  - DISTINCT: Este comando se usa para eliminar las filas duplicadas en los resultados obtenidos de una consulta, mostrando 
    solo los registros únicos.
  - FROM: Comando que indica la tabla de donde se tomarán los datos.
  - ORDER BY: Comando opcional cuya función es la de ordenar una agrupación de datos para observar de mejor manera su 
    resultado, cuando se busca que este orden se ejecute de forma ascendente (de menos a más viéndolos de arriba hacia abajo 
    en función del valor de cierto atributo) se incluye la sentencia ASC y cuando se quiere que se ordenen de forma 
    descendente (de más a menos) se añade la sentencia DESC.
  - LIMIT: Este comando sirve para limitar el número de filas que se van a obtener a través de una consulta. Aunque se suele 
    utilizar después del comando ORDER BY, se puede usar cuando sea.
  -	OFFSET: Este comando se utiliza en conjunto con la instrucción LIMIT, ya que indica cuántos datos nos tenemos que saltar 
    o ignorar de arriba hacia abajo, para que desde ahí se empiece a recabar la información del Query.
  - AS: Es una instrucción opcional que se puede utilizar en conjunto con el comando SELECT, FROM o JOIN, la cual sirve para 
    cambiar el nombre de la columna de datos extraída y asignarle un alias o nombre de variable, cambiando solo la forma en 
    la que se representan los datos extraídos, no su nombre en la base de datos.
  - ON: Este comando se utiliza en una instrucción JOIN para especificar la condición de unión entre las tablas que se están 
    combinando, describiendo así cómo las filas de una tabla se relacionan con las filas de otra tabla en función de los 
    valores de una o más columnas comunes.
En esta ocasión, en la subconsulta se ejecuta el mismo código pasado, donde se obtiene el segundo valor más alto de la 
colegiatura de la tabla alumnos, pero como se aplica al comando INNER JOIN, se utiliza ese valor para encontrar todos los 
datos de los alumnos que tengan esa colegiatura, obteniendo así más información en vez de obtener solamente el valor de la 
segunda colegiatura más alta.*/
SELECT 	*
FROM	  ejercicios.alumnos AS datos_alumnos
INNER JOIN (
	SELECT 	DISTINCT colegiatura
	FROM		ejercicios.alumnos
	ORDER BY	colegiatura DESC
	LIMIT 1 OFFSET 1
) AS segunda_mayor_colegiatura
ON datos_alumnos.colegiatura = segunda_mayor_colegiatura.colegiatura;
/*Consultas Anidadas: Se denotan por encontrarse entre paréntesis después de un comando SQL y casi siempre forzosamente se les 
debe asignar un alias a través del comando AS, pero hay que tener en cuenta que lo que retorne esta operación interna, será 
utilizado por el comando exterior, por lo que las Nested Queries no están limitadas a un uso, sino a una infinidad, dependiendo 
del comando exterior al que se aplique y la acción interna que sea descrita entre sus paréntesis.
En este caso como se aplica al método WHERE, se ejecutará 1 vez para cada fila de la tabla indicada en el comando FROM.
  - SELECT: Comando que indica las columnas de datos que se quiere extraer y mostrar.
  - DISTINCT: Este comando se usa para eliminar las filas duplicadas en los resultados obtenidos de una consulta, mostrando 
    solo los registros únicos.
  - FROM: Comando que indica la tabla de donde se tomarán los datos.
  - ORDER BY: Comando opcional cuya función es la de ordenar una agrupación de datos para observar de mejor manera su 
    resultado, cuando se busca que este orden se ejecute de forma ascendente (de menos a más viéndolos de arriba hacia abajo 
    en función del valor de cierto atributo) se incluye la sentencia ASC y cuando se quiere que se ordenen de forma 
    descendente (de más a menos) se añade la sentencia DESC.
  - LIMIT: Este comando sirve para limitar el número de filas que se van a obtener a través de una consulta. Aunque se suele 
    utilizar después del comando ORDER BY, se puede usar cuando sea.
  -	OFFSET: Este comando se utiliza en conjunto con la instrucción LIMIT, ya que indica cuántos datos nos tenemos que saltar 
    o ignorar de arriba hacia abajo, para que desde ahí se empiece a recabar la información del Query.
En esta ocasión, en la subconsulta se obtiene el valor de la segunda colegiatura más grande de la tabla alumnos, pero como 
esta se aplica al comando WHERE, después se analiza el valor de la columna colegiatura perteneciente a cada fila y si este es 
igual al valor obtenido por el query anidado, se filtra de esa manera, obteniendo así más información en vez de obtener 
solamente el valor de la segunda colegiatura más alta.*/
SELECT 	*
FROM	  ejercicios.alumnos AS datos_alumnos
WHERE   colegiatura = (
	SELECT 	DISTINCT colegiatura
	FROM		  ejercicios.alumnos
	ORDER BY	colegiatura DESC
	LIMIT 1 OFFSET 1
);





/*3.	Realiza una consulta SQL que retorne solo la última mitad de las filas pertenecientes a la tabla alumnos. Para ello en 
pgAdmin se selecciona la opción de: Tools → Query Tool.*/
/*Consultas Anidadas: Se denotan por encontrarse entre paréntesis después de un comando SQL y casi siempre forzosamente se les 
debe asignar un alias a través del comando AS, pero hay que tener en cuenta que lo que retorne esta operación interna, será 
utilizado por el comando exterior, por lo que las Nested Queries no están limitadas a un uso, sino a una infinidad, dependiendo 
del comando exterior al que se aplique y la acción interna que sea descrita entre sus paréntesis.
En este caso como se aplica al método OFFSET, se ejecutará 1 vez e indicará cuántas filas se debe saltar la consulta para 
obtener solo la segunda mitad de las filas pertenecientes a la tabla alumnos.
  - SELECT: Comando que indica las columnas de datos que se quiere extraer y mostrar.
  - ROW_NUMBER(): Comando de tipo Window Function que asigna un número único y secuencial a cada fila dentro de una consulta, 
    comenzando desde 1 y siempre estando acompañado de la función OVER().
      - OVER(): Comando que define las columnas de la tabla sobre las que opera el comando ROW_NUMBER(). Si la función no 
        recibe ningún parámetro, la Window Function se aplica sobre todas las filas sin particionar (clasificar) ni ordenar 
        los datos.
  - AS: Es una instrucción opcional que se puede utilizar en conjunto con el comando SELECT, FROM o JOIN, la cual sirve para 
    cambiar el nombre de la columna de datos extraída y asignarle un alias o nombre de variable, cambiando solo la forma en 
    la que se representan los datos extraídos, no su nombre en la base de datos.
    En este caso se utiliza para indicar el nombre de la nueva columna de conteo creada por el comando ROW_NUMBER() y luego 
    se añade un asterisco * para extraer todos los demás datos de la tabla sin cambiar sus nombres de columna.
  - FROM: Comando que indica la tabla de donde se tomarán los datos.
  -	OFFSET: Este comando se suele utilizar en conjunto con la instrucción LIMIT, ya que indica cuántos datos nos tenemos que 
    saltar o ignorar de arriba hacia abajo, para que desde ahí se empiece a recabar la información del Query.
  - COUNT(): Método que cuando se utiliza, siempre se debe poner después del método SELECT; este recibe como parámetro un 
    atributo de los datos pertenecientes a la tabla y retorna el número de filas de datos que pertenecen a dicha columna.
ROW_NUMBER(), RANK(), DENSE_RANK(), etc. son comandos de tipo Window Function (Función de Ventana) que nos permiten ordenar 
la forma en la que se muestran los datos o realizar cálculos de posición, promedio, suma, etc. sobre un grupo de filas 
relacionadas, agregando información extra a cada fila de la tabla para poder realizarlos.*/
SELECT ROW_NUMBER() OVER() AS row_id, *
FROM    ejercicios.alumnos
OFFSET (
  SELECT  COUNT(*)/2
  FROM    ejercicios.alumnos
);





/*4.	Realiza una consulta SQL que filtre las filas de información de la tabla alumnos obtenidas a través de varios valores 
estáticos incluidos en un array. Para ello en pgAdmin se selecciona la opción de: Tools → Query Tool.*/
/*Consultas Anidadas: Se denotan por encontrarse entre paréntesis después de un comando SQL y casi siempre forzosamente se les 
debe asignar un alias a través del comando AS, pero hay que tener en cuenta que lo que retorne esta operación interna, será 
utilizado por el comando exterior, por lo que las Nested Queries no están limitadas a un uso, sino a una infinidad, dependiendo 
del comando exterior al que se aplique y la acción interna que sea descrita entre sus paréntesis.
En este caso como se aplica al método FROM, solo se ejecutará una vez y sirve para crear una nueva tabla con un id agregado.
  - SELECT: Comando que indica las columnas de datos que se quiere extraer y mostrar.
  - FROM: Comando que indica la tabla de donde se tomarán los datos.
  - ROW_NUMBER(): Comando de tipo Window Function que asigna un número único y secuencial a cada fila dentro de una consulta, 
    comenzando desde 1 y siempre estando acompañado de la función OVER().
      - OVER(): Comando que define las columnas de la tabla sobre las que opera el comando ROW_NUMBER(). Si la función no 
        recibe ningún parámetro, la Window Function se aplica sobre todas las filas sin particionar (clasificar) ni ordenar 
        los datos.
  - AS: Es una instrucción opcional que se puede utilizar en conjunto con el comando SELECT, FROM o JOIN, la cual sirve para 
    cambiar el nombre de la columna de datos extraída y asignarle un alias o nombre de variable, cambiando solo la forma en 
    la que se representan los datos extraídos, no su nombre en la base de datos.
    En este caso se utiliza para indicar el nombre de la nueva columna de conteo creada por el comando ROW_NUMBER() y luego 
    se añade un asterisco * para extraer todos los demás datos de la tabla sin cambiar sus nombres de columna.
  - WHERE: Comando para indicar cuáles filas de la tabla queremos extraer, filtrando así la consulta a través de cierta 
    condición matemática (=, >, <, etc.) aplicada a alguna columna de la tabla.
      - IN: Si se quiere agregar un filtro en forma de Array estático, se utiliza la instrucción IN seguida de sus valores 
        entre paréntesis (valorArray_1, …, valorArray_n) y con eso se podrán indicar varios valores de filtro específicos.
        Si se quiere obtener sus valores opuestos, se usa la instrucción NOT IN.
          WHERE	Nombre_Atributo_o_Columna IN (arrayValor_1, ..., arrayValor_n)
ROW_NUMBER(), RANK(), DENSE_RANK(), etc. son comandos de tipo Window Function (Función de Ventana) que nos permiten ordenar 
la forma en la que se muestran los datos o realizar cálculos de posición, promedio, suma, etc. sobre un grupo de filas 
relacionadas, agregando información extra a cada fila de la tabla para poder realizarlos.*/
SELECT  *
FROM (
  SELECT  ROW_NUMBER() OVER() AS row_id, *
  FROM    ejercicios.alumnos
) AS query_anidado_alumnos
WHERE row_id IN (1, 5, 10, 12, 15);
/*De igual forma, los valores del Array se pueden obtener a través de una subconsulta, realizando la misma operación:*/
SELECT  *
FROM    ejercicios.alumnos
WHERE   id IN (
  SELECT  id, tutor_id
  FROM    ejercicios.alumnos
  WHERE   tutor_id = 30
);





/*5.	Realiza una consulta SQL que utilice los comandos EXTRACT y DATE_PART() para extraer partes de una columna perteneciente 
a la tabla alumnos que contenga datos tipo fecha (date), hora (timestamp) o intervalo (interval). Para ello en pgAdmin se 
selecciona la opción de: Tools → Query Tool.
  - SELECT: Comando que indica las columnas de datos que se quiere extraer y mostrar.
  - EXTRACT: Este comando se utiliza para extraer ciertas partes de una columna tipo fecha, hora (timestamp) o intervalo; como 
    su año, mes, día, hora, minuto, segundo, etc. a través de la siguiente sintaxis, donde: 
      - field: Es el componente específico que se quiere extraer, que puede adoptar los valores: YEAR, MONTH, DAY, HOUR, 
        MINUTE, SECOND, QUARTER, DOW (Day Of Week o día de la semana), DOY (Day Of Year o día del año), etc.
      - source: Indica la columna de tipo date, timestamp o interval del que se quiere extraer un componente.
          EXTRACT(field     FROM    source)
  - DATE_PART(): Este comando se utiliza para extraer ciertas partes de una columna tipo fecha, hora (timestamp) o intervalo; 
    como su año, mes, día, hora, minuto, segundo, etc. a través de la siguiente sintaxis que es muy parecida a la de EXTRACT: 
      - field: Es un string que especifica el componente de la fecha u hora que se desea extraer, el cual puede adoptar los 
        valores de: year, month, day, hour, minute, second, quarter, dow (día de la semana), doy (día del año), etc.
      - source: Indica la columna de tipo date, timestamp o interval del que se quiere extraer un componente.
          DATE_PART(field,          source)
  - AS: Es una instrucción opcional que se puede utilizar en conjunto con el comando SELECT, FROM o JOIN, la cual sirve para 
    cambiar el nombre de la columna de datos extraída y asignarle un alias o nombre de variable, cambiando solo la forma en 
    la que se representan los datos extraídos, no su nombre en la base de datos.
  - FROM: Comando que indica la tabla de donde se tomarán los datos.
  - WHERE: Comando para indicar cuáles filas de la tabla queremos extraer, filtrando así la consulta a través de cierta 
    condición matemática (=, >, <, etc.) aplicada a alguna columna de la tabla.
Se pueden extraer varios componentes de las columnas con datos tipo fecha (date), hora (timestamp) o intervalo (interval) si 
se utilizan varias veces los comandos EXTRACT y DATE_PART() y se separan por comas.*/
--Obtención de componentes de fecha u hora con el comando EXTRACT(field     FROM    source):
SELECT  EXTRACT (YEAR FROM fecha_incorporacion) AS anio_incorporacion,
		    EXTRACT (HOUR FROM fecha_incorporacion) AS hora_incorporacion,
		    EXTRACT (MINUTE FROM fecha_incorporacion) AS minuto_incorporacion
FROM	  ejercicios.alumnos;
--Obtención de componentes de fecha u hora con el comando DATE_PART(field,  source):
SELECT  DATE_PART ('year', fecha_incorporacion) AS anio_incorporacion,
		    DATE_PART ('month', fecha_incorporacion) AS mes_incorporacion,
		    DATE_PART ('day', fecha_incorporacion) AS dia_incorporacion
FROM	  ejercicios.alumnos;
/*Filtrado de filas por medio de una subconsulta que utiliza los comandos EXTRACT o DATE_PART():
Consultas Anidadas: Se denotan por encontrarse entre paréntesis después de un comando SQL y casi siempre forzosamente se les 
debe asignar un alias a través del comando AS, pero hay que tener en cuenta que lo que retorne esta operación interna, será 
utilizado por el comando exterior, por lo que las Nested Queries no están limitadas a un uso, sino a una infinidad, dependiendo 
del comando exterior al que se aplique y la acción interna que sea descrita entre sus paréntesis.
En este caso como se aplica al método WHERE, se ejecutará 1 vez para cada fila de la tabla indicada en el comando FROM.*/
--Filtrado de filas a través de componentes de fecha u hora con el comando EXTRACT(field     FROM    source):
SELECT  *
FROM	  ejercicios.alumnos
WHERE   (
  EXTRACT (YEAR FROM fecha_incorporacion)
) = 2019;
--Filtrado doble de filas a través de componentes de fecha u hora con el comando DATE_PART(field,  source):
SELECT  *
FROM	  ejercicios.alumnos
WHERE (
  DATE_PART ('year', fecha_incorporacion)
) = 2019
AND (
	DATE_PART ('month', fecha_incorporacion)
) = 05;
--Filtrado de filas a través de componentes de fecha u hora subconsultas:
SELECT  *
FROM (
  SELECT  *, 
          DATE_PART ('year', fecha_incorporacion) AS anio_incorporacion,
          DATE_PART ('month', fecha_incorporacion) AS mes_incorporacion
  FROM	  ejercicios.alumnos
) AS  query_alumnos_conAnio_anidado
WHERE anio_incorporacion = 2019;





/*6.	Realiza una consulta SQL que encuentre las filas duplicadas (que se repitan) en la tabla alumnos que tenga el segundo 
valor más alto. Para ello primero tendremos que insertar un nuevo dato para forzar que exista un registro duplicado. Los 
siguientes códigos son equivalentes y luego en pgAdmin se ejecutará la consulta del ejercicio al seleccionar la opción de: 
Tools → Query Tool.*/
INSERT INTO ejercicios.alumnos (id, nombre, apellido, email, colegiatura, fecha_incorporacion, carrera_id, tutor_id) 
VALUES (1001, 'Pamelina', null, 'pmylchreestrr@salon.com', 4800, '2020-04-26 10:18:51', 12, 16);
/*Cast: Se refiere a la transformación de un tipo de dato en otro distinto.
En este caso como se aplica al método WHERE, se ejecutará 1 vez para cada fila de la tabla indicada en el comando FROM.
  - SELECT: Comando que indica las columnas de datos que se quiere extraer y mostrar.
  - Cast(::): Un Cast se refiere a la transformación de un tipo de dato en otro distinto y su sintaxis es alguna de las 
    siguientes: 
        tabla.columna::nuevo_tipo_de_dato
        (tabla.columna_1,…, tabla.columna_n)::nuevo_tipo_de_dato
  - COUNT(): Método que cuando se utiliza, siempre se debe poner después del método SELECT; este recibe como parámetro un 
    atributo de los datos pertenecientes a la tabla y retorna el número de filas de datos que pertenecen a dicha columna.
  - FROM: Comando que indica la tabla de donde se tomarán los datos.
  - GROUP BY: Esta sentencia agrupa las filas resultantes de una consulta según uno o más atributos especificados. Se utiliza 
    junto los métodos COUNT(), SUM(), AVG(), MIN(), MAX(), etc. para calcular ciertos valores numéricos asociados a cada 
    agrupación, mostrando así en la tabla del resultado, mínimo dos columnas, en la primera se indica el valor de la columna o 
    columnas indicadas en el comando GROUP BY y en la segunda se coloca el resultado del cálculo realizado para cada valor de 
    la primera columna.
  - WHERE: Comando para indicar cuáles filas de la tabla queremos extraer, filtrando así la consulta a través de cierta 
    condición matemática (=, >, <, etc.) aplicada a alguna columna de la tabla.
      - HAVING: Cuando se utilice el comando GROUP BY, no se podrá usar la instrucción WHERE, se tendrá que reemplazar por el 
        comando HAVING, que realiza la misma acción con la misma sintaxis.
Si se quiere encontrar duplicados en las filas de una tabla, se debe evitar incluir en los campos de análisis la columna id, 
ya que esta siempre será diferente, por lo que conviene transformar a través de un Cast todos los valores de las columnas en 
un string para poderlo comparar, para ello se deben añadir las columnas una por una al comando SELECT, sin incluir el atributo 
id.*/
--Encontrar duplicados con Cast:
SELECT (ejercicios.alumnos.nombre,
        ejercicios.alumnos.apellido,
        ejercicios.alumnos.email,
        ejercicios.alumnos.colegiatura,
        ejercicios.alumnos.fecha_incorporacion,
        ejercicios.alumnos.carrera_id,
        ejercicios.alumnos.tutor_id)::text, COUNT(*) AS num_filas
FROM	  ejercicios.alumnos
GROUP BY  (ejercicios.alumnos.nombre,
           ejercicios.alumnos.apellido,
           ejercicios.alumnos.email,
           ejercicios.alumnos.colegiatura,
           ejercicios.alumnos.fecha_incorporacion,
           ejercicios.alumnos.carrera_id,
           ejercicios.alumnos.tutor_id)
HAVING num_filas > 1;
--Encontrar duplicados con subconsultas y Window Functions:
/*Consultas Anidadas: Se denotan por encontrarse entre paréntesis después de un comando SQL y casi siempre forzosamente se les 
debe asignar un alias a través del comando AS, pero hay que tener en cuenta que lo que retorne esta operación interna, será 
utilizado por el comando exterior, por lo que las Nested Queries no están limitadas a un uso, sino a una infinidad, dependiendo 
del comando exterior al que se aplique y la acción interna que sea descrita entre sus paréntesis.
En este caso como se aplica al método FROM, solo se ejecutará una vez y sirve para crear una nueva tabla con un id agregado, que 
a su vez particione los datos para excluir la columna id y así poder encontrar los duplicados.
  - SELECT: Comando que indica las columnas de datos que se quiere extraer y mostrar, si se quiere mostrar todas, se utiliza 
    un asterisco *.
  - FROM: Comando que indica la tabla de donde se tomarán los datos.
  - ROW_NUMBER(): Comando de tipo Window Function que asigna un número único y secuencial a cada partición de filas dentro de 
    una consulta, comenzando desde 1 y siempre estando acompañado de la función OVER().
      - OVER(): Comando que define las columnas de la tabla sobre las que opera el comando ROW_NUMBER(). Si la función no 
        recibe ningún parámetro, la Window Function se aplica sobre todas las filas sin particionar (clasificar) ni ordenar 
        los datos.
          - PARTITION BY: Comando para agrupar las filas resultantes de una consulta según uno o más atributos especificados 
            de forma muy similar a como funciona el comando GROUP BY. Las particiones se usan para calcular ciertos valores 
            numéricos asociados a cada agrupación como ROW_NUMBER(), RANK(), SUM(), AVG(), mostrando así en la tabla del 
            resultado, mínimo dos columnas, en la primera se indica el valor de la columna o columnas indicadas, osea las 
            particiones y en la segunda se coloca el resultado del cálculo realizado para cada valor de la primera columna.
          - ORDER BY: Comando opcional cuya función es la de ordenar una agrupación de datos para observar de mejor manera su 
            resultado, cuando se busca que este orden se ejecute de forma ascendente (de menos a más viéndolos de arriba hacia 
            abajo en función del valor de cierto atributo) se incluye la sentencia ASC y cuando se quiere que se ordenen de 
            forma descendente (de más a menos) se añade la sentencia DESC.
  - AS: Es una instrucción opcional que se puede utilizar en conjunto con el comando SELECT, FROM o JOIN, la cual sirve para 
    cambiar el nombre de la columna de datos extraída y asignarle un alias o nombre de variable, cambiando solo la forma en 
    la que se representan los datos extraídos, no su nombre en la base de datos.
    En este caso se utiliza para indicar el nombre de la nueva columna de conteo creada por el comando ROW_NUMBER() y luego 
    se añade un asterisco * para extraer todos los demás datos de la tabla sin cambiar sus nombres de columna.
  - WHERE: Comando para indicar cuáles filas de la tabla queremos extraer, filtrando así la consulta a través de cierta 
    condición matemática (=, >, <, etc.) aplicada a alguna columna de la tabla.
ROW_NUMBER(), RANK(), DENSE_RANK(), etc. son comandos de tipo Window Function (Función de Ventana) que nos permiten ordenar 
la forma en la que se muestran los datos o realizar cálculos de posición, promedio, suma, etc. sobre un grupo de filas 
relacionadas, agregando información extra a cada fila de la tabla para poder realizarlos.*/
SELECT  *
FROM (
  SELECT ROW_NUMBER() OVER(
    PARTITION BY  nombre,
                  apellido,
                  email,
                  colegiatura,
                  fecha_incorporacion,
                  carrera_id,
                  tutor_id
    ORDER BY id ASC
  ) AS filas_duplicadas, *
  --Todo este comando es equivalente a este otro pero con particiones: SELECT ROW_NUMBER() OVER() AS row_id, *
  FROM	  ejercicios.alumnos
) AS query_anidado_duplicados
WHERE query_anidado_duplicados.filas_duplicadas > 1;
/*Encontrar y borrar filas duplicadas con subconsultas, Window Functions y Where Arrays:
  - DELETE: Comando para borrar el valor de una columna en específico perteneciente a una tabla, para ello se utiliza la 
    siguiente sintaxis:
        DELETE	FROM	“Nombre_Entidad_o_Tabla”
        WHERE	“Nombre_Atributo_o_Columna” = "Valor_Fila_o_Identificador”;
  - WHERE: Comando para indicar cuáles filas de la tabla queremos extraer, filtrando así la consulta a través de cierta 
      condición matemática (=, >, <, etc.) aplicada a alguna columna de la tabla.
        - IN: Si se quiere agregar un filtro en forma de Array estático, se utiliza la instrucción IN seguida de sus valores 
          entre paréntesis (valorArray_1, …, valorArray_n) y con eso se podrán indicar varios valores de filtro específicos.
          Si se quiere obtener sus valores opuestos, se usa la instrucción NOT IN.
            WHERE	Nombre_Atributo_o_Columna IN (arrayValor_1, ..., arrayValor_n)*/
DELETE FROM ejercicios.alumnos
WHERE id IN (
  SELECT  id
  FROM (
    SELECT ROW_NUMBER() OVER(
      PARTITION BY  nombre,
                    apellido,
                    email,
                    colegiatura,
                    fecha_incorporacion,
                    carrera_id,
                    tutor_id
      ORDER BY id ASC
    ) AS filas_duplicadas, *
    --Todo este comando es equivalente a este otro pero con particiones: SELECT ROW_NUMBER() OVER() AS row_id, *
    FROM	  ejercicios.alumnos
  ) AS query_anidado_duplicados
  WHERE query_anidado_duplicados.filas_duplicadas > 1
);