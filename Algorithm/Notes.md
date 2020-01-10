# Contents

-----

- [Review](#review)
  * [Format Output](#format-output)
  * [Read / Load files](#read---load-files)
  * [Data Structure](#data-structure)
  * [Metrics Calculation](#metrics-calculation)
  * [Functions Reminders](#functions-reminders)
  * [经典习题](#----)
  * [是不是闰年 leap year](#------leap-year)

# Review

## Format Output

- how to format numbers in print

```python
print('{0:4d} {1:8.1f} {2:5.2f}'.format(year, qty, price))
```

- 输出右对齐

format 函数里面可以规定空几个格子
![image-20191220203120442](00_PythonNote.assets/image-20191220203120442.png)

```python
print('{0:4d} {1:11.1f}'.format(i,initial)) 
```



- make user input a literal

default input is a string, unless we specify int() or float() in front of the function

```python
input = input('Enter your input')
```



- Two types of division:
  - / operator performs **floating point division** 
  
    `4/2` = 2.0
  
  -  // operator performs **integer division** 
    
    `4//2` = 2
    
    -  Positive results truncated, negative rounded away from zero



- Conversion between letters and numbers

- ord()  change char to a number

- chr() change number to a character

```python
ord('C')
Out[139]: 67

chr(67)
Out[140]: 'C'
```



## Read / Load files

- 读取文件 with open

`open()`  
`with open(data, 'r') as f` 
区别主要是with相当于open的 try except finally 版本 在有error的情况下能够smooth的运行
`csv_reader` 可以直接把每一行按照comma来separate 你就不需要用split函数了

```python
def state_for_senator(file,name):
    result = ''
    with open(file,'r') as f:
      # 替换成 for line in csv.reader(f):
        for line in f: 
            line = line.split(',')
            if line[0].lower() == name.lower():
                result = line[1]
                
    return result
```

`list(f)`

You can read the whole file at one by using `l = list(f)`, However, you will also include the new line characters. 

## Data Structure

### List

- List Comprehension

```python
# case 1
for n in vals:
    if type(n) == int:
        squared_ints.append(n * n)
        
squared_ints = [n * n for n in vals if type(n) == int ]

# case 2
# 这个很神奇啊 list comprehension里面，如果只有if写后面 有if else 写前面
x = [i if i % 2 == 0 else 1 for i in range(10)]

# case 2
for row in matrix:
    for n in row:
        flattened.append(n)

flattened = [n for row in matrix for n in row]
```

要注意的是如果有if else的判断语句 逻辑顺序是 if -> for -> else 

-  `Append`

  a.append(3) ☑️

  a = a.append(3) ❌
  
-  `Sort`

   a_list.sort(*, key = None, reverse = False)

   This is inplace sort, no need to write `a = a.sort()`, if you want to sort descending, just `reverse=False`

   

### Dictionary

- Sort Dict by Value [link](https://stackoverflow.com/questions/613183/how-do-i-sort-a-dictionary-by-value)

  Return a <u>list</u> rather than a dict

  ```python
  x = {1: 2, 3: 4, 4: 3, 2: 1, 0: 0}
  # ascending
  sorted_x = sorted(x.items(), key=lambda kv: kv[1])
  # descending
  sorted_x = sorted(x.items(), key=lambda kv: -1 * kv[1])
  ```

- Sort dict by key

  ```python
  keylist = mydict.keys()
  keylist.sort()
  for key in keylist:
      print "%s: %s" % (key, mydict[key])
  ```

  

- **Get()**

  This function is really useful and you can use it to get the frequency of the key

  ```python
  fre[key] = fre.get(key,0) + 1
  ```

  



## Metrics Calculation

- MAE Calculation

```python
# 一个算mae的例子
import numpy as np

x = [5,6,7,8,9]
y_a = [xi * 5 + 40 for xi in x]
y_i = [45,76,78,87,79]

error = []
for i in range(5):
    error.append(abs(y_a[i]-y_i[i]))

np.average(error)
```



## Functions Reminders

- **Splits(sep = None, Maxsplit = -1)**

  Default `sep = None` which refers to whitespace including tab, space, \n signs

- **Sum()**

  Sum can be used for merging **nested list**. Only nested list, single list cannot be summed

  Say if L is a nested list, we can create a new list by

  ```
  L2 = sum(L,[])
  ```

- **Len()**

  计算字符串长度。如果想要算数字长度，1 ， 23， 43214，是几位数，可以len(str(num))

- **Map()** [Link](https://www.runoob.com/python/python-func-map.html)

- **Reverse()**

  `list(reverse(a_list))` can return the reversed list, or you can use `a_list.reverse()`

- **Join()**

  `''.join(a_list)` can concat the element in the list. This cannot be a nested list. If you want to concat the elements in the nested list, you can use `sum()` first, and then `''.join()`

- **Sort()**

  - [How to sort a list based on another list?](https://stackoverflow.com/questions/6618515/sorting-list-based-on-values-from-another-list)

    ```python
    # using numpy argsort()
    people = np.array(['Jim', 'Pam', 'Micheal', 'Dwight'])
    ages = np.array([27, 25, 4, 9])
    sortedPeople = people[ages.argsort()]
    
    # using basic list sort function, combined with function zip()
    X = ["a", "b", "c", "d", "e", "f", "g", "h", "i"]
    Y = [ 0,   1,   1,    0,   1,   2,   2,   0,   1]
    
    Z = [x for y,x in sorted(zip(Y,X))]
    print(Z)  # ["a", "d", "h", "b", "c", "e", "i", "f", "g"]
    ```

  - [Sort a string with a number inside a python](https://www.tutorialspoint.com/How-to-correctly-sort-a-string-with-a-number-inside-in-Python)

    This type of sort in which you want to sort on the basis of numbers within string is called natural sort or human sort. For example, if you have the text:

    ```
    ['Hello1','Hello12', 'Hello29', 'Hello2', 'Hello17', 'Hello25']
    ```

     Then you want the sorted list to be:

    ```
    ['Hello1', 'Hello2','Hello12', 'Hello17', 'Hello25', 'Hello29']
    ```

     and not:

    ```
    ['Hello1','Hello12', 'Hello17', 'Hello2', 'Hello25', 'Hello29']
    ```

     To do this we can use the extra parameter that sort() uses. This is a function that is called to calculate the key from the entry in the list. We use regex to extract the number from the string and sort on both text and number. 

    ```python
    import re
    def atoi(text):
      return int(text) if text.isdigit() else text
    def natural_keys(text):
      return [ atoi(c) for c in re.split('(\d+)',text) ]
    my_list =['Hello1', 'Hello12', 'Hello29', 'Hello2', 'Hello17', 'Hello25']
    my_list.sort(key=natural_keys)
    print my_list
    ```

     This will give you the output:

    ```python
    ['Hello1','Hello2', 'Hello12', 'Hello17', 'Hello25', 'Hello29']
    ```


    The shorten version is that 

    ```python
    def stringSplitByNumbers(x):
        r = re.compile('(\d+)')
        l = r.split(x)
        return [int(y) if y.isdigit() else y for y in l]
    ```

  - Sort by a function

    `Sorted_list = my_list.sort(key = function_name)`

    i.e

    ```python
    a = ['asd','dasd','ds','feadsf']
    a.sort(key = len, reverse = False)
    a
    # ['ds', 'asd', 'dasd', 'feadsf']
    ```

    - Functions like `max`, `Len`, `min` all can be used here

# Class 

**Tips**

- It's not necessary to have `__init__` function

- `__str__` function , return the content you want to print , 

  ```python
  def __str__(self):
  	return "the content you want to print"
  ```

  



# Classical Questions

## Leap year

参考解法一 – 分段排除：
如果a % 4 ! = 0，则a不是闰年；
否则如果a % 100 == 0 && a % 400 != 0，则a不是闰年；
否则a是闰年。

参考解法二 – 列出所有闰年的可能条件，满足条件则为闰年，否则判为非闰年：
如果 (a % 400 == 0 || (a % 4 == 0 && a % 100 != 0)),  则a是闰年；否则 a不是闰年。

```python
yr = int(input('Enter year: '))
flag = True

# if this is leap year
if yr % 4 != 0:
    flag = False
elif yr % 100 == 0 and yr % 400 != 0:
    flag = False
    
if flag == True:
    print('{0:4d} is a leap year'.format(yr))
else:
    print('{0:4d} is not a leap year'.format(yr))
```



## Factor (Prime Number)

Find the factors of the input number 

```python
def factor_num(number):
    l = []
    for i in range(1,number+1):
        if number % i == 0:
            l.append(i)
    return l
```

Loop all the numbers and append those qualified of factors 

If you want to **Factorial**, just multiply them all

If you are asked to determine the prime number, you only need to change a little bit

```python
def prime_number(num):
    prime = True
    for i in range(2,num):
        if num % i == 0:
            prime = False
    if num == 2:
        prime = True
    return prime
```



**Private Variable**

`self.__val` with underline is private variable 



## Calculate the Area of a Triangle

If a, b and c are three sides of a triangle. Then,

```
s = (a+b+c)/2
area = √(s(s-a)*(s-b)*(s-c))
```



```python
# calculate the semi-perimeter
s = (a + b + c) / 2
# calculate the area
area = (s*(s-a)*(s-b)*(s-c)) ** 0.5
print('The area of the triangle is %0.2f' %area)
```



## Generate Random Number

**INTEGER**

```python
import random
# take 2 arguments
random.randint(start,end)
```

**DECIMAL**

```python
import random
# take no argument
random.ranom()
```



## Delete one letter in the word

f[]



# Some Knowledge

## Convert Celsius To Fahrenheit

```python
celsius * 1.8 = fahrenheit - 32
```

