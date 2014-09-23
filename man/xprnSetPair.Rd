\name{xprnSetPair}
\alias{xprnSetPair}
\alias{nxprnSetPair}
\title{
Creates a xprnSetPair data class structure.
}
\description{
\code{xprnSetPair} creates a xprnSetPair data class structure from two matrices, numeric, xprnSet or Xprnset data types (inputs x and y have to be of same class). If the input data are XprnSet they are converted to xprnSet by performing log (internally).
\code{nxprnSetPair} performs some more checkings if input data are numeric or matrix, such as:

- it adds unique names to unnamed input matrices or numeric data,

- it removes columns and rows of data in inputs x and y that do not have any finite element,

- it assures that all column and row names are different by adding a number to duplicated names,

- it assures that row names of inputs x and y are identical feature by feature,

- when paired = TRUE it also assures that the column names of inputs x and y are identical sample by sample.}
\usage{
xprnSetPair(x, y, factor.name, ...)
nxprnSetPair(x, y = NULL, paired = FALSE, x.pdata = NULL, y.pdata = NULL, x.fdata = NULL, 
    y.fdata = NULL, fdata = NULL, annot = c("case", "control"), factor.name, ...)
}
\arguments{
  \item{x}{
    A data matrix (or numeric for just 1 feature) with samples in columns and features (genes, proteins,...) in rows.
    It can also be a xprnSet or XprnSet data class.
}
   \item{y}{
    A data matrix (or numeric for just 1 feature) with samples in columns and features (genes, proteins,...) in rows.
    Not used if input x is class xprnSet or XprSet and factor.name is specified. 
}
   \item{paired}{
    logical, if paired = TRUE it removes columns in x or y that are not present in both data matrices x and y (not used if input y is missing).
}
%    \item{rm.na}{
%    logical, if rm.na = TRUE it removes columns and rows in x and y that do not have any finite element.
%}
  \item{x.pdata}{
    Optional. A character, character vector, matrix or data.frame with as many rows as the number of samples in matrix x. 
    x.pata contains additionally information about the samples that is added to the data.frame of class xprnSet in slot x (see examples).
}
  \item{y.pdata}{
    Optional. A character, character vector, matrix or data.frame with as many rows as the number of samples in matrix y. 
    y.pata contains additionally information about the samples that is added to the data.frame of class xprnSet in slot y (see examples).
}
 \item{x.fdata}{
    Optional. A character, character vector, matrix or data.frame with as many rows as the number of features in matrix x. 
    x.fata contains additionally information about the features that is added to the data.frame fdata of each class xprnSet in slots x and y.
}
  \item{y.fdata}{
    Optional. A character, character vector, matrix or data.frame with as many rows as the number of features in matrix y. 
    y.fata contains additionally information about the features that is added to the data.frame fdata of each class xprnSet in slots x and y.
}
  \item{fdata}{
    Optional. A character, character vector, matrix or data.frame with as many rows as number of features. 
    fdata contains additionally information about the features that is added to the data.frame fdata of each class xprnSet in slots x and y (see examples).
}
  \item{annot}{
    Optional. A character vector of length 2, one annotation (see ExpressionSet in \code{Biobase} package) for each slot x and y.
}
    \item{factor.name}{
    Optional. Column name of the phenoData (data.frame) of input x (x has to be of class xprnSet or XprnSet). The phenoData hast to be a data.frame with at least 2 level factor elements.
    }
    %\item{level}{
    %Optional. The 2 level factor elements of the phenoData column named in input factor.name to use.
    %}
    \item{\dots}{
    Optional. Other commands to class ExpressionSet from the \code{Biobase} package.
}
}
\value{
  A xprnSetPair data class structure.
}
\author{
Code: David R. Bickel and Marta Padilla (modifications),\cr
Documentation: Alaa Ali, Kyle Leckett, Marta Padilla.
%Zahra Montazeri, Alaa Ali, Kyle Leckett, Marta Padilla and David R. Bickel
}
\seealso{
Functions \code{\link{xprnSet}}, \code{\link{XprnSet}}, \code{\link{nxprnSet}}, \code{\link{nXprnSet}}.

Classes \code{\linkS4class{xprnSet}}, \code{\linkS4class{XprnSet}}, \code{\linkS4class{xprnSetPair}} 
and Bioconductors \code{\linkS4class{ExpressionSet}} class from the \code{Biobase} package. 
}
\examples{
#check results with: class(z); exprs(z); pData(z); fData(z); annotation(z)
    x <- matrix(runif(4 * 7, min = -1, max = 1), 4, 7)
    y <- matrix(runif(4 * 7, min = -1, max = 1), 4, 7)

#data matrix without names, with rows and columns with nonfinite elements
x[1, ] <- NA; x[, 2] <- Inf; x[, 4] <- NaN

z0 <- nxprnSetPair(x = x, y = y, paired = TRUE, annot = c("mutant", "wild"))
z1 <- xprnSetPair(x = x, y = y)
\dontshow{
    x;y;exprs(z0);exprs(z1)
    #z0 <- nxprnSetPair(x = x, y = y, paired = TRUE, annot = c("mutant", "wild"))
    zaux<-z0;str(exprs(zaux));str(pData(zaux));str(fData(zaux));str(annotation(zaux))  
    #z1 <- xprnSetPair(x = x, y = y)
    zaux<-z1;str(exprs(zaux));str(pData(zaux));str(fData(zaux));str(annotation(zaux))
}
#data matrix with duplicated sample names
colnames(x) <- paste("C", 1:ncol(x), sep="")
colnames(x)[c(7, 3, 5)] <- colnames(x)[1]

z2<-nxprnSetPair(x = x, y = y ,paired = FALSE)
\dontshow{
    x;exprs(z2)
    zaux<-z2;str(exprs(zaux));str(pData(zaux));str(fData(zaux));str(annotation(zaux))  
}
#data matrix with fdata and pdata (matrix, character and data.frame) specified:
pDx <- cbind(class.1 = rep("rat.A", ncol(x)), 
             class.2 = c(rep("rat.C", 3), rep("rat.B", ncol(x) - 3)))
pDy <- data.frame(class.1 = rep("rat.B", ncol(y)))

z3 <- nxprnSetPair(x = x, y = y, x.pdata = pDx, y.pdata = pDy, fdata = "lip.A",
             annot = c("mutant","wild"))

#from XprnSets:
fD<-data.frame(class.1=c(rep("lipidA",2),rep("lipidB",nrow(x)-2)))
xfD<-data.frame(class.x=c(rep("A",3),rep("B",nrow(x)-3)))
yfD<-data.frame(class.y=c(rep("CA",1),rep("CB",nrow(y)-1)))

zX<-nXprnSet(x=abs(x),fdata="lipids",pdata="sick",annot="ratsA")
zY<-nXprnSet(x=abs(y),fdata=fD,pdata="healthy",annot="ratsB")
z4<-nxprnSetPair(x=zX,y=zY,paired=FALSE,annot=c("A","B"))
z5<-nxprnSetPair(x=zX,y=zY,x.fdata=xfD,y.fdata=yfD,fdata=fD)
\dontshow{
    zaux<-z3; str(exprs(zaux));str(pData(zaux));str(fData(zaux));str(annotation(zaux))
    zaux<-zX; str(exprs(zaux));str(pData(zaux));str(fData(zaux));str(annotation(zaux))
    zaux<-zY; str(exprs(zaux));str(pData(zaux));str(fData(zaux));str(annotation(zaux))
    zaux<-z4; str(exprs(zaux));str(pData(zaux));str(fData(zaux));str(annotation(zaux))
    zaux<-z5; str(exprs(zaux));str(pData(zaux));str(fData(zaux));str(annotation(zaux))
    
}

#if x input data is XprnSet and y is missing log will be made:
pDx <- data.frame(rat.type = c(rep("rat.C", 3), rep("rat.B", ncol(x) - 3)))

zX <- nXprnSet(abs(x), pdata = pDx)
zx <- nxprnSet(abs(x), pdata = pDx)
z4 <- xprnSetPair(x = zX, factor.name = "rat.type")
z5 <- nxprnSetPair(x = zx, factor.name = "rat.type")
\dontshow{#check-------------------------------------
    #zX <- nXprnSet(abs(x), pdata = pDx)
    zaux<-zX; str(exprs(zaux));str(pData(zaux));str(fData(zaux));str(annotation(zaux))  
    #zx <- nxprnSet(abs(x), pdata = pDx)
    zaux<-zx; str(exprs(zaux));str(pData(zaux));str(fData(zaux));str(annotation(zaux))  
    #z4 <- xprnSetPair(x = zX, factor.name = "rat.type")
    zaux<-z4; str(exprs(zaux));str(pData(zaux));str(fData(zaux));str(annotation(zaux))  
    #z5 <- nxprnSetPair(x = zx, factor.name = "rat.type")
    zaux<-z5; str(exprs(zaux));str(pData(zaux));str(fData(zaux));str(annotation(zaux))  
}


}