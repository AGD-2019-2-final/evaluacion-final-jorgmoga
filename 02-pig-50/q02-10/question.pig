-- Pregunta
-- ===========================================================================
-- 
-- Ordene el archivo `data.tsv`  por letra y valor (3ra columna).
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
-- 
--  >>> Escriba el codigo del mapper a partir de este punto <<<
-- 


fs -put data.tsv;

lines = LOAD 'data.tsv' AS (letra:CHARARRAY, fecha:CHARARRAY, numero:INT);

ordenar = ORDER lines BY letra ASC, numero ASC;
DUMP ordenar;

STORE ordenar INTO 'output';

fs -get output/ .;

fs -rm data.tsv;