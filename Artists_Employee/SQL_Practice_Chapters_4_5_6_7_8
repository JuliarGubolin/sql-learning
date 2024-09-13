-- Using the database Artists_Employee to make myself questions and trying to answer

--1. Is *Purchased AAC media* more used in *Pop* or *Drama* genre?
-- Answer: The use of the media is equal for both genres.

select genres.Name, COUNT(media_types.Name) AS Media_Purchased_AAC_Audio_File FROM genres, media_types 
where media_types.Name='Purchased AAC audio file' 
AND genres.Name IN ('Pop', 'Drama')
GROUP BY genres.Name;

-- 2.  Show the employees and how many customers they are helping in decending order.
-- Answer: code.

select employees.FirstName || ' ' || employees.LastName AS Employee_Fullname, 
COUNT(customers.SupportRepId) AS How_Many_Costumers_Am_I_Helping 
FROM employees, customers 
WHERE employees.EmployeeId = customers.SupportRepId
GROUP BY employees.FirstName
ORDER BY employees.FirstName DESC;

-- USING CASE STATEMENTS

-- 3. Classify the invoices: show 'expensive' if price >=  9.50; 'moderate' if price >= 5.2 and price < 9.50 and 'cheap' if price < 5.2
-- Answer: code
select invoices.InvoiceId,
    CASE 
        WHEN invoices.Total >= 9.50 THEN 'EXPENSIVE'
        WHEN invoices.Total BETWEEN 5.2 AND 9.49 THEN 'MODERATE'
        ELSE 'CHEAP'    END as classification_invoice_price
FROM invoices;

-- JOIN CLAUSE
-- 4. As the book example, I will try to use INNER JOIN to show all customers which have invoices and count all records each customer has:
-- Answer: code

SELECT
CUSTOMERS.CustomerId, 
FirstName AS CUSTOMER_NAME,
InvoiceId AS ID_ORDER,
Total,
InvoiceDate AS INITIAL_DATE,
COUNT(*) as NUMBER_ORDERS
FROM CUSTOMERS INNER JOIN INVOICES ON CUSTOMERS.CustomerId = INVOICES.CustomerId
GROUP BY CUSTOMERS.CustomerId;

-- 5. As the book example, I will try to use INNER JOIN to show all invoice_items which have tracks:
-- Answer: code

SELECT
INVOICE_ITEMS.InvoiceId AS Invoice_Item_ID,
UnitPrice,
TrackId,
NAME
FROM INVOICE_ITEMS INNER JOIN TRACKS ON TRACKS.TrackId = INVOICE_ITEMS.TrackId;

-- 5.1. INNER JOIN to show all invoice_items which have tracks AND the average price foi each item. (This ideia was not intesting in this database)
-- Answer: code

SELECT
INVOICE_ITEMS.InvoiceId AS Invoice_Item_ID,
AVG(invoice_items.UnitPrice) AS AVG_PRICE,
NAME
FROM INVOICE_ITEMS INNER JOIN TRACKS ON TRACKS.TrackId = INVOICE_ITEMS.TrackId
GROUP BY Invoice_Item_ID;

-- Since chapters 9 and 10 focus on the a database schema, I'm going to follow with more statements found on the Appendix A and Appendix B of the book

-- 6. Can we manipulate the invoice date using date functions? Let's update some fields INVOICEDATE
 
-- 6.1 Updating date time on field 49
select * from INVOICES;

UPDATE INVOICES SET InvoiceDate = '2024-09-12 21:15:00' WHERE InvoiceId = 49 ;

-- 6.2 Comparing and presenting date time

SELECT InvoiceId, InvoiceDate, Total
FROM INVOICES 
WHERE InvoiceDate > '2010-05-12' ;


-- 6.2 Increasing the power of the last query to group by date ordering by InvoiceDate
SELECT InvoiceId, InvoiceDate, Total,
COUNT(InvoiceDate) as DATES
FROM INVOICES 
WHERE InvoiceDate > '2010-05-12' 
GROUP BY InvoiceDate
ORDER BY InvoiceDate DESC;