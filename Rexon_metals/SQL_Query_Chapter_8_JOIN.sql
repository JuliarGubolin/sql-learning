-- INNER JOIN: mesclar duas tabelas. É importante possuirmos um campo em comum entre ambas.

SELECT ORDER_ID, 
CUSTOMER.CUSTOMER_ID,
ORDER_DATE,
SHIP_DATE,
NAME,
STREET_ADDRESS,
CITY,
STATE,
ZIP,
PRODUCT_ID,
ORDER_QTY
FROM CUSTOMER INNER JOIN CUSTOMER_ORDER
ON CUSTOMER.CUSTOMER_ID = CUSTOMER_ORDER.CUSTOMER_ID;

--LEFT JOIN: serão mostrados todos os registros da tabela a esquerda do LEFT JOIN. Por exemplo, mesmo que eu tenha clientes que não possuem pedidos, eu irei visualiza-los.
-- Trocando o INNER JOIN da busca anterior por LEFT JOIN:

SELECT
CUSTOMER.CUSTOMER_ID,
NAME,
STREET_ADDRESS,
CITY,
STATE,
ZIP,
PRODUCT_ID,
ORDER_QTY
FROM CUSTOMER LEFT JOIN CUSTOMER_ORDER
ON CUSTOMER.CUSTOMER_ID = CUSTOMER_ORDER.CUSTOMER_ID;

-- Buscando registros ÓRFÃOS: basicamente é o comando anterior, porém com um filtro WHERE para obtermos apenas os registros que não possuem pedidos

SELECT
CUSTOMER.CUSTOMER_ID,
NAME AS CUSTOMER_NAME
FROM CUSTOMER LEFT JOIN CUSTOMER_ORDER
ON CUSTOMER.CUSTOMER_ID = CUSTOMER_ORDER.CUSTOMER_ID
WHERE ORDER_ID IS NULL;

-- Associação entre várias tabelas
-- Em um banco de dados, é comum que uma tabela se relacione com outra. Uma tabela pode ter duas filhas, pode ser pai e filha ao mesmo tempo, dentre tantos casos.
-- como obter dados de dois relacionamentos de uma tabela simultaneamente?
-- no exemplo a baixo, vamos consultar cliente e produto através de customer_order

SELECT 
ORDER_ID, CUSTOMER.CUSTOMER_ID, NAME AS CUSTOMER_NAME, STREET_ADDRESS, CITY, STATE, ZIP, ORDER_DATE, PRODUCT_ID, DESCRIPTION, ORDER_QTY
FROM CUSTOMER INNER JOIN CUSTOMER_ORDER ON CUSTOMER_ORDER.CUSTOMER_ID = CUSTOMER.CUSTOMER_ID INNER JOIN PRODUCT ON CUSTOMER_ORDER.PRODUCT_ID = PRODUCT.PRODUCT_ID;

-- Como podemos ver, podemos ser mais descritivos unindo informações das 3 tabelas
-- Além disso, podemos criar expressões e fazer operações com campos de tabelas diferentes
-- No exemplo a baixo, iremos multiplicar a quantidade de produto pelo preço para verificar a receita obtida com cada pedido

SELECT 
ORDER_ID, CUSTOMER.CUSTOMER_ID, NAME AS CUSTOMER_NAME, STREET_ADDRESS, CITY, STATE, ZIP, ORDER_DATE, PRODUCT_ID, DESCRIPTION, ORDER_QTY, ORDER_QTY * PRICE AS REVENUE
FROM CUSTOMER INNER JOIN CUSTOMER_ORDER ON CUSTOMER_ORDER.CUSTOMER_ID = CUSTOMER.CUSTOMER_ID INNER JOIN PRODUCT ON CUSTOMER_ORDER.PRODUCT_ID = PRODUCT.PRODUCT_ID;

-- AGRUPANDO JOINS
-- E se caso fosse preciso obter a receita bruta por cliente? Neste caso, o cliente de número 3 possui 3 pedidos, então queremos ver a receita dos 3 juntos
-- Para isso, precisamos do GROUP BY (ja que iremos utilizar a função de agregação SUM() e queremos agrupar por CUSTOMER e CUSTOMER_NAME)

SELECT 
NAME AS CUSTOMER_NAME, CUSTOMER.CUSTOMER_ID, SUM(ORDER_QTY * PRICE) AS TOTAL_REVENUE
FROM CUSTOMER_ORDER INNER JOIN CUSTOMER ON CUSTOMER_ORDER.CUSTOMER_ID = CUSTOMER.CUSTOMER_ID INNER JOIN PRODUCT ON CUSTOMER_ORDER.PRODUCT_ID = PRODUCT.PRODUCT_ID
GROUP BY 1, 2;

-- Para vermos todos os clientes, inclusive os que não em pedidos:
SELECT 
NAME AS CUSTOMER_NAME, CUSTOMER.CUSTOMER_ID, SUM(ORDER_QTY * PRICE) AS TOTAL_REVENUE
FROM CUSTOMER LEFT JOIN CUSTOMER_ORDER ON CUSTOMER_ORDER.CUSTOMER_ID = CUSTOMER.CUSTOMER_ID LEFT JOIN PRODUCT ON CUSTOMER_ORDER.PRODUCT_ID = PRODUCT.PRODUCT_ID
GROUP BY 1, 2;

