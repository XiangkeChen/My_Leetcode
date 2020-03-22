**How to generate sequence number** 

- Use recursive query



```mysql
WITH RECURSIVE CTE AS (
	SELECT start_number AS ID 
UNION ALL
	SELECT C.ID + gap_number
   FROM CTE AS C
WHERE ID <= max_number - gap_number) -- otherwise will exceed the max number
SELECT * FROM CTE
```







------

```
1. Given a table "numbers" below  that has column "n" which is a sequence of integers with a step of 3, find the gap:

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

Writre query for Expected Output:  15
```



```mysql
-- work for situation that there are lots of gap numbers
WITH RECURSIVE CTE AS (
SELECT 3 AS ID 
UNION ALL
SELECT C.ID + 3
 FROM CTE AS C
WHERE ID <= (SELECT MAX(ID)-3 FROM gap_number)
)
SELECT * FROM CTE
  LEFT JOIN gap_number AS G USING(ID)
  WHERE G.ID IS NULL
```



```mysql
-- if there is only one gap
SELECT a.n+3
FROM numbers a
LEFT OUTER JOIN numbers b
ON a.n = b.n-3
WHERE b.n IS NULL
```



