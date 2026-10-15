# Clear the iconifyr cache

Deletes every response cached on disk. Responses are cached when the
option `iconifyr.cache` is `TRUE` (the default), in the directory
returned by `tools::R_user_dir("iconifyr", "cache")`. Set
`options(iconifyr.cache = FALSE)` to turn caching off. The directory can
be changed with the option `iconifyr.cache_dir`.

## Usage

``` r
iconify_cache_clear()
```

## Value

`TRUE` invisibly if the cache directory was removed or did not exist,
`FALSE` if it could not be removed.

## Examples

``` r
iconify_cache_clear()
```
