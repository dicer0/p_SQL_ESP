<!--El lenguaje Markdown se utiliza para crear documentaciones en GitHub y sirve para conviertir texto simple a una variante 
de código HTML.-->

<!--Encabezados: Se crean usando el símbolo #. El número de # indica el nivel del encabezado.-->
# Levantar Docker
<!--Bloque de código: Se utiliza para mostrar un fragmento de código de una manera que lo diferencie del resto del texto. 
Se delimita por tres comillas invertidas (```) en líneas separadas y de esta forma se añadirá un botón de copiar código en la 
esquina derecha del bloque.-->
<!-- Cuando se usa el comando sh después de las tres comillas invertidas de apertura, se indica que el bloque de código debe 
ser tratado como un script de shell. Esto ayuda a los lectores a identificar el lenguaje. -->
<!--docker compose up -d nombreServicioDocker: Comando de consola que sirve para levantar (permitir que se pueda ejecutar) el 
contenedor perteneciente a un servicio específico de Docker que esté creado dentro del archivo docker-compose.yml-->
```sh
docker compose up -d a1_miBaseDeDatosMongoDB
```

<!--docker compose ps: Comando de consola que enlista los contenedores o procesos que están siendo ejecutados.-->
# Checar Dockers Levantados
```sh
docker compose ps
```