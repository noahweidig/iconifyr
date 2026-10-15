# List icon sets

Queries `/collections`.

## Usage

``` r
iconify_sets()
```

## Value

A data frame with one row per icon set and columns `prefix`, `name`,
`author`, `license_spdx`, `license_title` and `total`. Missing values
are `NA`.

## See also

[`iconify_icons()`](https://noahweidig.github.io/iconifyr/reference/iconify_icons.md),
[`iconify_license()`](https://noahweidig.github.io/iconifyr/reference/iconify_license.md)

## Examples

``` r
sets <- iconify_sets()
head(sets)
#>                   prefix                   name                  author
#> 1       material-symbols       Material Symbols                  Google
#> 2 material-symbols-light Material Symbols Light                  Google
#> 3                     ic  Google Material Icons Material Design Authors
#> 4                    mdi  Material Design Icons           Pictogrammers
#> 5              mdi-light  Material Design Light           Pictogrammers
#> 6                line-md    Material Line Icons     Vjacheslav Trushkin
#>   license_spdx     license_title total
#> 1   Apache-2.0        Apache 2.0 15728
#> 2   Apache-2.0        Apache 2.0 15793
#> 3   Apache-2.0        Apache 2.0 10955
#> 4   Apache-2.0        Apache 2.0  7447
#> 5      OFL-1.1 Open Font License   284
#> 6          MIT               MIT  1218
```
