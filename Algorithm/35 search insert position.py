



def searchInsert(nums, target):

	# print(nums)

		# my solution 
        if target not in nums:
            nums.append(target)
            nums.sort()
            # print(nums)

        # solution 0 
        # for n in range(len(nums)):
        #     if nums[n] == target:
        #         return n
        
        return nums.index(target)

        
        # linear search  优秀 solution2
        if not nums:
            return 0
        
        for i, num in enumerate(nums):
            if num >= target:
                return i
        
        return len(nums)


searchInsert([1,3,5,6],5)
# searchInsert([],4)