\name{permuDEtest}
\alias{permuDEtest}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Permutation test on omics data
}
\description{
Perform permutation test on omics data to look for features that significantly differ between two groups, no assumption about data distribution and robust to ties.
}
\usage{
permuDEtest(data, samples_group1, samples_group2, n_perm = 1000, workers = 4)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{data}{
A  dataframe for feature abundance; each raw represents a gene, each column represent a sample; rownames are feature names and column names are sample names
}
  \item{samples_group1}{
A vector of sample names for group 1, those sample names should be the same as in the colnames of data
}
  \item{samples_group2}{
A vector of sample names for group 2, those sample names should be the same as in the colnames of data
}
  \item{n_perm}{
The number of permutations
}
  \item{workers}{
A cluster object, a character vector of host names, a positive numeric scalar, or a function. If a character vector or a numeric scalar, a cluster object is created using makeClusterPSOCK(workers). If a function, it is called without argu- ments when the future is created and its value is used to configure the workers. The function should return any of the above types.
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
A dataframe similar to the feature abundance dataframe, but with P_value and padj_BH added
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
Yuan Li
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
# generate a feature abundance matrix with 10 rows and 8 columns
library(dplyr)
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
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory (show via RShowDoc("KEYWORDS")):
% \keyword{ ~kwd1 }
% \keyword{ ~kwd2 }
% Use only one keyword per line.
% For non-standard keywords, use \concept instead of \keyword:
% \concept{ ~cpt1 }
% \concept{ ~cpt2 }
% Use only one concept per line.
