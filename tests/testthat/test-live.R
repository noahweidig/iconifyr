test_that("live API round trip", {
  skip_on_cran()
  skip_if_offline("api.iconify.design")
  withr::local_options(
    iconifyr.cache = FALSE,
    iconifyr.api = "https://api.iconify.design"
  )
  expect_match(iconify_get("mdi:home"), "^<svg")
  expect_true("mdi:home" %in% iconify_search("home", prefixes = "mdi")$id)
  expect_true("mdi" %in% iconify_sets()$prefix)
  expect_true("home" %in% iconify_icons("mdi"))
  expect_error(iconify_get("mdi:definitely-not-an-icon-xyz"), class = "iconifyr_not_found")
})
