# Data
x <- 45
n <- 50

# Assumptions
# The likelihood assumption: x ~ Binomial(theta) where theta is probability of success
# Hence, L(theta|x) = nCx theta^(x) (1-theta)^(n-x) = dbinom(x,n,theta)
# The prior assumption: p(theta) = 1 if theta > 0.5 else p(theta) = 0

# Choosing 10000 values of theta between 0 and 1
theta <- seq(from=0,to=1,length=10000)

# Computing likelihood for each value
likelihood <- dbinom(x=45,size=50,prob = theta)
plot(theta,likelihood)

# Computing prior for each value
prior <- ifelse(theta<0.5,0,1)
plot(theta,prior)

# Computing approx. marginal likelihood as SUM(prior*likelihood)
ML <- sum(likelihood*prior)

# Calculate posterior density corresponding to each value of theta
posterior <- (likelihood*prior)/ML
plot(theta,posterior)

# Draw likelihood, prior and posterior above each other
dat <- data.frame(theta=theta,likelihood=likelihood,
                  prior=prior,posterior=posterior)
library(reshape2)
dat.m <- melt(dat,id=("theta"))
library(ggplot2)
ggplot(dat.m,aes(x=theta,y=value,group=variable,color=variable))+
  geom_point()+facet_wrap(~variable,scales="free",nrow=3)

##################################
# Highly informative prior

# Data
x <- 45
n <- 50

# Assumptions
# The likelihood assumption: x ~ Binomial(theta) where theta is probability of success
# Hence, L(theta|x) = nCx theta^(x) (1-theta)^(n-x) = dbinom(x,n,theta)
# The prior assumption: theta ~ Beta(80,20)

# Choosing 10000 values of theta between 0 and 1
theta <- seq(from=0,to=1,length=10000)

# Computing likelihood for each value
likelihood <- dbinom(x=45,size=50,prob = theta)
plot(theta,likelihood)

# Computing prior for each value
prior <- dbeta(theta,80,20)
plot(theta,prior)

# Computing approx. marginal likelihood as SUM(prior*likelihood)
ML <- sum(likelihood*prior)

# Calculate posterior density corresponding to each value of theta
posterior <- (likelihood*prior)/ML
plot(theta,posterior)

# Draw likelihood, prior and posterior above each other
dat <- data.frame(theta=theta,likelihood=likelihood,
                  prior=prior,posterior=posterior)
library(reshape2)
dat.m <- melt(dat,id=("theta"))
library(ggplot2)
ggplot(dat.m,aes(x=theta,y=value,group=variable,color=variable))+
  geom_point()+facet_wrap(~variable,scales="free",nrow=3)

##################################





###########################
# Data: 350, 300, 200
# Likelihood assumption:
# x_ì ~ Normal(mu,sigma)
# Prior assumptions:
# sigma=40
# mu ~ Normal(350,25)

# Choose a lot of equidistant values of mu
mu <- seq(from=0,to=500,length=10000)
sigma <- 40               
x <- rnorm(100,220,40)    # data

# We need to calculate likelihood corresponding
# to each value of mu

# Creating an empty likelihood vector
Likelihood <- rep(NA,10000)

# Calculate the joint likelihood of observing 
# c(350,300,200) from a particular value of mu
for(i in 1:length(mu)){
  Likelihood[i] <- prod(dnorm(x=x,mean=mu[i],sd=sigma))
}
Likelihood 

plot(mu,Likelihood)

# Calculate prior densities correspoding to each mu
prior <- dnorm(mu,mean=350,sd=25)
plot(mu,prior)


unormalized_posterior <- Likelihood*prior
plot(mu,unormalized_posterior)

ML <- sum(Likelihood*prior)
posterior <- unormalized_posterior/ML
plot(mu,posterior)



# Plot all of them together
df.post <- data.frame(mu=mu,Prior=prior,
                      Likelihood=Likelihood,
                      Posterior=posterior)

head(df.post)

library(reshape2)
df.post.m <- melt(df.post,id=c("mu"))
head(df.post.m)

library(ggplot2)
ggplot(df.post.m,aes(x=mu,y=value,group=variable))+
  geom_point()+geom_line()+
  theme_bw()+
  facet_wrap(~variable,scales = "free_y",nrow = 3)

ggplot(df.post.m,aes(x=mu,y=value,group=variable))+
  geom_point()+geom_line()+
  theme_bw()+
  facet_wrap(~variable,scales = "free_y",nrow = 3)+
  scale_x_continuous(limits = c(100,500))


