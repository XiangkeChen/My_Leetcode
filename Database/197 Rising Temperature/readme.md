### 197 [Rising Temperature](https://leetcode.com/problems/rising-temperature)  

Given a `Weather` table, write a SQL query to find all dates' Ids with higher temperature compared to its previous (yesterday's) dates.

```
+---------+------------------+------------------+
| Id(INT) | RecordDate(DATE) | Temperature(INT) |
+---------+------------------+------------------+
|       1 |       2015-01-01 |               10 |
|       2 |       2015-01-02 |               25 |
|       3 |       2015-01-03 |               20 |
|       4 |       2015-01-04 |               30 |
+---------+------------------+------------------+
```

For example, return the following Ids for the above `Weather` table:

```
+----+
| Id |
+----+
|  2 |
|  4 |
+----+
```



**Solution**

解法

```mysql
# 这道题错了好多次 主要问题是因为连接的时候，我们比较的是日期 不能直接给日期+1/-1，所以是需要用一些函数的

SELECT  distinct w1.Id as Id
  FROM  Weather AS w1
  JOIN  Weather AS w2 ON w1.RecordDate = Date_Add(w2.RecordDate,INTERVAL 1 DAY)
  WHERE W1.Temperature > w2.Temperature
```

**日期函数**

- DATE_ADD(Date, Interval Unit)
- TO_DAYS(Date)
- DATEDIFF(DATE1,DATE2)



