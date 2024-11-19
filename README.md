
<!-- README.md is generated from README.Rmd. Please edit that file -->

# radon

<!-- badges: start -->
<!-- badges: end -->

Apply the Radon transform to magick image objects.

## Installation

You can install the development version of radon like so:

``` r
# install.packages("devtools")
devtools::install_github("hrryt/radon")
```

## Example

Apply the Radon transform to the ImageMagick logo:

``` r
library(radon)
(im <- image_square(magick::logo))
```

<img src="man/figures/README-example-1.gif" width="100%" />

``` r
image_radon(im, steps = 360, progress = FALSE)
```

<img src="man/figures/README-example-2.png" width="100%" />
