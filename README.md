# permuDE
Perform permutation test on omics data to look for features differentially expressed between 2 different groups; this method is non-parametric, does not require any data distribution and is robust to ties.
# How to use this package

To install the permuDE package, download the package locally

In the directory where the package directory is loaded, open a terminal and run

```
R CMD INSTALL permuDE
```

Alternatively, you can install the package in a R session:

```
install.packages("remotes")
remotes::install_github("Maj18/permuDE")
```

To check whether the package has been properly installed, start a R session and type:

```
library(permuDE)
```

## For an example run (in R) after having permuDE being loaded:

```
### generate a feature abundance matrix with 10 rows and 8 columns
library(dplyr)
set.seed(123)
feature_abundance_matrix <- matrix(rnorm(80), nrow=10)
rownames(feature_abundance_matrix) <- paste0("Feature", 1:10)
colnames(feature_abundance_matrix) <- paste0("Sample", 1:8)
feature_abundance_matrix
### Run a permutation test
samples_group1 = colnames(feature_abundance_matrix)[1:4]
samples_group2 = colnames(feature_abundance_matrix)[5:8]
result_test = permuDEtest(data=feature_abundance_matrix, samples_group1, 
                     samples_group2, n_perm=10000, workers=4) 
head(result_test)
```
