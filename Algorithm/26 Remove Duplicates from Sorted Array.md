### Leetcode Algorithm 27

**Question**

Given a sorted array *nums*, remove the duplicates [**in-place**](https://en.wikipedia.org/wiki/In-place_algorithm) such that each element appear only *once* and return the new length.

Do not allocate extra space for another array, you must do this by **modifying the input array [in-place](https://en.wikipedia.org/wiki/In-place_algorithm)** with O(1) extra memory.

**Example 1:**

```
Given nums = [1,1,2],

Your function should return length = 2, with the first two elements of nums being 1 and 2 respectively.

It doesn't matter what you leave beyond the returned length.
```

**Example 2:**

```
Given nums = [0,0,1,1,1,2,2,3,3,4],

Your function should return length = 5, with the first five elements of nums being modified to 0, 1, 2, 3, and 4 respectively.

It doesn't matter what values are set beyond the returned length.
```

**Clarification:**

Confused why the returned value is an integer but your answer is an array?

Note that the input array is passed in by **reference**, which means modification to the input array will be known to the caller as well.

Internally you can think of this:

```
// nums is passed in by reference. (i.e., without making a copy)
int len = removeDuplicates(nums);

// any modification to nums in your function would be known by the caller.
// using the length returned by your function, it prints the first len elements.
for (int i = 0; i < len; i++) {
    print(nums[i]);
}
```

**Solution**

```python
class Solution:
    def removeDuplicates(self, nums: List[int]) -> int:
        prev = float("inf")
        for num in reversed(nums):
            if num == prev:
                nums.remove(num)
            prev = num
        return len(nums)
```

This problem should be aware of the usage of `remove` I don't why , you cannot use `remove` in for loop unless you reverse the list at the beginning. 

The reason behind this is that python iterate the list in sequence. If i == 3 and you remove an element, the total length of the array reduce 1, it will starts from i = 4 (which is originally i=5) so it will **skip an element.**



-------

Question 27 is similar idea here

Given an array *nums* and a value *val*, remove all instances of that value [**in-place**](https://en.wikipedia.org/wiki/In-place_algorithm) and return the new length.

Do not allocate extra space for another array, you must do this by **modifying the input array [in-place](https://en.wikipedia.org/wiki/In-place_algorithm)** with O(1) extra memory.

The order of elements can be changed. It doesn't matter what you leave beyond the new length.

**Example 1:**

```
Given nums = [3,2,2,3], val = 3,

Your function should return length = 2, with the first two elements of nums being 2.

It doesn't matter what you leave beyond the returned length.
```

**Example 2:**

```
Given nums = [0,1,2,2,3,0,4,2], val = 2,

Your function should return length = 5, with the first five elements of nums containing 0, 1, 3, 0, and 4.

Note that the order of those five elements can be arbitrary.

It doesn't matter what values are set beyond the returned length.
```

**Solution**

```python
class Solution:
    def removeElement(self, nums: List[int], val: int) -> int:
        for num in reversed(nums):
            if num == val:
                nums.remove(num)
        return len(nums)
```

[Extra Link](https://sopython.com/canon/95/removing-items-from-a-list-while-iterating-over-the-list/)