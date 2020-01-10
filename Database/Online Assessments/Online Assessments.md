## Online Assessments

### Question1

Given a table "numbers" below that has column "n" which is a sequence of integers with a step of 3, find the gap:

numbers
+--+
|n |
+--+
|3 |
|6 |
|9 |
|12|
|18|
+--+

Writre query for Expected Output: 15

```mysql
WITH CTE AS 
(
SELECT  ID, ROW_NUMBER() OVER(ORDER BY ID) * 3 AS Gap
  FROM  gap_number
) 
SELECT gap FROM CTE WHERE ID != gap
```



