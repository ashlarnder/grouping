
<!-- README.md is generated from README.Rmd. Please edit that file -->

# grouping

<!-- badges: start -->
<!-- badges: end -->

The goal of grouping is to group your data set by a variable and then
summarize the remaining numerical variables based on a defined summary
function. See the function documentation details for further details.

## Installation

The package ‘grouping’ is not yet on CRAN, but you can download it from
this repository using the following R command:

``` r
devtools::install_github("ashlarnder/grouping")
```

## Example

This is a basic example which shows you the basic use of the function:

``` r
library(grouping)
group_summary(palmerpenguins::penguins, island, mean)
#> # A tibble: 3 × 6
#>   island    bill_length_mm bill_depth_mm flipper_length_mm body_mass_g  year
#>   <fct>              <dbl>         <dbl>             <dbl>       <dbl> <dbl>
#> 1 Biscoe              45.3          15.9              210.       4716. 2008.
#> 2 Dream               44.2          18.3              193.       3713. 2008.
#> 3 Torgersen           39.0          18.4              191.       3706. 2008.
```

This package is a huge time-saver. When working with large, unruly
datasets and when working across multiple different datasets,
summarizing is a key things you will be doing. This package puts
summarizing data at the tip of your finger. This will allow you to apply
a cleaner and quicker data analysis. You can even apply two summary
functions to the same dataset.

``` r
group_summary(mtcars, cyl, c(mean,sd))
#> # A tibble: 3 × 21
#>     cyl mpg_1 mpg_2 disp_1 disp_2  hp_1  hp_2 drat_1 drat_2  wt_1  wt_2 qsec_1
#>   <dbl> <dbl> <dbl>  <dbl>  <dbl> <dbl> <dbl>  <dbl>  <dbl> <dbl> <dbl>  <dbl>
#> 1     4  26.7  4.51   105.   26.9  82.6  20.9   4.07  0.365  2.29 0.570   19.1
#> 2     6  19.7  1.45   183.   41.6 122.   24.3   3.59  0.476  3.12 0.356   18.0
#> 3     8  15.1  2.56   353.   67.8 209.   51.0   3.23  0.372  4.00 0.759   16.8
#> # … with 9 more variables: qsec_2 <dbl>, vs_1 <dbl>, vs_2 <dbl>, am_1 <dbl>,
#> #   am_2 <dbl>, gear_1 <dbl>, gear_2 <dbl>, carb_1 <dbl>, carb_2 <dbl>
```

There is also a check step inherently included in this function.
Sometimes you forget which dataset you are using, or sometimes your data
is input as the wrong data class. This function will let you know if
there is no numerical data to be applied to, by throwing an informative
error saying “This does not contain numerical data”. I can’t actually
demonstrate this as the error will prevent the file from knitting.

This is pretty basic, so you should be able to apply it no problem!
