### 595 BigCountries

There is a table `World`

```
+-----------------+------------+------------+--------------+---------------+
| name            | continent  | area       | population   | gdp           |
+-----------------+------------+------------+--------------+---------------+
| Afghanistan     | Asia       | 652230     | 25500100     | 20343000      |
| Albania         | Europe     | 28748      | 2831741      | 12960000      |
| Algeria         | Africa     | 2381741    | 37100000     | 188681000     |
| Andorra         | Europe     | 468        | 78115        | 3712000       |
| Angola          | Africa     | 1246700    | 20609294     | 100990000     |
+-----------------+------------+------------+--------------+---------------+
```

A country is big if it has an area of bigger than 3 million square km or a population of more than 25 million.

Write a SQL solution to output big countries' name, population and area.

For example, according to the above table, we should output:

```
+--------------+-------------+--------------+
| name         | population  | area         |
+--------------+-------------+--------------+
| Afghanistan  | 25500100    | 652230       |
| Algeria      | 37100000    | 2381741      |
+--------------+-------------+--------------+
```



**Solution**

**Why `Union` is faster than `OR`?**

Strictly speaking, Using `UNION` is faster when it comes to cases like **scan two different column like this**.

(Of course using `UNION ALL` is much faster than `UNION` since we don't need to sort the result. But it violates the requirements)

Suppose we are searching `population` and `area`, Given that MySQL usually uses one one index per table in a given query, so when it uses the 1st index rather than 2nd index, it would still have to do a table-scan to find rows that fit the 2nd index.

When using `UNION`, each sub-query can use the index of its search, then combine the sub-query by `UNION`

**Sequence of OR**

Did you pay attention to order of conditions in a where clause?
<u>OR does not need to check second part if the first is true. What is means? - Put more likely true condition first and see</u>

**Difference between UNION ALL and UNION**

- UNION ALL keep duplicate rows while UNION remove duplicate rows

