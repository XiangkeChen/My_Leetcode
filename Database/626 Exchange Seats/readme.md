# 626 Exchange seats



Mary is a teacher in a middle school and she has a table `seat` storing students' names and their corresponding seat ids.

The column **id** is continuous increment.

 

Mary wants to change seats for the adjacent students.

 

Can you write a SQL query to output the result for Mary?

 

```
+---------+---------+
|    id   | student |
+---------+---------+
|    1    | Abbot   |
|    2    | Doris   |
|    3    | Emerson |
|    4    | Green   |
|    5    | Jeames  |
+---------+---------+
```

For the sample input, the output is:

 

```
+---------+---------+
|    id   | student |
+---------+---------+
|    1    | Doris   |
|    2    | Abbot   |
|    3    | Green   |
|    4    | Emerson |
|    5    | Jeames  |
+---------+---------+
```

**Note:**
If the number of students is odd, there is no need to change the last one's seat.





----



Situation:

(1) not the last row, and it's even row, then go back one record

(2) not the last row, and it's odd row, then go next one record

(3) it's the last row, and it's even row, then go back one record

(4) others: only remaining last row and odd row, no change!



```mysql
SELECT  CASE WHEN id != (SELECT MAX(id) FROM seat) AND mod(id,2) = 0 THEN id -1
        WHEN id != (SELECT MAX(id) FROM seat) AND mod(id,2) != 0 THEN id + 1
        WHEN id = (SELECT MAX(id) FROM seat) AND mod(id,2) = 0 THEN id - 1
        ELSE id
        END AS id,
        student
  FROM  seat
 ORDER BY ID
 
-- suddenly realize that the situations have overlap and could be merged
SELECT  CASE WHEN mod(id,2) = 0 THEN id -1
        WHEN id != (SELECT MAX(id) FROM seat) AND mod(id,2) != 0 THEN id + 1
        ELSE id
        END AS id,
        student
  FROM  seat
 ORDER BY ID
```



Sample solution from discussion

```mysql
select
if(id < (select count(*) from seat), if(id mod 2=0, id-1, id+1), if(id mod 2=0, id-1, id)) as id, student
from seat
order by id asc;
```

