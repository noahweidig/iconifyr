# Get license and author information

Looks up the icon set's license and author via `/collections`. Prints a
message when the license requires attribution (any Creative Commons
Attribution license such as CC BY 4.0, and ODbL).

## Usage

``` r
iconify_license(id_or_prefix, quiet = FALSE)
```

## Arguments

- id_or_prefix:

  An icon id (`"mdi:home"`) or a set prefix (`"mdi"`).

- quiet:

  If `TRUE`, don't emit the attribution message.

## Value

A list of class `iconify_license` with elements `prefix`, `set`,
`license`, `spdx`, `url`, `author`, `author_url` and
`attribution_required` (`NA` when the set has no license data).

## Details

Permissive licenses such as MIT or Apache-2.0 do not require attribution
in this sense but still require keeping the license notice. This
function is not legal advice; check the license URL.

## See also

[`iconify_sets()`](https://noahweidig.github.io/iconifyr/reference/iconify_sets.md)

## Examples

``` r
iconify_license("mdi")
#> Material Design Icons (mdi)
#>   License:              Apache 2.0 (Apache-2.0)
#>   License URL:          https://github.com/Templarian/MaterialDesign/blob/master/LICENSE
#>   Author:               Pictogrammers
#>   Author URL:           https://github.com/Templarian/MaterialDesign
#>   Attribution required: no
iconify_license("fa6-solid:house")
#> ! "Font Awesome 6 Solid" ("fa6-solid") is licensed "CC BY 4.0": attribution is required. Credit "Dave Gandy".
#> Font Awesome 6 Solid (fa6-solid)
#>   License:              CC BY 4.0 (CC-BY-4.0)
#>   License URL:          https://creativecommons.org/licenses/by/4.0/
#>   Author:               Dave Gandy
#>   Author URL:           https://github.com/FortAwesome/Font-Awesome
#>   Attribution required: yes
```
