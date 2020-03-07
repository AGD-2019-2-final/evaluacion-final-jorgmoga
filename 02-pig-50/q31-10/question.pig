-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Cuente la cantidad de personas nacidas por año.
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--

fs -put data.csv;

u = LOAD 'data.csv' USING PigStorage(',') 
    AS (id:int, 
        firstname:CHARARRAY, 
        surname:CHARARRAY, 
        birthday:CHARARRAY, 
        color:CHARARRAY, 
        quantity:INT);
--
-- >>> Escriba su respuesta a partir de este punto <<<
--

tabla_fecha = FOREACH u GENERATE ToString(ToDate(birthday, 'YYYY-mm-DD'),'YYYY') as yyyy;

grupo_yyyy = GROUP tabla_fecha BY yyyy;

conteo = FOREACH grupo_yyyy GENERATE group, COUNT(tabla_fecha);

STORE conteo INTO 'output' USING PigStorage(',');

fs -get output/ .;

fs -rm data.csv;
