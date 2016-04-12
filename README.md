# Lending Club

##Project for looking at lending Club data 

###Proposal
Our tool is to allow users to make better loan decisions in the peer­to­peer lending market! It would work by allowing the user to select different criteria for clustering the data of loan types. This tool will provide the user with the loan options that have the highest rate of return from the filters or criteria they have selected. Currently we have implemented a Cosign similarity algorithm to search for similar loans to the data that is entered. However, later on we will implement a KNN algorithm over that to determine if a lenders desiered loan will be a good investment or a bad one. 


###Data Checkpoint
We have collected the peer to peer lending data from LendingClub.com. While they do not offer an API, they do have logs of all pervious and ongoing loan data available for signed up “investors”. Overall, each year is amounts to roughly 30MB of collected data. There are over 120 collected criteria available for us to mine. After inspecting the data, we have decided to omit data from beyond 2011 so that we don’t inspect loans that have not had a chance to be repaid. Had we collected data from 2011, charge offs and defaults would have represented a higher weight in the overall collection. Please check our google group conversation at https://groups.google.com/forum/#!topic/csce470-spring2016/_PpSaNKXGe8 for a full description 


###How to compile (Algorithm Checkpoint)

To compile this code please download all of the files in this git hub. Then run the command python al
