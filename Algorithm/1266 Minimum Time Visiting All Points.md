#### Leetcode Algorithm 1266

**question**

On a plane there are `n` points with integer coordinates `points[i] = [xi, yi]`. Your task is to find the minimum time in seconds to visit all points.

You can move according to the next rules:

- In one second always you can either move vertically, horizontally by one unit or diagonally (it means to move one unit vertically and one unit horizontally in one second).
- You have to visit the points in the same order as they appear in the array.

 

**Example 1:**

![image-20191228120800112](00_pythonnote.assets/image-20191228120800112.png)

```
Input: points = [[1,1],[3,4],[-1,0]]
Output: 7
Explanation: One optimal path is [1,1] -> [2,2] -> [3,3] -> [3,4] -> [2,3] -> [1,2] -> [0,1] -> [-1,0]   
Time from [1,1] to [3,4] = 3 seconds 
Time from [3,4] to [-1,0] = 4 seconds
Total time = 7 seconds
```

**Example 2:**

```
Input: points = [[3,2],[-2,2]]
Output: 5
```

 

**Constraints:**

- `points.length == n`
- `1 <= n <= 100`
- `points[i].length == 2`
- `-1000 <= points[i][0], points[i][1] <= 1000`



**Solution**

```python
class Solution:
    def minTimeToVisitAllPoints(self, points: List[List[int]]) -> int:
        count = 0
        for i in range(len(points)):
            if i+1 < len(points):
                count += max(abs(points[i][0]-points[i+1][0]),abs(points[i][1]-points[i+1][1]))
        return count
```

We can also discussion based on different situation, but this is not very convenient

```python
class Solution:
    def minTimeToVisitAllPoints(self, points: List[List[int]]) -> int:
        count = 0
        for i in range(len(points)):
            if i+1 < len(points):
                # 右上角
                while points[i][0] < points[i+1][0] and 
                points[i][1] < points[i+1][1]:
                    points[i][0] += 1
                    points[i][1] += 1
                    count += 1
                # 左下角
                while points[i][0] > points[i+1][0] and 
                points[i][1] > points[i+1][1]:
                    count += 1
                    points[i][0] -= 1
                    points[i][1] -= 1
                # 左上角
                while points[i][0] > points[i+1][0] and 
                points[i][1] < points[i+1][1]:
                    count += 1
                    points[i][0] -= 1
                    points[i][1] += 1
                # 右下角
                while points[i][0] < points[i+1][0] and 
                points[i][1] > points[i+1][1]:
                    count += 1
                    points[i][0] += 1
                    points[i][1] -= 1
                # 同一水平/垂直
                count += abs(points[i][0]-points[i+1][0]) + 
                abs(points[i][1]-points[i+1][1])
        return count
```

**Idea**

This question requires more observation and thinking. 

You should notice that the seconds you need equals to the max gap between two points ( x or y ).



Also `I+1` might exceed the index range, it's better to start from 1 and use `I-1` to represent the previous points coordinate. 