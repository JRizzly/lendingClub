import csv 
import re
import os
import operator
import glob
import sys
import math
import re
from textstat.textstat import textstat


class Loan_Vector:
    #Quatitative Data for Vectors
    id = 0
    loan_amount = 0
    term = 0
    int_rate = 0
    installment = 0
    #sub grade is 0 to 35 with A1,A2, A3, A4,A5, B1...
    sub_grade = ''
    emp_length = 0
    #Home ownership 0 = rent, 1 = mortgage, 2 = own 
    home_ownership = ''
    annual_income = 0
    #verified 0 is no, 1 is yes
    verification_status =''
    #fully paid: 0 is no, 1 is yes
    loan_status  = ''
    #purpose will come back to this
    #purpose = 0
    dti = 0
    fico_low = 0
    fico_high = 0
    number_inq_last_6months = 0
    #description length
    #desc_length = 0

    def set_Values(self, data):
        #Quatitative Data for Vectors
        self.id = data[0]
        self.loan_amount = data[1]
        self.term = data[2]
        self.int_rate = data[3]
        self.installment = data[4]
        #sub grade is 0 to 35 with A1,A2, A3, A4,A5, B1...
        self.sub_grade = data[5]
        self.emp_length = data[6]
        #Home ownership 0 = rent, 1 = mortgage, 2 = own 
        self.home_ownership = data[7]
        self.annual_income = data[8]
        #verified 0 is no, 1 is yes
        self.verification_status = data[9]
        #fully paid: 0 is no, 1 is yes
        self.loan_status  = data[10]
        #purpose will come back to this
        #purpose = 0
        self.dti = data[11]
        self.fico_low = data[12]
        self.fico_high = data[13]
        self.number_inq_last_6months = data[14]
        #description length
        #desc_length = 0
    
        #string Like data will come to this later
        #description = 'xx'
        #state = 'xx'
    
    def print_vector(self):
        print "Id: " + str(self.id)
        print "Loan Amount: " + str(self.loan_amount)
        print "Term: " + str(self.term)
        print "Interest Rate: " + str(self.int_rate)
        print "Monthly Installment: " + str(self.installment)
        print "Loan Grade: " + str(self.sub_grade)
        print "Employment Length: " + str(self.emp_length)
        print "Home Ownership Status: " + str(self.home_ownership)
        print "Annual Income: " + str(self.annual_income)
        print "Income Verified?: " + str(self.verification_status)
        print "Fully Paid?: " + str(self.loan_status)
        print "Debt to Income Ratio: " + str(self.dti)
        print "Fico Score Lower: " + str(self.fico_low)
        print "Fico Score Higher: " + str(self.fico_high)
        print "Times Credit Pulled (6months): " + str(self.number_inq_last_6months)
        print 
    
def file_to_memory(filename):
    list_of_loan_vectors = []
    with open(filename, 'r') as csvfile:
        header = next(csvfile)
        header = next(csvfile)
        
        header = header.split(',')

        columns_we_want =['id', 'loan_amnt', 'term', 'int_rate', 'installment', 'sub_grade', 'emp_length', 'home_ownership', 'annual_inc', 'verification_status', 'loan_status', 'dti', 'fico_range_low', 'fico_range_high', 'inq_last_6mths']
        c_w_w_nums = []                         
        
        for i in range(0, len(header)):
            if (header[i] in columns_we_want):
                c_w_w_nums.append(i)
        for row in csvfile:
            Loan_Vec = Loan_Vector()

            #Pulling out description by quotes because it has commas in it and messes up things
            #row = row.replace('"', '&')
            #row = row.replace("'", '&')
            description = re.findall( '"(.*?)"' , row)            
            replaced = re.sub('"(.*?)"', 'xxxxx', row)

            row_list = replaced.split(',')
            data = []
            for j in range(0, len(c_w_w_nums)):
                data.append(row_list[c_w_w_nums[j]])
            Loan_Vec.set_Values(data)
            list_of_loan_vectors.append(Loan_Vec)
                
    for i in range(0, len(list_of_loan_vectors)):
        list_of_loan_vectors[i].print_vector()

    
    
def initial_function(filename):
    loan_status = 'Fully Paid'
    with open(filename, 'r') as csvfile, open('output.csv', 'w') as output:
        header1 = next(csvfile)
        output.write(header1)
        header2 = next(csvfile)
        output.write(header2)
        critString = list(header2)
        print "Types of Loan Criteria" + header2.replace(',', '\n')
        
        
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
        

'''
#when we do analysis of the loans reading level

test_data1 = "Research in topology per se is currently concentrated to a large extent on the study of manifolds in low dimensions. Topics of interest include knot theory, 3- and 4-dimensional manifolds, and manifolds with other structures such as symplectic 4-manifolds, contact 3-manifolds, hyperbolic 3-manifolds. Research problems are often motivated by parts of theoretical physics, and are related to geometric group theory, topological quantum field theories, gauge theory and Seiberg-Witten theory, and higher dimensional topology."

print "flesch"
print textstat.flesch_reading_ease(test_data1)
print "smog"
print textstat.smog_index(test_data1)
print "flesch_kincaid"
print textstat.flesch_kincaid_grade(test_data1)
print textstat.coleman_liau_index(test_data1)
print textstat.automated_readability_index(test_data1)
print textstat.dale_chall_readability_score(test_data1)
print "difficult words"
print textstat.difficult_words(test_data1)
print textstat.linsear_write_formula(test_data1)
print textstat.gunning_fog(test_data1)
print "text standard"
print textstat.text_standard(test_data1)

'''


#Starging here!!!

#initial_function('2007-2011-Data.csv')

loan_vector_list = file_to_memory('2007-2011-Data.csv')















