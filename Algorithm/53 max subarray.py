class Solution:
    def maxSubArray(nums):
        
        
        # solution: https://www.geeksforgeeks.org/largest-sum-contiguous-subarray/
        # buhui~~~
        # youtube https://www.youtube.com/watch?v=86CQq3pKSUw
        
        
        max_so_far = nums[0]
        max_ending_here = 0

        for i in range(0, len(nums)):
            max_ending_here = max_ending_here + nums[i]
            if (max_so_far < max_ending_here):
                max_so_far = max_ending_here

            if max_ending_here < 0:
                max_ending_here = 0  
        
        return max_so_far
    