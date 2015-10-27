#Description####
#HarvardX: PH525.1x Data Analysis for Life Sciences 1: Statistics and R
#
#Central Limit Theorem
#
#recommended 
#install.packages("devtools")
#library(devtools)
#install_github("genomicsclass/dagdata")

library(downloader) 
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleControlsPopulation.csv"
filename <- basename(url)
download(url, destfile=filename)
x <- unlist( read.csv(filename) )

"
Here x represents the weights for the entire population.

Using the same process as before (in Null Distribution Exercises), set the seed at 1, 
then using a for-loop take a random sample of 5 mice 1,000 times. 
Save these averages.
"

set.seed(1)

n = 10000
averages5 <- vector("numeric", n)
for( i in 1:n){
  X <- sample (x, 5)
  averages5[i] <- mean(X)
}

hist(averages5)


"
After that, set the seed at 1, then using a for-loop take a random 
sample of 50 mice 1,000 times. Save these averages.
"
set.seed(1)

n = 10000
averages50 <- vector("numeric", n)
for( i in 1:n){
  X <- sample (x, 50)
  averages50[i] <- mean(X)
}

hist(averages50)

"NORMAL DISTRIBUTION EXERCISES #2  
For the last set of averages, the ones obtained from a sample size of 50, 
what proportion are between 23 and 25?
"

mean(averages50 < 25) - mean(averages50 < 23)

#NORMAL DISTRIBUTION EXERCISES #3  (1 point possible)
#Now ask the same question of a normal distribution with average 23.9 and standard deviation 0.43.

x_ND <- rnorm(10000, mean = 23.9, sd = 0.43)
hist(x_ND)

mean(x_ND < 25) - mean(x_ND < 23)

#Correct answer
pnorm( (25-23.9) / 0.43)  - pnorm( (23-23.9) / 0.43) 
