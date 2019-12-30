#### Leetcode Algorithm 771

**Question**

You're given strings `J` representing the types of stones that are jewels, and `S` representing the stones you have. Each character in `S` is a type of stone you have. You want to know how many of the stones you have are also jewels.

The letters in `J` are guaranteed distinct, and all characters in `J` and `S` are letters. Letters are case sensitive, so `"a"` is considered a different type of stone from `"A"`.

**Example 1:**

```
Input: J = "aA", S = "aAAbbbb"
Output: 3
```

**Example 2:**

```
Input: J = "z", S = "ZZ"
Output: 0
```

**Note:**

- `S` and `J` will consist of letters and have length at most 50.
- The characters in `J` are distinct.

**Solution**

```python
class Solution:
    def numJewelsInStones(self, J: str, S: str) -> int:
        return sum(1 for s in S if s in J)
```



```python
def numJewelsInStones(self, J, S):
  return sum(map(S.count, J))    
```

**Idea**

How to use `map` function : https://www.runoob.com/python/python-func-map.html

map(a function, a iterable)

Also, there is a solution I don't familiar in the discussion forum.

You can count the frequency of the element in a list/dict, you can't do this is a dict

Attached the picture.

![image-20191227181520868](00_PythonNote.assets/image-20191227181520868.png)

