select PRODUCT_ID, DESCRIPTION, PRICE, PRICE * 1.07 AS TAXED_PRICE from PRODUCT;
-- A consulta acima retorna uma NOVA COLUNA chamada TAXED_PRICE, a qual pega o valor de PRICE e multiplica por 1.07
select PRODUCT_ID, DESCRIPTION, PRICE AS UNTAXED_PRICE, PRICE * 1.07 AS TAXED_PRICE from PRODUCT;
select PRODUCT_ID, DESCRIPTION, PRICE, round(PRICE * 1.07, 2) AS TAXED_PRICE from PRODUCT;
--CONCATENAÇÃO: UNE DOIS ELEMENTOS STRING USANDO O ||
select NAME, CITY || ',' || STATE AS LOCATION FROM CUSTOMER;
select NAME, CITY || STATE AS LOCATION FROM CUSTOMER; -- aqui, sem a vírgula separando
-- A CONCATENAÇÃO CONVERTE TODOS OS ITENS CONCATENADOS EM TEXTO (STRING)
-- Podem ser feitas também operações matemáticas básicas, como soma, subtração e resto da divisão
 select NAME, ZIP, ZIP + ZIP AS DOUBLE_ZIP FROM CUSTOMER;