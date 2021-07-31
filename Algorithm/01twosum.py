
# TWO SUM


def two_sum(nums, target) :


    d = {}
    for i, num in enumerate(nums):
        b = target - num
            # print(i,b,num)
        if num in d:
            print(d[num],i)
        else:
            d[b] = i
          # print(d)

two_sum([2,5,5,11],10)