-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute la cantidad de registros por letra de la 
-- columna 2 y clave de al columna 3; esto es, por ejemplo, la cantidad de 
-- registros en tienen la letra `b` en la columna 2 y la clave `jjj` en la 
-- columna 3 es:
-- 
--   ((b,jjj), 216)
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--

fs -put data.tsv;

lines = LOAD 'data.tsv' USING PigStorage('\t') AS (
letra:CHARARRAY,
conjunto_tuplas:BAG{t: TUPLE(p:CHARARRAY)},
parejas:MAP[]);

tabla = FOREACH lines GENERATE FLATTEN(conjunto_tuplas), FLATTEN(parejas);

tabla1 = FOREACH tabla GENERATE $0 as letra, $1 as letras;

conteo = GROUP tabla1 BY (letra, letras);

conteo1 = FOREACH conteo GENERATE group, COUNT($1);

STORE conteo1 INTO 'output';

fs -get output/ .;

fs -rm data.tsv;
