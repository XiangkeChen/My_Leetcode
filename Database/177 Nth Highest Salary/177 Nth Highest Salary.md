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

和上面176是一道题 这里的话要学习一下怎么写mysql的function

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
# limit后面不能直接写N-1，他只接受数字。所以先定义一个M等于N-1，这种虚拟变量定义之前一半需要先declare。
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



瞎默写语法结构 万一哪一天面试官叫你写一个function怎么办呢是吧

CREATE FUNCTION xxx(year DATETIME) RETURNS INT

BEGIN

DECLARE X INT;

SET X = M -1 ;

RETURN (SELECT./....)

END

