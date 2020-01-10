### 184 [Department Highest Salary](https://leetcode.com/problems/department-highest-salary) *

The `Employee` table holds all employees. Every employee has an Id, a salary, and there is also a column for the department Id.

```
+----+-------+--------+--------------+
| Id | Name  | Salary | DepartmentId |
+----+-------+--------+--------------+
| 1  | Joe   | 70000  | 1            |
| 2  | Jim   | 90000  | 1            |
| 3  | Henry | 80000  | 2            |
| 4  | Sam   | 60000  | 2            |
| 5  | Max   | 90000  | 1            |
+----+-------+--------+--------------+
```

The `Department` table holds all departments of the company.

```
+----+----------+
| Id | Name     |
+----+----------+
| 1  | IT       |
| 2  | Sales    |
+----+----------+
```

Write a SQL query to find employees who have the highest salary in each of the departments. For the above tables, your SQL query should return the following rows (order of rows does not matter).

```
+------------+----------+--------+
| Department | Employee | Salary |
+------------+----------+--------+
| IT         | Max      | 90000  |
| IT         | Jim      | 90000  |
| Sales      | Henry    | 80000  |
+------------+----------+--------+
```

**Explanation:**

Max and Jim both have the highest salary in the IT department and Henry has the highest salary in the Sales department.



**Solution**

解法

```mysql
# 我现在做题目有点依赖于 rank去做了，渐渐忽视了max 和 min的写法
SELECT  Department, Name AS Employee , Salary FROM (
SELECT  E1.Name, E1.Salary,
        (SELECT  COUNT(DISTINCT E2.Salary) FROM Employee AS E2
          WHERE E2.DepartmentId = E1.DepartmentId
            AND  E2.Salary >= E1.Salary) AS Rank,
        D.name AS Department
  FROM  Employee AS E1
  JOIN  Department AS D ON D.Id = E1.DepartmentId
 ORDER  BY E1.Salary,E1.DepartmentId DESC) AS T
 WHERE  Rank = 1
 
# 首先找到max-salary，然后让salary等于max_salary 就可以。这样会比较快。
# subquery写也可以，但是应该是materilised table比较快
SELECT  D.name AS Department, E.Name AS Employee, E.Salary
  FROM  Employee AS E
  JOIN  Department AS D ON D.Id = E.Departmentid
  JOIN  (SELECT  DepartmentId, MAX(salary) AS max_s
          FROM  Employee 
         GROUP  BY DepartmentId) AS T ON T.Departmentid = E.Departmentid
 WHERE  T.max_s = E.Salary
```

两种解法。解法一是我最近特别喜欢去尝试写的写法 可以在不用window function的情况下去写rank，去掉=号和变成1+count(*) 就是rank，如上写法就是dense_rank。

但是这种max / min的题 其实用解法二会更好，直接找到max/min salary然后对原表进行join。学习！、

就我现在经验看来 解法12有不同的使用场景

1. **解法一适合于选择top N，比如top3 top 2这种 有rank会方便很多**
2. **解法二适合于top1，max or min都是可以的！每个月分组的最大最小值你就直接max + group by就好**

----

另外 我以为一直以为，where ID in (SELECT ID FROM XXX) 这种约束条件肯定是只有一个column的，今天才知道原来多column筛选也是可以的。

```mysql
SELECT D.Name AS Department ,E.Name AS Employee ,E.Salary 
from 
	Employee E,
	Department D 
WHERE E.DepartmentId = D.id 
# 可以多个column同时进行匹配
  AND (DepartmentId,Salary) in 
  (SELECT DepartmentId,max(Salary) as max FROM Employee GROUP BY DepartmentId)
```

185 就是184的变题