## --##--##--##--##--##--##--##--##--##--##--##--##--##--##
##   Functions related to the Chi Square distribution    ##
## --##--##--##--##--##--##--##--##--##--##--##--##--##--##
 
# Inserted line

density.trunc.chisq <- function(y, eta, a = 0, b) {
	parm <- 2(eta+1)
	dens <- ifelse((y <= a) | (y > b), 0, dchisq(y, parm))
	if (!missing(a)) {
	  F.a <- pchisq(a, parm)
	} else {
		F.a <- 0
	}
	if (!missing(b)) {
		F.b <- pchisq(b, parm)
	} else {
		F.b <- 1
	}
	return(dens / (F.b - F.a))
}

init.parms.chisq <- function(y) {
	# Returns empirical parameter estimate for df
	parm <- mean(y)
}

sufficient.T.chisq <- function(y) {
	return(suff.T = log(y))
}

average.T.chisq <- function(y) {
	return(mean(y))
}

#density.chisq <- function(y, eta) {
#	parms <- 2*(eta+1)
#	dchisq(y, parms)
#}

natural2parameters.chisq <- function(eta) {
	# eta: The natural parameters in a Chi Square distribution
	# returns (mu,sigma)
	return(c(df = 2*(eta+1)))
}

parameters2natural.chisq <- function(parms) {
	# parms: The parameter lambda in a Chi Square distribution
	# returns the natural parameters
	return(eta = parms/2-1)
}

get.grad.E.T.inv.chisq <- function(eta) {
	# eta: Natural parameter
	# return the inverse of E.T differentiated with respect to eta
	return(A = 1/sum(1/(eta+(1:1000000))^2))
}

get.y.seq.chisq <- function(y, y.min = 0, y.max, n = 100) {
	mu <- mean(y, na.rm = T)
	var.y <- var(y, na.rm = T)
	lo <- max(round(y.min), 0)
	hi <- min(y.max, round(mu + 10 * sqrt(var.y)))
	return(	return(seq(lo, hi, length = n))
)
}