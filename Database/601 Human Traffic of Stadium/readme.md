### Human Traffic of Stadium 601 



X city built a new stadium, each day many people visit it and the stats are saved as these columns: **id**, **visit_****date**, **people**

Please write a query to display the records which have 3 or more consecutive rows and the amount of people more than 100(inclusive).

For example, the table `stadium`:

```
+------+------------+-----------+
| id   | visit_date | people    |
+------+------------+-----------+
| 1    | 2017-01-01 | 10        |
| 2    | 2017-01-02 | 109       |
| 3    | 2017-01-03 | 150       |
| 4    | 2017-01-04 | 99        |
| 5    | 2017-01-05 | 145       |
| 6    | 2017-01-06 | 1455      |
| 7    | 2017-01-07 | 199       |
| 8    | 2017-01-08 | 188       |
+------+------------+-----------+
```

For the sample data above, the output is:

```
+------+------------+-----------+
| id   | visit_date | people    |
+------+------------+-----------+
| 5    | 2017-01-05 | 145       |
| 6    | 2017-01-06 | 1455      |
| 7    | 2017-01-07 | 199       |
| 8    | 2017-01-08 | 188       |
+------+------------+-----------+
```

**Note:**
Each day only have one row record, and the dates are increasing with id increasing.





------

S1 as the last day table

S2 as the middle table

S3 as the first day table

These three combine together, if select S1.ID, will get the biggest ID among the consecutive days. 

So in order to retrieve the earliest days, use S4 to get it .

```mysql
-- my solution
SELECT DISTINCT S4.*
  FROM stadium AS S1
  JOIN stadium AS S2
  JOIN stadium AS S3
  JOIN stadium AS S4
 WHERE S1.id - S2.id = 1
   AND S2.id - S3.id = 1
   AND S1.people >= 100
   AND S2.people >= 100
   AND S3.people >= 100
   AND S4.id >= S1.id -2
   AND S4.id <= S1.id
```





**Sample solution**



Considering t1, t2 and t3 are identical, we can take one of them to consider what conditions we should add to filter the data and get the final result. Taking t1 for example, it could exist in the beginning of the consecutive 3 days, or the middle, or the last.

```mysql
select distinct t1.*
from stadium t1, stadium t2, stadium t3
where t1.people >= 100 and t2.people >= 100 and t3.people >= 100
and
(
	  (t1.id - t2.id = 1 and t1.id - t3.id = 2 and t2.id - t3.id =1)  -- t1, t2, t3
    or
    (t2.id - t1.id = 1 and t2.id - t3.id = 2 and t1.id - t3.id =1) -- t2, t1, t3
    or
    (t3.id - t2.id = 1 and t2.id - t1.id =1 and t3.id - t1.id = 2) -- t3, t2, t1
)
order by t1.id
;
```

