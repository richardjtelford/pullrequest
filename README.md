
# pullrequest

<!-- badges: start -->
<!-- badges: end -->

The goal of pullrequest is to fetches a pull request from GitHub so it can be examined in RStudio before merging it



## Installation

You can install `pullrequest` from [GitHub](https://github.com/richardjtelford/pullrequest) with:

``` r
#install.packages("remotes")
remotes::install_github("richardjtelford/pullrequest")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(pullrequest)
examine_pull_request(user = "audhalbritter",
                     repo = "biostats", 
                     branch = "FixGitTutorial",
                     default_branch = "main") 
```

