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



### Question2



Two tables:

**Publisher_info:**

- Pub_id
- Video_id
- Video_duration ( in minutes)

**Consumption_info**

- video_id
- user_id
- user_timespent



1. **How many minutes worth of video does an average publisher have?**

   ```mysql
   SELECT  SUM(Video_duration) / COUNT(DISTINCT pub_id) AS average_video_spent
     FROM  Publiser_info AS P 
   ```

   

2. **How many publishers have at least one user who watched their video?**

   ```mysql
   SELECT  COUNT(DISTINCT pub_id) AS num
     FROM  Publissher_info AS P 
     JOIN  Consumption_info AS C ON C.video_id = p.video_id
   ```

   