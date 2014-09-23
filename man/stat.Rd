\name{stat}
\alias{stat}
\title{
Evaluates a function feature per feature.
}
\description{
Evaluates function FUN feature per feature for input classes: matrix, xprnSet, XprnSet, xprnSetPair.
}
\usage{
stat(x, y = numeric(0), FUN = mean, na.rm = TRUE, ...)
}
\arguments{
  \item{x}{
input data of class  matrix, xprnSet, XprnSet, xprnSetPair, XprnSetPair.
The number of features of x is nrow(x).
}
\item{y}{
optional input data of same class as x (not needed when x is xprnSetPair).
}
  \item{FUN}{
a function to evaluate the inputs of which must be named x, y and na.rm (see example).
}
  \item{na.rm}{
if na.rm = TRUE the NAs in the data are ignored.
}
\item{\dots}{ further arguments for FUN }
}
\value{
a numeric with same length as the number of features in input x.
}
\seealso{
Classes \code{\linkS4class{xprnSet}}, \code{\linkS4class{XprnSet}}, \code{\linkS4class{xprnSetPair}}.

Functions \code{\link{XprnSet}}, \code{\link{xprnSet}}, \code{\link{xprnSetPair}}, \code{\link{nXprnSet}}, \code{\link{nxprnSet}}, \code{\link{nxprnSetPair}}.
}
\author{
Code: David R. Bickel,\cr
Documentation: Alaa Ali, Kyle Leckett, Marta Padilla.
%Zahra Montazeri, Alaa Ali, Kyle Leckett, Marta Padilla and David R. Bickel
}
\examples{
xm<-matrix(runif(4 * 7, min= -1, max = 1), 4, 7)
ym<-matrix(runif(4 * 8, min= -1, max = 1), 4, 8)

#input data:  XprnSet and xprnSetPair 
x1 <- XprnSet(exprs = abs(xm)) 
x2 <- xprnSetPair(x = xprnSet(exprs = xm), y = xprnSet(exprs = ym))
x3 <- nxprnSetPair(x = xm, y = ym, paired = TRUE)

#functions to apply to every feature of the input data 
FUN <- function(x, na.rm, ...){t.test(x = x, na.rm = na.rm,...)$statistic}
absFUN <- function(x, y, na.rm, ...){z<-t.test(x = x, y = y, na.rm = na.rm,...)$statistic;abs(z)}
pFUN <- function(x, y, na.rm, ...){t.test(x = x, y = y, alternative = "greater")$p.value}

z1 <- stat(x = x1, na.rm = TRUE, FUN = FUN)
z2 <- stat(x = x2, na.rm = TRUE, FUN = absFUN)
z3 <- stat(x = x3, na.rm = TRUE, FUN = pFUN)
z4 <- stat(x = xm, y = ym, na.rm = TRUE, FUN = absFUN)
\dontshow{#check-----------------------------------
  xm;ym;exprs(x1);exprs(x2);exprs(x3)
  z1;z2;z3;z4
}
\dontshow{#check-----------------------------------
z5<-stat(x=xm,FUN=function(x,na.rm=na.rm){t.test(x=x)$statistic})
z6<-stat(x=xm,y=ym, FUN = function(x, y,na.rm=na.rm){t.test(x = x, y = y,alternative='greater')$p.value})
z7<-stat(x=x2, FUN = function(x, y,na.rm=na.rm){t.test(x = x, y = y,alternative='greater')$p.value})
z8<-stat(x=x1,FUN=function(x,na.rm=na.rm){t.test(x=x)$statistic})
#--------------
z5;z6;z7;z8}
}

