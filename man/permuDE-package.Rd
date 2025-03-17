\name{permuDE-package}
\alias{permuDE-package}
\alias{permuDE}
\docType{package}
\title{
\packageTitle{permuDE}
}
\description{
\packageDescription{permuDE}
}
\details{

The DESCRIPTION file:
\packageDESCRIPTION{permuDE}
\packageIndices{permuDE}
~~ An overview of how to use the package, including the most important ~~
~~ functions ~~
}
\author{
\packageAuthor{permuDE}

Maintainer: \packageMaintainer{permuDE}
}
\references{
~~ Literature or other references for background information ~~
}
~~ Optionally other standard keywords, one per line, from file KEYWORDS in ~~
~~ the R documentation directory ~~
\keyword{ package }
\seealso{
~~ Optional links to other man pages, e.g. ~~
~~ \code{\link[<pkg>:<pkg>-package]{<pkg>}} ~~
}
\examples{
library(dplyr)
# generate a feature abundance matrix with 10 rows and 8 columns
set.seed(123)
feature_abundance_matrix <- matrix(rnorm(80), nrow=10)
rownames(feature_abundance_matrix) <- paste0("Feature", 1:10)
colnames(feature_abundance_matrix) <- paste0("Sample", 1:8)
feature_abundance_matrix
# Run a permutation test
samples_group1 = colnames(feature_abundance_matrix)[1:4]
samples_group2 = colnames(feature_abundance_matrix)[5:8]
result_test = permuDEtest(data=feature_abundance_matrix, samples_group1, 
                     samples_group2, n_perm=10000, workers=4) 
head(result_test)
}
