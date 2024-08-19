# LEARNING AND REVIEWING :books:

As a Data Science student, my first goal is to understand SQL completely. To fulfill this goal, I am reading SQL books. The first one is *"Learning SQL: Master SQL Fundamentals"*. I already know most of the contents, but it's important to reinforme some comands and aspects of the language.

I am gonna write below the most interesting and useful aspects of each chapter and, whenever I feel inspired, I am going to create something to practice the new knowledge.

<img src="BOOK.jpg" alt="image" width="50%" height="auto">

## Chapter 4: `SELECT` COMMAND

Three year ago, at my first graduation, the "*select*" command was the first command I learned during the subject "Databases I". Therefore, this module was easy and familiar for me. Despite that, there were some topicts I've never heard about, such as text concatenation. This topic is about how you can concatenate informations from diferent colums into one and show them in an expecific way for your user. Let's see an example:

If I want to concatenate 2 colums: *city* and *state* from a table called *Users* to show it as an address, for example, I could use the symbol bar "|":

`SELECT NAME, CITY || ',' || STATE AS LOCATION FROM USERS`

In the example above, this new column, which concatenates the two other columns will be named as "location", but won't be created as a real column in the table. It's just to present information.

For this modulo, the author used the database *Weather_Stations*.

## Chapter 5: `WHERE` COMMAND

For this modulo, the author used the database *Rexon_Metals*.

This chapter is full of useful comands and symbols. The most intersting for me was the '%' and '_', linked with the expression *LIKE* string by characters to filter. For example: if I just want the report codes from the column *report_code* of the *station_data table* that starts with 'A' followed by any character.

`SELECT * FROM STATION_DATA  WHERE REPORT_code like 'A%'`

As you have been noticing, I like to manipulate strings.

## Chapter 6: `GROUP BY` AND `ORDER BY` COMMANDS

In progress! 