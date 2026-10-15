# Inline an icon as HTML

Returns the icon's SVG as
[`htmltools::HTML()`](https://rstudio.github.io/htmltools/reference/HTML.html),
ready to print in R Markdown or Quarto chunks (`results = "asis"`),
inline code, or Shiny UI.

## Usage

``` r
iconify_html(id, ...)
```

## Arguments

- id:

  Icon id of the form `"prefix:name"`, e.g. `"mdi:home"`.

- ...:

  Passed to
  [`iconify_get()`](https://noahweidig.github.io/iconifyr/reference/iconify_get.md)
  (`color`, `size`, `flip`, `rotate`).

## Value

An object of class `html` (see
[`htmltools::HTML()`](https://rstudio.github.io/htmltools/reference/HTML.html)).

## See also

[`iconify_get()`](https://noahweidig.github.io/iconifyr/reference/iconify_get.md)

## Examples

``` r
iconify_html("mdi:home", color = "steelblue")
#> <svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" viewBox="0 0 24 24"><path fill="steelblue" d="M10 20v-6h4v6h5v-8h3L12 3L2 12h3v8z"/></svg>
```
