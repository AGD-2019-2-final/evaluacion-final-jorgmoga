-- Pregunta
-- ===========================================================================
-- 
-- Obtenga los cinco (5) valores más pequeños de la 3ra columna.
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--

fs -put data.tsv;

lines = LOAD 'data.tsv' AS (letra:CHARARRAY, fecha:CHARARRAY, numero:INT);

numeros = FOREACH lines GENERATE numero;

ordenar = ORDER numeros BY numero ASC;
consulta_5 = LIMIT ordenar 5;
DUMP consulta_5;

STORE consulta_5 INTO 'output';

fs -get output/ .;

fs -rm data.tsv;