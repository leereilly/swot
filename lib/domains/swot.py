#!/usr/bin/python3
import re
import sys

for line in sys.stdin:
    s = line.split('/')
    length = len(s)-1
    res = ''
    for i in range(0,length):
        item = s[length-i]
        item = re.sub('.txt$','',item)
        item = re.sub('\n','',item)
        res = res + item 
        if i < length-1:
           res = res + '.'
    print(res)

