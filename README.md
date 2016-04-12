# Lending Club

##Project for looking at lending Club data 

###Proposal
Our tool is to allow users to make better loan decisions in the peer­to­peer lending market! It would work by allowing the user to select different criteria for clustering the data of loan types. This tool will provide the user with the loan options that have the highest rate of return from the filters or criteria they have selected. Currently we have implemented a Cosign similarity algorithm to search for similar loans to the data that is entered. However, later on we will implement a KNN algorithm over that to determine if a lenders desiered loan will be a good investment or a bad one. 


###Data Checkpoint
We have collected the peer to peer lending data from LendingClub.com. While they do not offer an API, they do have logs of all pervious and ongoing loan data available for signed up “investors”. Overall, each year is amounts to roughly 30MB of collected data. There are over 120 collected criteria available for us to mine. After inspecting the data, we have decided to omit data from beyond 2011 so that we don’t inspect loans that have not had a chance to be repaid. Had we collected data from 2011, charge offs and defaults would have represented a higher weight in the overall collection. Please check our google group conversation at https://groups.google.com/forum/#!topic/csce470-spring2016/_PpSaNKXGe8 for a full description 


###How to compile (Algorithm Checkpoint)

To compile this code please download all of the files in this git hub. Then run the command: *python AlgorithmCheckPoint.py* This will use sample data generated in the program to compare the 4 sample loans to one another. The loans are compared using 7 seperate criteria criteria. These criteria are loan amount, interest rate, the monthly installment, the annual income of the borrower, the debt to income ratio, the borrower's Fico score, and how often the borrower's Fico score has been pulled. We are using sample data generated within the program since pulling data from the CSV file using python takes a large amount of time. However we will be using a web application via ruby on rails where we will port the majority of our code over to. The web application is located at https://github.com/JRizzly/lendingClub/tree/WebApp which can be run via cloud9 if you clone over the data into a work space there.

####Photo of algorithm in action:
![alt text] (https://github.com/JRizzly/lendingClub/blob/master/AlgorithmCheckPoint.png)
