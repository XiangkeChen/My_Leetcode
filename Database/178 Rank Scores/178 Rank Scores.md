### 178 Rank Scores

Write a SQL query to rank scores. If there is a tie between two scores, both should have the same ranking. Note that after a tie, the next ranking number should be the next consecutive integer value. In other words, there should be no "holes" between ranks.

```
+----+-------+
| Id | Score |
+----+-------+
| 1  | 3.50  |
| 2  | 3.65  |
| 3  | 4.00  |
| 4  | 3.85  |
| 5  | 4.00  |
| 6  | 3.65  |
+----+-------+
```

For example, given the above `Scores` table, your query should generate the following report (order by highest score):

```
+-------+------+
| Score | Rank |
+-------+------+
| 4.00  | 1    |
| 4.00  | 1    |
| 3.85  | 2    |
| 3.65  | 3    |
| 3.65  | 3    |
| 3.50  | 4    |
+-------+------+
```



**Solution**

首先吐槽 LC不支持window func，就还挺麻烦的

这道题真的很妙 给到了我一些关于rank的新的想法。ken上课时候也有要求我们使用w/o window func去解决问题 但是感觉这道题更精简吧 把思路给显示出来了。

首先明确 题目要求有tie的话是一个rank，下一次的rank+1没有skip，也就是*dense_rank*

[Sample Answers](https://leetcode.com/problems/rank-scores/discuss/53094/Simple-Short-Fast)

下面对答案进行分析和探讨

```mysql
SELECT
  Score,
  @rank := @rank + (@prev <> (@prev := Score)) Rank
FROM
  Scores,
  (SELECT @rank := 0, @prev := -1) init
ORDER BY Score desc
```

这样的写法我肯定是写不出来的。大概就是scores 和 两个session variable(SS) 作为一张新的表，然后开始select，

一开始rank=0，prev=-1， 如果prev score和当下的score一样，那么返回0，不一样返回1。所以每一次新的一行记录会和之前的比。如果是相同的score，rank就没有变，不一样的score，rank就+1了

prev的值在每一次比较的时候去改变 太骚啦！

----

解法2

这个解法更加舒适让我好理解一些

```mysql
# subquery 的写法
SELECT
  Score,
  (SELECT count(distinct Score) FROM Scores WHERE Score >= s.Score) Rank
FROM Scores s
ORDER BY Score desc
# materialized table
# 不过为什么这里是group by id我还有点无解 但感觉上应该是找那个 可以unique identify一行记录的column
SELECT s.Score, 
			 count(distinct t.score) Rank
	FROM Scores s 
	JOIN Scores t ON s.Score <= t.score
 GROUP BY s.Id
 ORDER BY s.Score desc
```

原理非常简单 大概就是同样的两张表 一张S一张T，我们join后只留下 比自己score大的那些records，数一下究竟有几条呢。。。把这个作为rank就好

-----

拓展。

题目现在要求是dense rank的写法，如果说要求rank的写法了怎么办 [解法](https://stackoverflow.com/questions/46856267/implement-rank-without-using-analytic-function)

```mysql
# >= 改成 > 号，count(distinct 表2.score) 改成 (count *) 
SELECT
  Score,
  (SELECT count(*) + 1 FROM Scores WHERE Score > s.Score) Rank
FROM Scores s
ORDER BY Score desc
```

如果要求row_number的写法呢？

```mysql
这个暂时没有理解投 看stackoverflow的好
```



