# Download icons as SVG files

Writes one `.svg` file per icon. Files are named `{prefix}-{name}.svg`.

## Usage

``` r
iconify_download(id, dir = ".", ...)
```

## Arguments

- id:

  Character vector of icon ids (`"prefix:name"`).

- dir:

  Output directory. Created if it does not exist.

- ...:

  Passed to
  [`iconify_get()`](https://noahweidig.github.io/iconifyr/reference/iconify_get.md)
  (`color`, `size`, `flip`, `rotate`).

## Value

The file paths, invisibly.

## See also

[`iconify_get()`](https://noahweidig.github.io/iconifyr/reference/iconify_get.md)

## Examples

``` r
paths <- iconify_download(c("mdi:home", "tabler:star"), dir = tempdir())
basename(paths)
#> [1] "mdi-home.svg"    "tabler-star.svg"
```
