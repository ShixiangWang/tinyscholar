
<!-- README.md is generated from README.Rmd. Please edit that file -->

# tinyscholar

<!-- badges: start -->

<!-- badges: end -->

The goal of tinyscholar is to provide a simple way to get and show
Google scholar profile.

## Installation

You can install the released version of tinyscholar from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("tinyscholar")
```

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("ShixiangWang/tinyscholar")
```

## Usage

Here I will use my profile as an example.

### Get Personal Profile

Firstly, you need to get your Google scholar ID from URL of your Google
scholar profile.

Then you can use function `tinyscholar()` to get the tidy data, which is
a list of two `data.frame` with added `profile` class.

``` r
library(tinyscholar)
profile <- tinyscholar("FvNp0NkAAAAJ")
str(profile, max.level = 1)
#> List of 2
#>  $ publications:'data.frame':    12 obs. of  5 variables:
#>  $ citations   :'data.frame':    4 obs. of  2 variables:
#>  - attr(*, "class")= chr [1:2] "ScholarProfile" "list"
```

You can use this data in your way. The following parts provide two
simple ways to show the profile.

### Show Table

Table is the best way to show the scholar profile. Tinyscholar uses
[gt](https://gt.rstudio.com/index.html) package to generate tables which
can be easily modified.

``` r
tb <- scholar_table(profile)
tb$citations
tb$publications
```

### Show Plot

Similarly, you can show numeric data with ggplot2 package.

``` r
pl <- scholar_plot(profile)
pl$citations
```

<img src="man/figures/README-unnamed-chunk-4-1.png" width="100%" style="display: block; margin: auto;" />

``` r
pl$publications
```

<img src="man/figures/README-unnamed-chunk-4-2.png" width="100%" style="display: block; margin: auto;" />

## Similar R package

R package [scholar](https://cran.r-project.org/package=scholar) is a
more comprehensive package to get and visualize the Google scholar
profile. However, tinyscholar is lightweight and not limited in China.
