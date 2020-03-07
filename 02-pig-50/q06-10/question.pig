-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` Calcule la cantidad de registros por clave de la 
-- columna 3. En otras palabras, cuántos registros hay que tengan la clave 
-- `aaa`?
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

letras = FOREACH lines GENERATE FLATTEN(parejas);

letras1 = FOREACH letras GENERATE $0;

conteo = GROUP letras1 BY $0;

conteo1 = FOREACH conteo GENERATE group, COUNT($1);

STORE conteo1 INTO 'output' USING PigStorage(',');

fs -get output/ .;

fs -rm data.tsv;