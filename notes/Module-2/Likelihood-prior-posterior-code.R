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
dat.m <- melt(dat,id=("theta"))
library(ggplot2)
ggplot(dat.m,aes(x=theta,y=value,group=variable,color=variable))+
  geom_point()+facet_wrap(~variable,scales="free",nrow=3)
