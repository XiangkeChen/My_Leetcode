#### Leetcode algorithm 1299

**question**

Given an array `arr`, replace every element in that array with the greatest element among the elements to its right, and replace the last element with `-1`.

After doing so, return the array.

 

**Example 1:**

```
Input: arr = [17,18,5,4,6,1]
Output: [18,6,6,6,1,-1]
```

 

**Constraints:**

- `1 <= arr.length <= 10^4`
- `1 <= arr[i] <= 10^5`



**Solution**

As a non-Cs student, it's hard for me to come up with efficient approach. I tried three solutions but end up time exceeded...

```python
class Solution:
def replaceElements(self, arr: List[int]) -> List[int]:
    for i in range(len(arr)):
        large = -1
        for j in range(i+1,len(arr)):
            if arr[j] > large:
                large = arr[j]
        arr[i] = large
    arr[-1] = -1
    return arr
```



```python
# solution2
class Solution:
    def replaceElements(self, arr: List[int]) -> List[int]:
        arr2 = arr.copy()[1:]
        for i in range(len(arr)):
            if arr2 != []:
                large = max(arr2)
                arr[i] = large
                arr2.pop(0)
        arr[-1] = -1
        return arr
```



```python
solution3
still exceed time, considering loop from right side
class Solution:
    def replaceElements(self, arr: List[int]) -> List[int]:
        arr2 = []
        arr = arr[1:]
        for i in range(0,len(arr)):
            arr2.append(max(arr))
            arr.pop(0)
        arr2.append(-1)
        return arr2   
```



The below solution is copied from discussion forum

```python
class Solution(object):
    def replaceElements(self, arr):
        """
        :type arr: List[int]
        :rtype: List[int]
        """
        newarr= [-1]
        arr.reverse()
        for i in range(0,len(arr)-1):
            max_ = newarr[i]
            if arr[i]> max_:
                max_ = arr[i]
            newarr.append(max_)
        newarr.reverse()
        return newarr
```



**Idea**

- Learn how to use `reverse()` function for list,

- Learn `pop()` function, pop will default remove the last element in a list unless you specify the index 
- For each loop, I calculated the `max` and compare multiple times, this might be the reason that I exceeded the time limit 