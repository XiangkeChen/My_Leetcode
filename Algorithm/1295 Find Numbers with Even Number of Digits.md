#### Leetcode Algorithm 1295

**Question**

Given an array `nums` of integers, return how many of them contain an **even number** of digits.

 

**Example 1:**

```
Input: nums = [12,345,2,6,7896]
Output: 2
Explanation: 
12 contains 2 digits (even number of digits). 
345 contains 3 digits (odd number of digits). 
2 contains 1 digit (odd number of digits). 
6 contains 1 digit (odd number of digits). 
7896 contains 4 digits (even number of digits). 
Therefore only 12 and 7896 contain an even number of digits.
```

**Example 2:**

```
Input: nums = [555,901,482,1771]
Output: 1 
Explanation: 
Only 1771 contains an even number of digits.
```

 

**Constraints:**

- `1 <= nums.length <= 500`
- `1 <= nums[i] <= 10^5`

**Solution**

```python
class Solution:
    def findNumbers(self, nums: List[int]) -> int:
        count = 0 
        for num in nums:
            # number的length要怎么统计呢，我的想法是把number变成string先，就可以用len()
            if len(str(num)) % 2 == 0:
                count += 1
        return count
```



```python
def findNumbers(self, nums: List[int]) -> int:
  	# only when len(str(num)) == 2, we will count 1
    return sum(len(str(n)) % 2 == 0 for n in nums) 
```

**Idea**

You should pay attention to the usage of func `len`().

If you want to calculate the length of the number, you can't use `len` directly. One good approach is to convert the number to string first, and then use `len()`