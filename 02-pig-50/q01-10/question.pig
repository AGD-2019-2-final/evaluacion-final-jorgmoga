-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute la cantidad de registros por letra. 
-- Escriba el resultado a la carpeta `output` del directorio actual.
--
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--

fs -put data.tsv;

lines = LOAD 'data.tsv' AS (letra:CHARARRAY, fecha:CHARARRAY, numero:INT);

grupo_letra = GROUP lines BY letra;

conteo = FOREACH grupo_letra GENERATE group, COUNT(lines);
DUMP conteo;

STORE conteo INTO 'output';

fs -get output/ .;

fs -rm data.tsv;