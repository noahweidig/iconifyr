test_that("responses are cached on disk and reused", {
  withr::local_options(
    iconifyr.cache = TRUE,
    iconifyr.cache_dir = file.path(withr::local_tempdir(), "cache")
  )
  n <- 0L
  httr2::local_mocked_responses(function(req) {
    n <<- n + 1L
    fake_resp(fake_svg(), type = "image/svg+xml")
  })
  iconify_get("mdi:home")
  iconify_get("mdi:home")
  expect_equal(n, 1L)
  iconify_get("mdi:home", size = 32)
  expect_equal(n, 2L)
  expect_true(length(list.files(getOption("iconifyr.cache_dir"))) == 2L)

  expect_invisible(iconify_cache_clear())
  expect_false(dir.exists(getOption("iconifyr.cache_dir")))
  iconify_get("mdi:home")
  expect_equal(n, 3L)
})

test_that("caching can be disabled and failures are not cached", {
  withr::local_options(
    iconifyr.cache = FALSE,
    iconifyr.cache_dir = file.path(withr::local_tempdir(), "cache")
  )
  httr2::local_mocked_responses(function(req) fake_resp(fake_svg(), type = "image/svg+xml"))
  iconify_get("mdi:home")
  expect_false(dir.exists(getOption("iconifyr.cache_dir")))

  options(iconifyr.cache = TRUE)
  httr2::local_mocked_responses(function(req) fake_resp("404", 404L, "text/plain"))
  expect_error(iconify_get("mdi:nope"), class = "iconifyr_not_found")
  expect_length(list.files(getOption("iconifyr.cache_dir")), 0L)
})

test_that("iconify_cache_clear works when there is no cache", {
  withr::local_options(iconifyr.cache_dir = file.path(withr::local_tempdir(), "none"))
  expect_true(iconify_cache_clear())
})

test_that("the default cache location uses R_user_dir", {
  withr::local_options(iconifyr.cache_dir = NULL)
  expect_equal(cache_dir(), tools::R_user_dir("iconifyr", "cache"))
})
