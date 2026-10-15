# Licensing

Every icon set on Iconify has its own license. Using an icon means
following that license. This page shows how to look it up. It is not
legal advice.

## Look up a license

``` r

lic <- iconify_license("fa6-solid")
#> ! "Font Awesome 6 Solid" ("fa6-solid") is licensed "CC BY 4.0": attribution is required. Credit "Dave Gandy".
lic
#> Font Awesome 6 Solid (fa6-solid)
#>   License:              CC BY 4.0 (CC-BY-4.0)
#>   License URL:          https://creativecommons.org/licenses/by/4.0/
#>   Author:               Dave Gandy
#>   Author URL:           https://github.com/FortAwesome/Font-Awesome
#>   Attribution required: yes
```

[`iconify_license()`](https://noahweidig.github.io/iconifyr/reference/iconify_license.md)
accepts a set prefix or a full icon id. When the license requires
attribution (Creative Commons Attribution licenses such as CC BY 4.0,
and ODbL), it also prints a message. Silence it with `quiet = TRUE`.

The result is a list, so you can build a credit line from it:

``` r

sprintf("Icons: %s by %s (%s), %s", lic$set, lic$author, lic$url, lic$license)
#> [1] "Icons: Font Awesome 6 Solid by Dave Gandy (https://creativecommons.org/licenses/by/4.0/), CC BY 4.0"
```

## Audit all sets

[`iconify_sets()`](https://noahweidig.github.io/iconifyr/reference/iconify_sets.md)
has the license of every set, so you can filter before you pick one:

``` r

sets <- iconify_sets()
table(sets$license_spdx, useNA = "ifany")[1:8]
#> 
#>      Apache-2.0    BSD-3-Clause       CC-BY-3.0       CC-BY-4.0    CC-BY-NC-4.0 
#>              31               1               1              52               1 
#> CC-BY-NC-SA-4.0    CC-BY-SA-3.0    CC-BY-SA-4.0 
#>               1               2               7
head(sets[grepl("^(MIT|Apache)", sets$license_spdx), c("prefix", "name", "license_spdx")])
#>                   prefix                   name license_spdx
#> 1       material-symbols       Material Symbols   Apache-2.0
#> 2 material-symbols-light Material Symbols Light   Apache-2.0
#> 3                     ic  Google Material Icons   Apache-2.0
#> 4                    mdi  Material Design Icons   Apache-2.0
#> 6                line-md    Material Line Icons          MIT
#> 8                 tabler           Tabler Icons          MIT
```

## What the attribution flag covers

- `attribution_required` is `TRUE` for SPDX ids starting with `CC-BY`
  (this includes CC-BY-SA and CC-BY-NC) and for `ODbL`.
- MIT, Apache-2.0 and BSD sets don’t require visible credit, but they
  require you to keep the license notice when you redistribute the
  icons.
- Sets with no license data return `NA`. Check the set’s source.
- Non-commercial and share-alike licenses carry extra conditions beyond
  attribution. Read the license URL.
