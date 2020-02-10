### 176 Highest Salary

Write a SQL query to get the second highest salary from the `Employee` table.

```
+----+--------+
| Id | Salary |
+----+--------+
| 1  | 100    |
| 2  | 200    |
| 3  | 300    |
+----+--------+
```

For example, given the above Employee table, the query should return `200` as the second highest salary. If there is no second highest salary, then the query should return `null`.

```
+---------------------+
| SecondHighestSalary |
+---------------------+
| 200                 |
+---------------------+
```



**Solution**

```mysql
# Write your MySQL query statement below

# 不写case when似乎就没问题！太奇怪了吧3
SELECT CASE Salary WHEN NULL THEN NULL
        ELSE Salary
        END AS SecondHighestSalary
   FROM (
SELECT DISTINCT Salary 
  FROM Employee 
 ORDER BY Salary DESC
 LIMIT 1,1)  AS T 
 
 
 
#  没有了distinct 这道题就错了 我可以理解 但是报错好奇怪
SELECT
    IFNULL(
      (SELECT DISTINCT Salary
       FROM Employee
       ORDER BY Salary DESC
        LIMIT 1 OFFSET 1),
    NULL) AS SecondHighestSalary


# Write your MySQL query statement below
SELECT
    (SELECT DISTINCT
            Salary
        FROM
            Employee
        ORDER BY Salary DESC
        LIMIT 1 OFFSET 1) AS SecondHighestSalary


SELECT DISTINCT
            Salary  AS SecondHighestSalary
        FROM
            Employee
        ORDER BY Salary DESC
        LIMIT 1 OFFSET 1
```





**Idea**

First, you can use `limit` function. But be aware of that `limit m,n` will start select data from `m+1` rows and return n rows in total

```mysql
select column limit a,b
```

For example

```mysql
select column limit 2,3
```

Rows (3,4,5) will be returned



**Trap**

One trap of this question is that what if there is no *second highest* records in our table? Can you still return the result? 

The answer is no. You will return null. So be sure you also considerate this bound situation.

For example, 

If all the records in the table are 100,100,100. Then you don't have a second highest. To avoid this, you should use `distinct` function when `order` data.

```mysql
# sample answer
SELECT
    (SELECT DISTINCT
            Salary
        FROM
            Employee
        ORDER BY Salary DESC
        LIMIT 1,1) AS SecondHighestSalary
```