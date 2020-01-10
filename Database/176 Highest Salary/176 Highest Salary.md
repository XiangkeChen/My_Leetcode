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

首先，关于limit的用法，平时limit你会用的。这里就是可以学会limit,offset

```mysql
select column limit a,b
```

他会从a+1行开始，选取b行的数据

比如

```mysql
select column limit 2,3
```

就会选出 3,4,5 这三行。

这道题有一个比较容易陷入陷阱的地方就是，如果记录是，100，100，其实是没有secondHighest的。以及100,100,200, 200, 第二大是100.如果你order by，会选到200.因为你没有**distinct**

所以我们一定要加上distinct

```mysql
# sample answer
SELECT
    (SELECT DISTINCT
            Salary
        FROM
            Employee
        ORDER BY Salary DESC
     # 写成 limit 1,1 也是一样的 和offset是一个道理
        LIMIT 1 OFFSET 1) AS SecondHighestSalary
```