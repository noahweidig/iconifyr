# Get an icon as SVG

Fetches `/{prefix}/{name}.svg` from the Iconify API.

## Usage

``` r
iconify_get(id, color = NULL, size = NULL, flip = NULL, rotate = NULL)
```

## Arguments

- id:

  Icon id of the form `"prefix:name"`, e.g. `"mdi:home"`.

- color:

  Icon color: a CSS color name or hex string such as `"#ba3329"`. Only
  affects monotone icons.

- size:

  Icon height in pixels, or `"auto"`, `"unset"` or `"none"`. The width
  follows the icon's aspect ratio. `NULL` keeps the API default (`1em`).

- flip:

  One or more of `"horizontal"`, `"vertical"`, `"both"`.

- rotate:

  `90`, `180` or `270` degrees (`"90deg"` also works). When combined
  with `flip`, the icon is flipped first.

## Value

A length-1 character vector containing the SVG markup.

## See also

[`iconify_html()`](https://noahweidig.github.io/iconifyr/reference/iconify_html.md),
[`iconify_download()`](https://noahweidig.github.io/iconifyr/reference/iconify_download.md),
[`iconify_png()`](https://noahweidig.github.io/iconifyr/reference/iconify_png.md)

## Examples

``` r
svg <- iconify_get("mdi:home", color = "#ba3329", size = 48)
cat(svg)
#> <svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" viewBox="0 0 24 24"><path fill="#ba3329" d="M10 20v-6h4v6h5v-8h3L12 3L2 12h3v8z"/></svg>
```
