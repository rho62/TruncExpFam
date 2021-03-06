## --##--##--##--##--##--##--##--##--##--##--##--##--##--##
##   Functions related to the Chi Square distribution    ##
## --##--##--##--##--##--##--##--##--##--##--##--##--##--##

#' @importFrom stats dexp pexp
density.trunc.exp <- function(y, eta, a = 0, b) {
	rate <- natural2parameters.exp(eta)
	dens <- ifelse((y <= a) | (y > b), 0, dexp(y, rate=rate))
	if (!missing(a)) {
	  F.a <- pexp(a, rate)
	} else {
		F.a <- 0
	}
	if (!missing(b)) {
		F.b <- pexp(b, parm) # FIXME: parm is not defined
	} else {
		F.b <- 1
	}
	return(dens / (F.b - F.a))
}

init.parms.exp <- function(y) {
	# Returns empirical parameter estimate for the rate parameter
	return(mean(y))
}

sufficient.T.exp <- function(y) {
	return(suff.T = y)
}

average.T.exp <- function(y) {
	return(mean(y))
}

natural2parameters.exp <- function(eta) {
	# eta: The natural parameters in an exponential distribution distribution
	# returns rate
	return(c(lamda = -eta))
}

parameters2natural.exp <- function(parms) {
	# parms: The parameter lambda in an exponential distribution
	# returns the natural parameters
	return(eta = -parms)
}

get.grad.E.T.inv.exp <- function(eta) {
	# eta: Natural parameter
	# return the inverse of E.T differentiated with respect to eta
	return(A = eta^2)
}

get.y.seq.exp <- function(y, y.min = 0, y.max, n = 100) {
	mean <- mean(y, na.rm = T)
	var.y <- var(y, na.rm = T)
	lo <- max(round(y.min), 0)
	hi <- min(y.max, round(mean + 10 * sqrt(var.y)))
	return(	return(seq(lo, hi, length = n))
)
}
