# LEARNING AND REVIEWING :books:

As a Data Science student, my primary goal is to understand master SQL. To achieve this, I am reading SQL books, starting with *"Getting started with SQL"* by Thomas Nield (O'Reilly). Copyright 2016 Thomas Nield, 978-7-4919-3816-4. Althought I am already familiar with much of the content, I believe it's essential to reinforce some commands, clauses and statements in the language.

Below, I will summarize the most interesting and useful aspects of each chapter. Additionally, whenever I feel inspired, I plan to create practical exercises to apply my new knowledge.

<img src="Readme_Images/BOOK.jpg" alt="image" width="30%" height="auto">

## HOW DID I PRACTICE WHILE STUDYING

Since the book does not include exercises to practice, I downloaded a ready to use database from [SQLite Tutorial](https://www.sqlitetutorial.net/sqlite-sample-database/). I named "Artist_Employee", but the original name is "Chinook". The SQL file containing the **questions** I created by myself and **answers** is in the folder "Artists_Employee" above.

![alt text](Readme_Images/sqlite-sample-database-artists_employee.jpg)

## Chapter 4: `SELECT` COMMAND

Three years ago, at my first graduation, the `SELECT` command was the first command I learned during the subject "Databases I". Therefore, this module was easier and familiar for me. Despite that, there were some topics I've never heard about, such as **text concatenation**. This topic is about how you can concatenate informations from diferent colums into one and show them in an expecific way for your user. Let's see an example:

Let's pretend I want to concatenate 2 colums, `CITY` and `STATE`, from a table called `USERS` to show it as an address (`LOCATION`), for example, I could use the symbol bar "|":

`SELECT NAME, CITY || ',' || STATE AS LOCATION FROM USERS`

In the example above, this new column, which concatenates the two other columns, was named `LOCATION`, but it wasn't created as an actual column in the table. It's just to display information.

For this chapter, the author used the database *Weather_Stations*.

## Chapter 5: `WHERE` COMMAND

For this chapter, the author used the database *Rexon_Metals*.

This chapter is full of useful comands and symbols. The most intersting for me was the '%' and '_', linked with the expression `LIKE` string by characters to filter. For example: if I just want the report codes from the column `report_code` of the table `station_data` that starts with 'A' followed by any character.

`SELECT * FROM STATION_DATA  WHERE REPORT_CODE LIKE 'A%'`

As you have been noticing, I like to manipulate strings.

## Chapter 6: `GROUP BY` AND `ORDER BY` COMMANDS

For this chapter, the author used the database *Weather_Stations*.

This chapter has a lot of usefull information that I have never learned before and introduced more than 10 new commands, including aggregate functions and operators llike `DESC` and `DISTINCT`.

Even though there are a lot of information, I am going to start by the command `ORDER BY`, because this was the one I struggled to undertand. It's used to order a set in ascending or decending order (for this last one, you will need to use `DESC` after the column's name).

Using the database "Chinook" from SQLite website, I tried to create questions to answer myself. I am going to write it below, followed by my answer. (More questions in the file)

1.  Is *Purchased AAC media* more used in *Pop* or *Drama* genre?

- Answer: The use of the media is equal for both genres.

SQL Query used:

`select genres.Name, `
`COUNT(media_types.Name) AS Media_Purchased_AAC_Audio_File FROM genres, media_types `
`where media_types.Name='Purchased AAC audio file' AND genres.Name IN ('Pop', 'Drama')`
`GROUP BY genres.Name;`

As you can see, I needed to learn more contents than I had been leaning until now. But it was really helpful to see beyond the book's content.One important thing I learned from this exercise is that `COUNT()` only works if used with `GROUP BY`.

2.  Show the employees and how many customers they are helping in decending order.

- Answer: code.

`select employees.FirstName || ' ' || employees.LastName AS EMPLOYEE_FULLNAME, `
`COUNT(customers.SupportRepId) AS How_Many_Costumers_Am_I_Helping `
`FROM employees, customers `
`WHERE employees.EmployeeId = customers.SupportRepId `
`GROUP BY employees.FirstName `
`ORDER BY employees.FirstName DESC; `

Result table:

![alt text](Readme_Images/image.png)

From this question, I learned the importance of follow the SQL commands in the correct sequen

## Chapter 7: `CASE` STATEMENTS

For this chapter, the author used the database *Weather_Stations*.

Since I have a good knowledge of programming, learn about this topic was easier. CASE statement can filter information, just like `WHERE` command does, but it allow us to be more specific and  make more complex queries. 

The most interesting topic about this chapter was "Case Zero/Null", which shows that we can put a whole `CASE` statement inside an agregated function:

`SELECT month,`
`AVG(CASE WHEN (RAIN OR HAIL) THEN temperature ELSE 0 END) as avg_precipitation_temp,`
`AVG(CASE WHEN NOT (RAIN OR HAIL) THEN temperature ELSE 0 END) as non_avg_precipitation_temp`
`FROM station_data`
`WHERE year > 2000`
`GROUP BY month`

In the query above, the aim is to get the average of temperature when it rains or hails and when it does not rain or hail after the year 2000.

## Chapter 8: `JOIN` CLAUSE

This chapter explain **three types** of JOIN clause: `INNER JOIN`, `LEFT JOIN` and `RIGHT (OUTER) JOIN`. Let's start with `INNER JOIN`. The images illustrating the `JOINS` are from [W3Schools website](https://www.w3schools.com/sql/sql_join.asp).

### 1. `INNER JOIN`

`INNER JOIN` is used to return records that have commom columns in both tables.

![INNER JOIN FROM W3SCHOOLS](Readme_Images/Inner_Join.png)

This type is used with `FROM` statement and just returns records that exists in both tables. In addiction: `INNER JOIN` does not allow null vales. So, if you want to see NULL values you should use `LEFT JOIN`.

EXAMPLE: shows all customers and your invoices. This two tables are related by the field `CustomerId`.

`SELECT`
`CUSTOMERS.CustomerId,`
`FirstName AS CUSTOMER_NAME,`
`InvoiceId AS ID_ORDER,`
`Total,`
`InvoiceDate AS INITIAL_DATE,`
`COUNT(*) as NUMBER_ORDERS`
`FROM CUSTOMERS INNER JOIN INVOICES ON CUSTOMERS.CustomerId = INVOICES.CustomerId`
`GROUP BY CUSTOMERS.CustomerId;`

### 2. `LEFT JOIN`

`LEFT JOIN` is used to return all records from the left table and the records that mached records from the right table. The author recommends to use always `LEFT JOIN` with the table with "all records" on the LEFT of the clause because `RIGHT JOIN` is barely used and must be avoided.

![INNER JOIN FROM W3SCHOOLS](Readme_Images/Left_Join.png)

### 3. `RIGHT JOIN` and `OUTER JOIN`

Both clauses are barely used and SQLite does not support them. Because of that, the book does not show examples of this two clauses.

## Chapter 9: DATABASE DESIGN

Throught this chapter, we are going to build our own database, rather than just manipulating data using queries.

This database was created by the author to manage a fictional conference called **SurgeTech**. In this fictional scenario, you were tasked by the manager to build a database to handle the attendees, companies, rooms, presentations and attendancees of each presentation. The database schema (made using [Miro](https://miro.com/app/dashboard/) and exacly the same presented in the book) is shown below:

**DATABASE SCHEMA**

<img src="Readme_Images/Database_Schema.png" alt="image" width="60%" height="auto">

These tables and the database were created in SQLite using the interface, as the book taught, but you can use the command `CREATE TABLE` if you want to. So now, the database browser has a database named **SurgeTech_Conference**.

After create all the five tables, the book taught how o make associations and how to make foreign keys. So I made it using the instructions. Below, I copied the table used by the author to explain the foreign keys and primary keys and its associations.

| FOREIGN KEY _CHILD TABLE_  | PRIMARY KEY _PARENT TABLE_ |
| -------- | -------- |
| PRESENTATION.BOOKED_ROOM_ID  | ROOM.ROOM_ID
| PRESENTATION_ATTENDANCEE.PRESENTATION_ID | PRESENTATION.PRESENTATION_ID |
| PRESENTATION_ATTENDANCEE.ATTENDEE_ID   | ATTENDEE.ATENDEE_ID |
| COMPANY.PRIMARY_CONTATC_ATTENDEE_ID| ATTENDEE.ATTENDEE_ID|

### CREATING VIEWS

This chapter also shows how to create views. Views are a way to save a often used SQL Query to be easily acessed and executed. The query used to create the firts view is shown below:

`SELECT`
`COMPANY.NAME AS COMPANY_NAME,`
`PRESENTATION_ID,`
`ROOM.ROOM_ID AS ROOM_IDENTIFY`
`FROM PRESENTATION INNER JOIN COMPANY ON COMPANY.COMPANY_ID = PRESENTATION.BOOKED_COMPANY_ID `
`INNER JOIN ROOM ON PRESENTATION.BOOKED_ROOM_ID = ROOM.ROOM_ID`
`GROUP BY PRESENTATION.PRESENTATION_ID`

This query I made by myself using the instruction presented in the book: "Show presentation informations with the company's and room's informations".

## Chapter 10: MANAGING DATA

This chapter explains the statements `INSERT`, `UPDATE`, `DELETE`, `TRUNCATE TABLE`, `DROP TABLE` and how to `INSERT `and `UPDATE` multiple data.

The examples in the book are pretty simple. The most interesting topic is about `TRUNCATE TABLE`, which is not supported in SQLite. This statement can delete all the rows in a table, but the `AUTO_INCREMENT` value will be reset to its start number.

## Chapter 11: MOVING FORWARD

This last chapter aswers teh question: "Whats comes next?", listing some books to follow along with SQL, Python, R and more about data science.

I'm not going to write about the Appendix, but I'm studying about the statements commented. Very good book!