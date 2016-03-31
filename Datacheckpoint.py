import csv 
import re
import os
import operator
import glob
import sys
import math


loan_status = 'Fully Paid'


with open('2007-2011-Data.csv', 'r') as csvfile, open('output.csv', 'w') as output:
    header1 = next(csvfile)
    output.write(header1)
    header2 = next(csvfile)
    output.write(header2)
    print "Criteria to filter by" + str(header2)
    
    k = len(header2)
    i = 0
    j= 0
    example = []
    for row in csvfile:
        i = i + 1
        if (row.find('Fully Paid') <> -1):
            output.write(row)
            j = j+1
            
    print "Total Number of Loans: " + str(i)
    print "Fully Paid Loans: " + str(j)
    print "Number of available types of criteria: " + str(26)
    
    





