## --##--##--##--##--##--##--##--##--##--##--##--##--##--##
##   Functions related to the Chi Square distribution    ##
## --##--##--##--##--##--##--##--##--##--##--##--##--##--##

#' @title Random Truncated ChiSquare
#' @rdname rtrunc
#' @param df degrees of freedom for "parent" distribution
#' @importFrom stats dchisq pchisq rchisq
rtrunc.chisq <- function(n, df, a, b) {
	y <- rchisq(n, df)
	if (!missing(a)) {
		y <- y[y >= a]
	}
	if (!missing(b)) {
		y <- y[y <= b]
	} else {
		b <- Inf
	}
	class(y) <- "rtrunc-chisq"
	return(y)
}

density.trunc.chisq <- function(y, eta, a = 0, b) {
	df <- natural2parameters.chisq(eta)
	dens <- ifelse((y <= a) | (y > b), 0, dchisq(y, df=df))
	if (!missing(a)) {
	  F.a <- pchisq(a, parm) # FIXME: parm is not defined
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
	return(mean(y))
}

sufficient.T.chisq <- function(y) {
	return(suff.T = log(y))
}

average.T.chisq <- function(y) {
	return(mean(y))
}

natural2parameters.chisq <- function(eta) {
	# eta: The natural parameters in a Chi Square distribution
	# returns df
	return(c(parms = 2*(eta+1)))
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
	mean <- mean(y, na.rm = T)
	var.y <- var(y, na.rm = T)
	lo <- max(round(y.min), 0)
	hi <- min(y.max, round(mean + 10 * sqrt(var.y)))
	return(	return(seq(lo, hi, length = n))
)
}
