-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` genere una tabla que contenga la primera columna,
-- la cantidad de elementos en la columna 2 y la cantidad de elementos en la 
-- columna 3 separados por coma. La tabla debe estar ordenada por las 
-- columnas 1, 2 y 3.
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
DUMP lines;

conteo = FOREACH lines GENERATE letra, SIZE(conjunto_tuplas) as cantidad_conjuntos, SIZE(parejas) as cantidad_parejas;

conteo1 = ORDER conteo BY letra, cantidad_conjuntos, cantidad_parejas;

STORE conteo1 INTO 'output' USING PigStorage(',');
fs -get output/ .;

fs -rm data.tsv;