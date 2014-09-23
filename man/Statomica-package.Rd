\name{Statomica-package}
\alias{Statomica-package}
\alias{Statomica}
\docType{package}
\title{
Statomica utility package
}
\description{
Statomica is a suite of basic functions and classes that are needed for certain packages.
It includes three data class structures; XprnSet, xprnSet and xprnSetPair, and functions to create them from
basic data matrices and to manage them.
XprnSet, xprnSet and xprnSetPair are wrappers of the data class ExpressionSet in Bioconductors R package Biobase. 
}
\details{
\tabular{ll}{
Package: \tab Statomica\cr
Type: \tab Package\cr
Version: \tab 1.0\cr
Date: \tab 2014-09-23\cr
License: \tab CC BY-NC 4.0\cr
Depends: \tab R (>= 2.14.0), Biobase, multtest, distr, fBasics, methods\cr
URL: \tab http://www.r-project.org, http://www.bioconductor.org, http://www.statomics.com\cr
License note: \tab Creative Commons Attribution-NonCommercial 4.0 International License\cr
    \tab available from http://creativecommons.org/licenses/by-nc/4.0\cr

}
%~~ An overview of how to use the package, including the most important ~~
%~~ functions ~~
}
\author{
    Code: David R. Bickel, Zahra Montazeri and Marta Padilla,\cr
    Documentation: Alaa Ali, Kyle Leckett, Marta Padilla.\cr
    Maintainer: D. R. Bickel <dbickel@uOttawa.ca>
}

%~~ Optionally other standard keywords, one per line, from file KEYWORDS in the ~~
%~~ R documentation directory ~~
%\keyword{ package }
%\seealso{
%~~ Optional links to other man pages, e.g. ~~
%~~ \code{\link[<pkg>:<pkg>-package]{<pkg>}} ~~
%}
\examples{
#check results with: class(z);exprs(z);pData(z);fData(z);annotation(z)

#matrices of intensities:
nfeat <- 4; nsamx <- 8; nsamy <- 6
X <- matrix(runif(nfeat * nsamx, min = 0, max = 100), nfeat, nsamx)
Y <- matrix(runif(nfeat * nsamy, min = 0, max = 200), nfeat, nsamy)

#matrices of log intensities:
x <- log(X)
y <- log(Y)

#data structures: 
pD <- cbind(class.1 = c(rep("brown", 5), rep("white", ncol(x) - 5)),
      class.2 = c(rep("small", 3), rep("big", ncol(x) - 3)))
fD <- data.frame(class.1 = c(rep("lipidA", 2), rep("lipidB", nrow(x) - 2)))

z1 <- nxprnSetPair(x = x, y = y, x.pdata = pD, fdata = "proteins", paired = TRUE, 
      annot = c("A", "B"))
z2 <- nXprnSet(x = Y, fdata = fD, pdata = "healthy", annot = "ratsB")

z3 <- xprnSet(featureData = fD, exprs = x, phenoData = pD, annotation = "ratsA")
z4 <- xprnSetPair(x = xprnSet(expr = y), y = xprnSet(expr = y))
z5 <- xprnSetPair(x = x, y = y)

\dontshow{#check1---------------------------------------
    X;Y;x;y
    str(pD);str(fD)
    #z1 <- nxprnSetPair(x = x, y = y, x.pdata = pD, fdata = "proteins", paired = TRUE,annot = c("A", "B"))
    zaux<-z1; str(exprs(zaux));str(pData(zaux));str(fData(zaux));str(annotation(zaux))
    #z2 <- nXprnSet(x = Y, fdata = fD, pdata = "healthy", annot = "ratsB")
    zaux<-z2; str(exprs(zaux));str(pData(zaux));str(fData(zaux));str(annotation(zaux))
    #z3 <- xprnSet(featureData = fD, exprs = x, phenoData = pD, annotation = "ratsA")
    zaux<-z3; str(exprs(zaux));str(pData(zaux));str(fData(zaux));str(annotation(zaux))
    #z4 <- xprnSetPair(x = xprnSet(expr = y), y = xprnSet(expr = y))
    zaux<-z4; str(exprs(zaux));str(pData(zaux));str(fData(zaux));str(annotation(zaux))
    #z5 <- xprnSetPair(x = x, y = y)
    zaux<-z5; str(exprs(zaux));str(pData(zaux));str(fData(zaux));str(annotation(zaux))
#---------------------------------------
}


}


