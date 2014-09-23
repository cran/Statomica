\name{absTd}
\alias{d.absTd}
\alias{q.absTd}
\alias{p.absTd}
%\alias{stat.absTd}
\title{
Absolute Student t Distribution.
}
\description{
Density, distribution function and quantile function of the absolute t distribution.
}
\usage{
d.absTd(x, df, ncp = 0, ...)
p.absTd(q, df, ncp = 0, lower.tail = FALSE, ...)
q.absTd(p, df, ncp = 0, lower.tail = FALSE, ...)
}

\arguments{
  \item{x,q}{
vector of quantiles.
}
  \item{p}{
vector of probabilities.
}
  \item{df}{
degrees of freedom (>0).
}
  \item{ncp}{
noncentrality parameter.
}
\item{lower.tail}{	
logical, if lower.tail=FALSE, probabilities are \eqn{P[X > x]}, otherwise, \eqn{P[X \leq x]}.
}
  \item{\dots}{
arguments to pass to functions \code{d}, \code{p} or \code{q} in R package \code{distr}.
}

}
\details{
Based on R package \code{distr}.
}
\value{
numeric of length equal to the length of x.
}
%\references{
%P. Ruckdeschel, M. Kohl, T. Stabla, F. Camphausen (2006): S4 Classes for Distributions, R News, 6(2), 2-6.
%} q.absTd(p=c(1:4)/10,df=3,ncp=0)
\author{
  Code: David R. Bickel,\cr
  Documentation: Alaa Ali, Kyle Leckett, Marta Padilla.
}

\seealso{
Functions \code{\link{d}}, \code{\link{p}} and \code{\link{q}} in R package \code{\link[distr:distr-package]{distr}}.
}
\examples{
  z1<-d.absTd(x = c(1:4), df = 3, ncp = 3)
  z2<-p.absTd(q = c(1:4), df = 3, ncp = 0)
  z3<-q.absTd(p = abs(runif(4)), df = 3, ncp = 2)
  \dontshow{#check-----------------------------------
    z1;z2;z3}
 }
