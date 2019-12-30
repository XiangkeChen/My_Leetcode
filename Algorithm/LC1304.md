**Question**

Given an integer `n`, return **any** array containing `n` **unique** integers such that they add up to 0.

**Example 1:**

```
Input: n = 5
Output: [-7,-1,1,3,4]
Explanation: These arrays also are accepted [-5,-1,1,2,3] , [-3,-1,2,-2,4].
```

**Example 2:**

```
Input: n = 3
Output: [-1,0,1]
```

**Example 3:**

```
Input: n = 1
Output: [0]
```

 **Constraints:**

- `1 <= n <= 1000`

**Solution**

```python
class Solution:
    def sumZero(self, n: int) -> List[int]:
        l = []
        count = 1
        if n % 2 != 0:
            l.append(0)
        while count <= n/2:
            l.append(count)
            l.append(-count)
            count += 1
        return l
```

**Idea**

The idea here is to create a list that centered as 0