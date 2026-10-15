# Render an icon to PNG

Requires the suggested package rsvg.

## Usage

``` r
iconify_png(id, file, width = 128, ...)
```

## Arguments

- id:

  Icon id of the form `"prefix:name"`, e.g. `"mdi:home"`.

- file:

  Output PNG path.

- width:

  Width in pixels. The icon is requested at this height and rendered at
  this width.

- ...:

  Passed to
  [`iconify_get()`](https://noahweidig.github.io/iconifyr/reference/iconify_get.md)
  (`color`, `flip`, `rotate`).

## Value

`file`, invisibly.

## See also

[`iconify_get()`](https://noahweidig.github.io/iconifyr/reference/iconify_get.md)

## Examples

``` r
iconify_png("mdi:home", tempfile(fileext = ".png"), width = 64)
```
