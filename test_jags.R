## Script to test JAGS

library(R2jags)

# Data
x <- rnorm(100, 2, 4)

# Model: R2jags allows us to specify model as an R function
model <- function() {
	for (i in 1:100) {
		x[i] ~ dnorm(mu, tau)
	}

	# Priors
	mu ~ dnorm(0, 0.001)
	sigma ~ dunif(0, 1000)
	tau <- pow(sigma, -2)
}

j.out <- jags(data=list(x=x), 
	model=model, 
	n.iter=10000, n.chains=3,
	parameters=c("mu","sigma"))
j.out