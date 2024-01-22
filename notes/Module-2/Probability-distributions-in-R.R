
#######################################
# Binomial distribution
#######################################


## Probability density/value of obtaining x successes out of n bernoulli trials 

dbinom(x=74,size=100,prob=0.95)

## Probability of an event that the outcome occurs between 0 and q

pbinom(q=74,size=100,prob=0.95)

## Generate n random values for the random variable X 
## which has a Binomial distribution with underlying prob of success p

rbinom(n=10,size=100,prob=0.95)




#######################################
# Poisson distribution
#######################################


## Probability density/value of obtaining x occurrences of something given the underlying rate is lambda 

dpois(x=74,lambda=50)

## Probability of an event that the outcome occurs between 0 and q

ppois(q=74,lambda=50)

## Generate n random values for the random variable X 
## which has a Poisson distribution with underlying rate lambda

rpois(n=10,lambda=50)
rpois(n=10,lambda=0.3)

x <- rpois(n=10000,lambda=0.7)
hist(x,breaks=0:10)

x <- rpois(n=10000,lambda=1.7)
hist(x,breaks=0:10)

x <- rpois(n=10000,lambda=3.3)
hist(x,breaks=0:20)


#######################################
# Normal distribution
#######################################


## Probability density of obtaining a value x when the mean is 'mean' and standard deviation is 'sd'

dnorm(x=74,mean=50,sd=10)

## Probability of an event that the outcome occurs between 0 and q

pnorm(q=74,mean=50,sd=10)

## Generate n random values for the random variable X 
## which has a normal distribution

rnorm(n=5,mean=50,sd=10)
rnorm(n=5,mean=50,sd=20)
rnorm(n=5,mean=100,sd=10)

x <- rnorm(n=10000,mean=50,sd=10)
hist(x)

x <- rnorm(n=10000,mean=50,sd=20)
hist(x)

x <- rnorm(n=10000,mean=100,sd=10)
hist(x)


#######################################
# Beta distribution
#######################################

## Probability density of obtaining a value x when the shape1 parameter is alpha and shape2 parameter is 'beta'

dbeta(x=0.3,shape1 = 1,shape2 = 1)
dbeta(x=0.3,shape1 = 1,shape2 = 2)
dbeta(x=0.3,shape1 = 2,shape2 = 2)
dbeta(x=0.3,shape1 = 10,shape2 = 10)

## Probability of an event that the outcome occurs between 0 and q

pbeta(q=0.3,shape1 = 10,shape2 = 10)

## Generate n random values for the random variable X 
## which has a beta distribution

rbeta(n=5,shape1 = 2,shape2 = 2)
rbeta(n=5,shape1 = 20,shape2 = 20)
rbeta(n=5,shape1 = 200,shape2 = 200)

# MEAN: a/(a+b), MODE: (a-1)/(a+b-2)

x <- rbeta(n=10000,shape1=1,shape2=1)
hist(x)

x <- rbeta(n=10000,shape1=2,shape2=2)
hist(x)

x <- rbeta(n=10000,shape1=20,shape2=20)
hist(x)

x <- rbeta(n=10000,shape1=200,shape2=200)
hist(x)

x <- rbeta(n=10000,shape1=200,shape2=400)
hist(x)

x <- rbeta(n=10000,shape1=8,shape2=2)
hist(x)

p <- rbeta(n=10000,shape1=80,shape2=20)
hist(p)
