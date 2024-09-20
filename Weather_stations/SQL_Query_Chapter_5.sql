select * from STATION_DATA;
--BETWEEN É UM COMANDO INCLUSIVO, OU SEJA, NO COMANDO A BAIXO 2005 E 2010 ESTÃO INCLUSOS
select * from STATION_DATA WHERE year between 2005 and 2010;
-- De forma mais verbosa, podemos utilizar o AND com os símbolos de maior igual e menor igual
select * from STATION_DATA WHERE year>=2005 AND year<=2010;
--Excluindo anos de 2005 e 2010
select * from STATION_DATA WHERE year>2005 AND year<2010;
--INSTRUÇÃO OR:
select * from STATION_DATA WHERE MONTH=3 OR MONTH=5;
-- DE FORMA MENOS VERBOSA QUE A INSTRUÇÃO ANTERIOR, PODEMOS UTILIZAR:
select * from STATION_DATA WHERE month IN (3, 5, 6, 9);
--negação
select * from STATION_DATA WHERE month NOT IN (3, 5, 6, 9);
--USANDO MÓDULO para identificar apenas meses divisíveis por 3 (por trimestres)
select * from STATION_DATA WHERE month % 3 = 0;
--Operações com texto:
select * from station_data WHERE report_code='513A63';
--FORMA MENOS VERBOSA:
select * from station_data WHERE report_code IN ('513A63', '1F8A7B');
-- Função lenght()
select * from station_data WHERE length(report_code) != 6;
-- EXPRESSÃO LIKE COM CORINGAS, COMO %, _
--Neste caso, a expressão retorna todos os valores de report_code que iniciarem com A
SELECT * from station_data where report_code LIKE 'A%';
-- BOOLEANOS
SELECT * from station_data where tornado = 1 AND hail=1;
-- De forma menos verbosa, caso queira ambos os valores verdadeiros
SELECT * from station_data where tornado AND hail;
-- De forma menos verbosa, caso queira ambos os valores falsos
SELECT * from station_data where NOT tornado AND hail;
-- MANIPULANDO NULL: instrução para obter dados onde a profundidade da neve é indefinida
SELECT * from station_data where snow_depth IS NULL;
-- MANEIRA MAIS ELEGANTE DE MANIPULAR NULOS: coalesce()
--Exemplo: se quiser que todos os nulos sejam tratados como 0 na condição. Assim, serão capturados quando escolhermos valores de precipitation menores ou iguais a 0.5
SELECT * from station_data where coalesce(precipitaion, 0) <= 0.5;
-- USANDO NA EXPRESSÃO SELECT
select report_code, coalesce(precipitation, 0) as rainfall from station_data;
-- Mantendo nulos
select report_code, precipitation as rainfall from station_data;
-- Agrupando informações de forma que fiquem legíveis a humanos e máquinas e que não fique ambíguo
--Ex: condições de chuva com neve ou apenas neve
SELECT * from station_data where (rain=1 and temperature<=32) OR snow_depth;