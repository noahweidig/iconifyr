search_json <- function(ids) {
  as.character(jsonlite::toJSON(list(icons = ids, total = length(ids)), auto_unbox = TRUE))
}

test_that("iconify_search returns a data frame of ids", {
  local_no_cache()
  seen <- NULL
  httr2::local_mocked_responses(function(req) {
    seen <<- req$url
    fake_resp(search_json(c("mdi:home", "mdi:home-outline", "tabler:home")))
  })
  out <- iconify_search("home", prefixes = c("mdi", "tabler"), limit = 2)
  expect_s3_class(out, "data.frame")
  expect_equal(out$id, c("mdi:home", "mdi:home-outline"))
  expect_equal(out$prefix, c("mdi", "mdi"))
  expect_equal(out$name, c("home", "home-outline"))
  q <- httr2::url_parse(seen)$query
  expect_equal(q$query, "home")
  expect_equal(q$prefixes, "mdi,tabler")
  expect_equal(q$limit, "32")
})

test_that("iconify_search handles no results and bad input", {
  local_no_cache()
  httr2::local_mocked_responses(function(req) fake_resp('{"icons":[],"total":0,"collections":{}}'))
  out <- iconify_search("zzzzzz")
  expect_equal(nrow(out), 0L)
  expect_named(out, c("id", "prefix", "name"))
  expect_error(iconify_search(""), "query")
  expect_error(iconify_search("a", limit = 0), "limit")
  expect_error(iconify_search("a", limit = 1000), "limit")
  expect_error(iconify_search("a", prefixes = 1), "prefixes")
})

test_that("iconify_sets parses the collections response", {
  local_no_cache()
  json <- '{
    "mdi": {"name": "Material Design Icons", "total": 7000,
            "author": {"name": "Pictogrammers", "url": "https://x"},
            "license": {"title": "Apache 2.0", "spdx": "Apache-2.0", "url": "https://l"}},
    "fa6-solid": {"name": "Font Awesome 6 Solid", "total": 1388,
            "author": {"name": "Dave Gandy"},
            "license": {"title": "CC BY 4.0", "spdx": "CC-BY-4.0"}},
    "odd": {"name": "No metadata", "total": 3}
  }'
  seen <- NULL
  httr2::local_mocked_responses(function(req) {
    seen <<- req$url
    fake_resp(json)
  })
  out <- iconify_sets()
  expect_match(seen, "/collections$")
  expect_equal(out$prefix, c("mdi", "fa6-solid", "odd"))
  expect_equal(out$name[[2]], "Font Awesome 6 Solid")
  expect_equal(out$author, c("Pictogrammers", "Dave Gandy", NA))
  expect_equal(out$license_spdx, c("Apache-2.0", "CC-BY-4.0", NA))
  expect_equal(out$license_title[[1]], "Apache 2.0")
  expect_equal(out$total, c(7000, 1388, 3))
})

test_that("iconify_icons combines uncategorized and categorized icons", {
  local_no_cache()
  json <- '{"prefix":"x","total":4,"uncategorized":["b","a"],
            "categories":{"One":["c","a"],"Two":["d"]}}'
  seen <- NULL
  httr2::local_mocked_responses(function(req) {
    seen <<- req$url
    fake_resp(json)
  })
  expect_equal(iconify_icons("x"), c("a", "b", "c", "d"))
  expect_equal(httr2::url_parse(seen)$query$prefix, "x")
  expect_error(iconify_icons("Bad Prefix"), class = "iconifyr_invalid_prefix")
})

test_that("iconify_icons errors on unknown sets", {
  local_no_cache()
  httr2::local_mocked_responses(function(req) fake_resp("404", 404L, "text/plain"))
  expect_error(iconify_icons("zzz"), class = "iconifyr_not_found")
})
