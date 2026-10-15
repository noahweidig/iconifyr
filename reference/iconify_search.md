# Search for icons

Queries `/search`.

## Usage

``` r
iconify_search(query, prefixes = NULL, limit = 64)
```

## Arguments

- query:

  Search term.

- prefixes:

  Optional character vector of icon set prefixes to restrict the search
  to. A prefix ending in `"-"` matches partially, so `"mdi-"` matches
  `"mdi-light"`.

- limit:

  Maximum number of results, 1 to 999. The API returns at least 32
  results per request; extra results are dropped.

## Value

A data frame with columns `id` (`"prefix:name"`), `prefix` and `name`.

## See also

[`iconify_sets()`](https://noahweidig.github.io/iconifyr/reference/iconify_sets.md),
[`iconify_icons()`](https://noahweidig.github.io/iconifyr/reference/iconify_icons.md)

## Examples

``` r
iconify_search("home", prefixes = c("mdi", "tabler"), limit = 40)
#>                        id prefix               name
#> 1                mdi:home    mdi               home
#> 2        mdi:home-outline    mdi       home-outline
#> 3             tabler:home tabler               home
#> 4      tabler:home-filled tabler        home-filled
#> 5           tabler:home-2 tabler             home-2
#> 6    tabler:home-2-filled tabler      home-2-filled
#> 7           tabler:home-x tabler             home-x
#> 8          tabler:home-up tabler            home-up
#> 9            mdi:home-off    mdi           home-off
#> 10   mdi:home-off-outline    mdi   home-off-outline
#> 11        tabler:home-cog tabler           home-cog
#> 12        tabler:home-dot tabler           home-dot
#> 13        tabler:home-eco tabler           home-eco
#> 14        tabler:home-off tabler           home-off
#> 15          mdi:home-city    mdi          home-city
#> 16  mdi:home-city-outline    mdi  home-city-outline
#> 17          mdi:home-edit    mdi          home-edit
#> 18  mdi:home-edit-outline    mdi  home-edit-outline
#> 19          mdi:home-lock    mdi          home-lock
#> 20          mdi:home-plus    mdi          home-plus
#> 21  mdi:home-plus-outline    mdi  home-plus-outline
#> 22          mdi:home-roof    mdi          home-roof
#> 23          mdi:home-silo    mdi          home-silo
#> 24  mdi:home-silo-outline    mdi  home-silo-outline
#> 25       tabler:home-bolt tabler          home-bolt
#> 26       tabler:home-down tabler          home-down
#> 27       tabler:home-edit tabler          home-edit
#> 28       tabler:home-hand tabler          home-hand
#> 29       tabler:home-link tabler          home-link
#> 30       tabler:home-lock tabler          home-lock
#> 31       tabler:home-move tabler          home-move
#> 32       tabler:home-plus tabler          home-plus
#> 33       tabler:home-star tabler          home-star
#> 34         mdi:home-alert    mdi         home-alert
#> 35 mdi:home-alert-outline    mdi home-alert-outline
#> 36         mdi:home-clock    mdi         home-clock
#> 37 mdi:home-clock-outline    mdi home-clock-outline
#> 38         mdi:home-flood    mdi         home-flood
#> 39         mdi:home-group    mdi         home-group
#> 40         mdi:home-heart    mdi         home-heart
```
