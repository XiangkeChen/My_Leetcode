#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Jan  1 16:55:59 2020

@author: xiangkchen
"""

'''
Determine prime nunmber
Those whose factor are only itself and 1
'''

def prime_number(num):
    prime = True
    for i in range(2,num):
        if num % i == 0:
            prime = False
    if num == 2:
        prime = True
    return prime


