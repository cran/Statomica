\name{xprnSet}
\alias{xprnSet}
\alias{XprnSet}
\alias{nxprnSet}
\alias{nXprnSet}
\title{
Creates a xprnSet/XprnSet data class structure. 
}
\description{
\code{xprnSet} and \code{XprnSet} create a xprnSet and XprnSet data class structure, respectively. The XprnSet structure contains positive data, which corresponds to measured intensities, abundance levels, etc., whereas the xprnSet structure contains the log of the intensities, log abundance levels, etc.
Functions \code{nxprnSet} and \code{nXprnSet} perform additional checkings on the input data:

- it adds unique names to unnamed input matrices or numeric data,

- it removes columns and rows of data in x and y that do not have any finite element,

- it assures that all column and row names are different by adding a number to duplicated names,

- it assures that row names of input x and row names of input y are identical feature by feature.}
\usage{
xprnSet(phenoData, exprs, featureData, ...)
XprnSet(phenoData, exprs, featureData, ...)

nxprnSet(x, pdata = NULL, fdata = NULL, annot = NULL,...)
nXprnSet(x, pdata = NULL, fdata = NULL, annot = NULL,...)
}
\arguments{
  \item{exprs, x}{
    A data matrix (or numeric for just 1 feature) with samples in columns and features (genes, proteins,...) in rows.
}
  \item{phenoData, pdata}{
    Optional. An AnnotatedDataFrame or a data.frame with as many rows as the number of samples in the matrix/numeric input.
    It contains additionally information about the samples. It is equivalent to the pData (phenoData) of the class ExpressionSet in \code{Biobase} package.
}
  \item{featureData, fdata}{
    Optional. An AnnotatedDataFrame or a data.frame with as many rows as the number of features in the matrix/numeric input.
    fdata contains additionally information about the features. It is equivalent to the fData (featureData) of the class ExpressionSet in \code{Biobase} package.
}
%  \item{rm.na}{
%    if rm.na = TRUE it removes columns and rows in inputs x and y that do not have any finite element.
%}
  \item{annot}{
    Optional. Annotation for the class ExpressionSet from the \code{Biobase} package.
}
\item{\dots}{
    Optional. Other commands to class ExpressionSet from the \code{Biobase} package.
}
}
\value{
xprnSet and nxprnSet return a xprnSet data class structure.
XprnSet and nXprnSet return a XprnSet data class structure.
}
\author{
Code: David R. Bickel and Marta Padilla (modifications),\cr
Documentation: Alaa Ali, Kyle Leckett, Marta Padilla.
%Zahra Montazeri, Alaa Ali, Kyle Leckett, Marta Padilla and David R. Bickel
}
\seealso{
See \code{\link{nxprnSetPair}},\code{\link{nxprnSet}}, \code{\link{nXprnSet}},
\code{\linkS4class{xprnSet}},\code{\linkS4class{XprnSet}}, \code{\linkS4class{xprnSetPair}} 
and Bioconductors \code{\linkS4class{ExpressionSet}} class from the \code{Biobase} package. 
}
\examples{
#check results with: class(z);exprs(z);pData(z);fData(z);annotation(z)
nf <- 5; nobs <- 4

x<- matrix(rnorm(nf * nobs), nrow = nf, ncol = nobs)

z1 <- xprnSet(exprs = x)
z2 <- xprnSet(exprs = x, phenoData = data.frame(class = c(1:ncol(x))))
z3 <- XprnSet(exprs = abs(x), annotation = "XprnSet")
\dontshow{#check-----------------------------------
  x
  #z1 <- xprnSet(exprs = x)
zaux<-z1; str(exprs(zaux));str(pData(zaux));str(fData(zaux));str(annotation(zaux))  
  #z2 <- xprnSet(exprs = x, phenoData = data.frame(class = c(1:ncol(y))))
zaux<-z2; str(exprs(zaux));str(pData(zaux));str(fData(zaux));str(annotation(zaux))
  #z3 <- XprnSet(exprs = abs(x), annotation = "XprnSet")
zaux<-z3; str(exprs(zaux));str(pData(zaux));str(fData(zaux));str(annotation(zaux))
}

z4 <- nxprnSet(x = x)
z5 <- nxprnSet(x = x, pdata = data.frame(class = c(1:ncol(x))))
z6 <- nxprnSet(x = x, pdata = c(rep("A", nobs - 1), rep("B", 1)))
z7 <- nXprnSet(x = abs(x), annot = "XprnSet")

\dontshow{#check-----------------------------------
  #z4 <- nxprnSet(x = x)
zaux<-z4; str(exprs(zaux));str(pData(zaux));str(fData(zaux));str(annotation(zaux))
  #z5 <- nxprnSet(x = x, pdata = data.frame(class = c(1:ncol(x))))
zaux<-z5; str(exprs(zaux));str(pData(zaux));str(fData(zaux));str(annotation(zaux))
  #z6 <- nxprnSet(x = x, pdata = c(rep("A", nobs - 1), rep("B", 1)))
zaux<-z6; str(exprs(zaux));str(pData(zaux));str(fData(zaux));str(annotation(zaux))
  #z7 <- nXprnSet(x = abs(x), annot = "XprnSet")
zaux<-z7; str(exprs(zaux));str(pData(zaux));str(fData(zaux));str(annotation(zaux))
}
}
