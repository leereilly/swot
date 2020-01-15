#!/usr/bin/python3
import re
import sys

for line in sys.stdin:
    s = line.split('.')
    s.reverse()
    str=''
    for a in s:
        a = re.sub('\n$','',a)
        str = str + a + '/'
    str = re.sub('\/$','.',str)
    str = str + 'txt'
    str = 'git rm lib/domains/' + str
    print(str)
