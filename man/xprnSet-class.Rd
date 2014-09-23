\name{xprnSet-class}
\Rdversion{1.1}
\docType{class}
\alias{xprnSet-class}
\alias{XprnSet-class}

\title{Class \code{"xprnSet"}}
\description{
The xprnSet class is a wrapper around Bioconductor ExpressionSet class from the \code{Biobase} R package.
It refers to data of type log ratios, log intensities, log abundance levels, etc.

The XprnSet class is equivalent to xprnSet class except that its data is all positive or zero. It refers to data of type ratios, intensities, abundance levels, etc.
}

\section{Slots}{
  \describe{
    \item{es}{Object of class ExpressionSet}
  }
}

%\details{
%To get the data matrix from the xprnSet class use exprs function.
%To get the phenoData data.frame from the xprnSet class use pData function.
%To get the featureData data.frame from the xprnSet class use fData function.
%To get the type character from the xprnSet class use annotation function.
%}
\note{
Functions from \code{Biobase} package that also work for xprnSet class: \code{exprs}, \code{pData}, \code{fData}, \code{annotation}.

Functions that work for xprnSet class: \code{logb}, \code{exp}, \code{length}, \code{dim}, \code{dimnames}, \code{[},
      \code{nrow}, \code{ncol}, \code{rownames}, \code{colnames}.                                                                      
}
%\references{
%Gentleman, R. C., V. J. Carey, D. M. Bates, et al. (2004): "Bioconductor: Open
%software development for computational biology and bioinformatics," Genome
%Biology, 5, R80.
%}
\author{
Code: David R. Bickel,\cr
Documentation: Alaa Ali, Kyle Leckett, Marta Padilla.
%Zahra Montazeri, Alaa Ali, Kyle Leckett, Marta Padilla and David R. Bickel
}
\seealso{
Functions \code{\link{xprnSet}}, \code{\link{XprnSet}}, \code{\link{nxprnSet}}, \code{\link{nXprnSet}}.

Class \code{\linkS4class{xprnSetPair}} and Bioconductors \code{\linkS4class{ExpressionSet}} class from the \code{Biobase} package. 
}
\examples{
showClass("xprnSet")
showClass("XprnSet")

#a matrix of log intensities.
x <- matrix(runif(4 * 7, min = -1, max = 1), 4, 7) 

#check output with: class(z)
z <- new("xprnSet", es = new("ExpressionSet", exprs = x))
Z <- new("XprnSet", es = new("ExpressionSet", exprs = abs(x)))

#Functions from Biobase package:
exprs(z); pData(z); fData(z); annotation(z)
exprs(Z); pData(Z); fData(Z); annotation(Z)

#Selection of features:
zf <- z[c(1,3), ]
Zf <- Z[c(1,3), ]

#Selection of samples:
zs <- z[, c(1,3)]
Zs <- Z[, c(1,3)]

#dimension and names of data set:
ncol(z); nrow(z); colnames(z); rownames(z)
ncol(Z); nrow(Z); colnames(Z); rownames(Z)
\dontshow{#check-----------------------------------
x
z<-zf;exprs(z); pData(z); fData(z); annotation(z)
z<-Zf;exprs(z); pData(z); fData(z); annotation(z)
z<-zs;exprs(z); pData(z); fData(z); annotation(z)
z<-Zs;exprs(z); pData(z); fData(z); annotation(z)}
}
\keyword{classes}

