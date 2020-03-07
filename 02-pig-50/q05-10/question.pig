-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute Calcule la cantidad de registros en que 
-- aparece cada letra minúscula en la columna 2.
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--

lines = LOAD 'data.tsv' USING PigStorage('\t') AS (
letra:CHARARRAY,
conjunto_tuplas:BAG{t: TUPLE(p:CHARARRAY)},
parejas:MAP[]);

letra = FOREACH lines GENERATE FLATTEN(conjunto_tuplas);

conteo = GROUP letra BY $0;

conteo1 = FOREACH conteo GENERATE group, COUNT($1);

STORE conteo1 INTO 'output';
fs -get output/ .;