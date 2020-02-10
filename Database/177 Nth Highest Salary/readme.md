### 177 Nth Highest Salary

Write a SQL query to get the *n*th highest salary from the `Employee` table.

```
+----+--------+
| Id | Salary |
+----+--------+
| 1  | 100    |
| 2  | 200    |
| 3  | 300    |
+----+--------+
```

For example, given the above Employee table, the *n*th highest salary where *n* = 2 is `200`. If there is no *n*th highest salary, then the query should return `null`.

```
+------------------------+
| getNthHighestSalary(2) |
+------------------------+
| 200                    |
+------------------------+
```



**Solution**

This question is almost the same as question 176

The reason I still keep this question in the list in to remind you how to write `FUNCTIONS` in mysql.

Keep the following codes in mind.

```mysql
CREATE FUNCTION function_name [ (parameter datatype [, parameter datatype]) ]
RETURNS return_datatype

BEGIN

   declaration_section

   executable_section

END;
```



```mysql
# Sample answer
# limit后面不能直接写N-1，他只接受数字。所以先定义一个M等于N-1，这种虚拟变量定义之前一般需要先declare。
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  DECLARE M INT;
  SET M = N-1;
  RETURN (
      # Write your MySQL query statement below.
      SELECT 
      IFNULL((SELECT DISTINCT Salary FROM Employee ORDER BY Salary DESC LIMIT M,1),NULL) AS getNthHighestSalary
  );
END
```







*IDEA*

Main parts of a function in mysql are:

- CREATE FUNCTION function_name(input type) return return_type
- BEGIN
- DECLRARE
- SET
- RETURN(SQL statement)
- END