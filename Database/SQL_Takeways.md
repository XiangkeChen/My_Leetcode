# Data Definition Language (DDL)

`create database [name]` = `create schema [name]`

```mysql
CREATE TABLE Employee (
  empId INTEGER NOT NULL PRIMARY KEY, 
  empSSN CHAR(11) NOT NULL UNIQUE, 
  ...)
```

`Drop database [name]` this will delete an entire database in the blink of an eye, you should be careful

`Drop Table [name]`  when you have a reference, you cannot delete the table directly

`Auto_increment` generate unique IDs

```mysql
CREATE TABLE Employee (
  empId INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
  ...)
```

`Alter Table`  if you want to change a table

```mysql
ALTER TABLE Student ADD COLUMN birth_year INT;
ALTER TABLE Student DROP COLUMN birth_year;
ALTER TABLE Student MODIFY COLUMN birth_year CHAR(4);
```

`Describe Table` to get information for a particular table

`Show tables` to show all tables in the current database

-----

# Data Manipulation Language (DML)

`Insert Into Table[name][column] Values [value]`

![image-20200105210836394](sql_takeways.assets/image-20200105210836394.png)

`Insert Into All fields`

![image-20200105210854904](sql_takeways.assets/image-20200105210854904.png)



# Join VS Subquery

Answer quoted from [mysql](https://dev.mysql.com/doc/refman/5.7/en/rewriting-subqueries.html): 



```
A LEFT [OUTER] JOIN can be faster than an equivalent subquery because the server might be able to optimize it better—a fact
that is not specific to MySQL Server alone. Prior to SQL-92, outer joins did not exist, so subqueries were the only way to do certain things. Today, MySQL Server and many other modern database systems offer a wide range of outer join types.
```

Answer quoted from [Stackoverflow](https://stackoverflow.com/questions/2577174/join-vs-sub-query):



For me, I'll say that subquery looks easier, more readable and understandable versus join. And you should keep in mind that there might be **duplicate** records while using join query. So you should always keep cautious. 

**Exercise**

```
Find ID whose years in 2016 not in 2017, you can't use subquery,
only one select statement
+---+-----+
|ID | Year|
+---+-----+
|1  | 2016|
|1  | 2017|
|2  | 2017|
|3  | 2016|
+---+-----+
```

This Question restrain you only use one `select` statement without any subquery ( left join (select * from xxx)) is forbidden too)

The solution below shows the technique using `join` and `on` to achieve the same effect of using subquery

**Most important is to note that `on T2.year = 2017`**

You should also be skilled at using combination of `left join` and `is null`

```mysql
SELECT DISTINCT *
  FROM ID_Year T1
  LEFT JOIN ID_Year T2 ON T1.ID = T2.ID AND T2.year = 2017
 WHERE T1.year = 2016
   AND T2.year IS NULL
```



# SQL vs NoSQL

[Sql vs Nosql](https://www.guru99.com/sql-vs-nosql.html)

| **Parameter**    | **SQL**                                                      | **NOSQL**                                                    |
| ---------------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| Definition       | SQL databases are primarily called RDBMS or Relational Databases | NoSQL databases are primarily called as Non-relational or distributed database |
| Design for       | Traditional RDBMS uses SQL syntax and queries to analyze and get the data for further insights. They are used for OLAP systems. | NoSQL database system consists of various kind of database technologies. These databases were developed in response to the demands presented for the development of the modern application. |
| Query Language   | Structured query language (SQL)                              | No declarative query language                                |
| Type             | SQL databases are table based databases                      | NoSQL databases can be document based, key-value pairs, graph databases |
| Schema           | SQL databases have a predefined schema                       | NoSQL databases use dynamic schema for unstructured data.    |
| Ability to scale | SQL databases are vertically scalable                        | NoSQL databases are horizontally scalable                    |



**KEY DIFFERENCE**

- SQL pronounced as "S-Q-L" or as "See-Quel" is primarily called RDBMS or Relational Databases whereas NoSQL is a Non-relational or Distributed Database.
- SQL databases are table based databases whereas NoSQL databases can be document based, key-value pairs, graph databases.
- SQL databases are vertically scalable while NoSQL databases are horizontally scalable.
- SQL databases have a predefined schema whereas NoSQL databases use dynamic schema for unstructured data.
- SQL requires specialized DB hardware for better performance while NoSQL uses commodity hardware.

---

https://stackoverflow.com/questions/46856267/implement-rank-without-using-analytic-function)



# TIME FUNCTIONS

**DATE_TIME**

date_time(date, format)

| Specifier | Description                            |
| --------- | -------------------------------------- |
| `%c`      | Month, numeric (`0`..`12`)             |
| `%d`      | Day of the month, numeric (`00`..`31`) |
| `%e`      | Day of the month, numeric (`0`..`31`)  |
| `%H`      | Hour (`00`..`23`)                      |
| `%h`      | Hour (`01`..`12`)                      |
| `%I`      | Hour (`01`..`12`)                      |
| `%i`      | Minutes, numeric (`00`..`59`)          |
| `%k`      | Hour (`0`..`23`)                       |
| `%l`      | Hour (`1`..`12`)                       |
| `%m`      | Month, numeric (`00`..`12`)            |
| `%s`      | Seconds (`00`..`59`)                   |
| `%T`      | Time, 24-hour (*`hh:mm:ss`*)           |
| `%Y`      | Year, numeric, four digits             |
| `%y`      | Year, numeric (two digits)             |
| `%%`      | A literal `%` character                |



# Trap

- `1 + NULL`, return NULL
- 



![image-20200105211213905](SQL_Takeways.assets/image-20200105211213905.png)