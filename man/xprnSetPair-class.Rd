\name{xprnSetPair-class}
\Rdversion{1.1}
\docType{class}
\alias{xprnSetPair-class}

\title{Class "xprnSetPair"}
\description{
The xprnSetPair class is a wrapper around two Bioconductor ExpressionSet class from the \code{Biobase} package.
The xprnSetPair class contains 2 data sets (matrices) with exactly the same features (in rows) in both data sets.
}

\section{Slots}{
  \describe{
    \item{\code{x}:}{Object of class xprnSet }
    \item{\code{y}:}{Object of class xprnSet }
  }
}

\note{
Functions from \code{Biobase} package that also work for xprnSetPair class: \code{exprs}, \code{pData}, \code{fData}, \code{annotation} (see example).

Functions that work for xprnSetPair class: \code{normalize}, \code{recenter}, \code{standardize}, \code{[}, \code{rownames}, \code{nrow}, \code{colnames}, \code{ncol}.
Only selection of features is possible (see example).
Functions referring to slots x and y results in a list with fields x and y: \code{colnames}, \code{ncol}, \code{exprs}, \code{pData} (see example).
}
%\references{
%Gentleman, R. C., V. J. Carey, D. M. Bates, et al. (2004): "Bioconductor: Open
%software development for computational biology and bioinformatics," Genome
%Biology, 5, R80.
%}
\author{
Code: David R. Bickel,\cr
Documentation: Alaa Ali, Kyle Leckett, Marta Padilla. 
%Zahra Montazeri, Alaa Ali, Kyle Leckett, Marta Padilla and 
}

\seealso{
Functions \code{\link{xprnSet}}, \code{\link{XprnSet}}, \code{\link{xprnSetPair}}, \code{\link{nxprnSet}}, \code{\link{nXprnSet}}, \code{\link{nxprnSetPair}}. 

Classes \code{\linkS4class{XprnSet}}, \code{\linkS4class{xprnSet}} and Bioconductors \code{\linkS4class{ExpressionSet}} class from the \code{Biobase} package.
}
\examples{
showClass("xprnSetPair")
#a matrix of log intensities. Check class with class(z)
x <- matrix(runif(4 * 7, min = -1, max = 1), 4, 7) 
y <- matrix(runif(4 * 7, min = -1, max = 1), 4, 7)

X <- new("xprnSet", es = new("ExpressionSet", exprs = x))
Y <- new("xprnSet", es = new("ExpressionSet", exprs = y))

z<-new("xprnSetPair", x = X, y = Y)

#Functions from Biobase package:
exprs(z); pData(z); fData(z); annotation(z)
#Selection of features:
zf<-z[c(1,3), ]; exprs(zf)
#dimension and names of data sets x and y:
ncol(z); nrow(z); colnames(z); rownames(z)
\dontshow{#check-----------------------------------
x;y
z<-zf;exprs(z); pData(z); fData(z); annotation(z)
}
}

\keyword{classes}
