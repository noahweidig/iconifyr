# List the icons in a set

Queries `/collection`. Returns the icons the API lists as visible: the
uncategorized icons plus every categorized icon. Aliases and hidden
icons exist and can be fetched with
[`iconify_get()`](https://noahweidig.github.io/iconifyr/reference/iconify_get.md),
but are not included.

## Usage

``` r
iconify_icons(prefix)
```

## Arguments

- prefix:

  Icon set prefix, e.g. `"mdi"`.

## Value

A sorted character vector of icon names (without the prefix).

## See also

[`iconify_sets()`](https://noahweidig.github.io/iconifyr/reference/iconify_sets.md),
[`iconify_search()`](https://noahweidig.github.io/iconifyr/reference/iconify_search.md)

## Examples

``` r
head(iconify_icons("tabler"))
#> [1] "a-b"        "a-b-2"      "a-b-off"    "abacus"     "abacus-off"
#> [6] "abc"       
```
