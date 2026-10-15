test_that("iconify_get requests the svg endpoint and returns the body", {
  local_no_cache()
  seen <- NULL
  httr2::local_mocked_responses(function(req) {
    seen <<- req
    fake_resp(fake_svg(), type = "image/svg+xml")
  })
  out <- iconify_get("mdi:home")
  expect_equal(out, fake_svg())
  expect_match(seen$url, "^https://api\\.iconify\\.design/mdi/home\\.svg$")
  expect_match(seen$options$useragent, "^iconifyr/")
})

test_that("iconify_get maps options to query parameters", {
  local_no_cache()
  seen <- NULL
  httr2::local_mocked_responses(function(req) {
    seen <<- req$url
    fake_resp(fake_svg(), type = "image/svg+xml")
  })
  iconify_get("mdi:home", color = "#ba3329", size = 48, flip = "both", rotate = 90)
  q <- httr2::url_parse(seen)$query
  expect_equal(q$color, "#ba3329")
  expect_equal(q$height, "48")
  expect_equal(q$flip, "horizontal,vertical")
  expect_equal(q$rotate, "90deg")
  expect_match(seen, "color=%23ba3329", fixed = TRUE)
})

test_that("iconify_get validates ids and options", {
  expect_error(iconify_get("home"), class = "iconifyr_invalid_id")
  expect_error(iconify_get("MDI:Home"), class = "iconifyr_invalid_id")
  expect_error(iconify_get(c("mdi:a", "mdi:b")), class = "iconifyr_invalid_id")
  expect_error(iconify_get(NA_character_), class = "iconifyr_invalid_id")
  expect_error(iconify_get("mdi:home", rotate = 45), "rotate")
  expect_error(iconify_get("mdi:home", flip = "diagonal"), "flip")
  expect_error(iconify_get("mdi:home", size = -1), "size")
  expect_error(iconify_get("mdi:home", color = 1), "color")
})

test_that("a 404 gives an informative unknown-icon error", {
  local_no_cache()
  httr2::local_mocked_responses(function(req) fake_resp("404", 404L, "text/plain"))
  expect_error(iconify_get("mdi:nope"), class = "iconifyr_not_found")
  expect_error(iconify_get("mdi:nope"), "mdi:nope")
})

test_that("other HTTP errors and non-SVG bodies are reported", {
  local_no_cache()
  httr2::local_mocked_responses(function(req) fake_resp("bad", 400L, "text/plain"))
  expect_error(iconify_get("mdi:home"), class = "iconifyr_http_error")
  httr2::local_mocked_responses(function(req) fake_resp("<html></html>", 200L, "text/html"))
  expect_error(iconify_get("mdi:home"), "did not return SVG")
})

test_that("requests retry on 429 and 5xx only", {
  req <- iconify_request("search", list(query = "home"))
  expect_equal(req$policies$retry_max_tries, 3)
  transient <- req$policies$retry_is_transient
  for (status in c(429L, 500L, 502L, 503L, 504L)) {
    expect_true(transient(fake_resp("", status)), info = status)
  }
  for (status in c(200L, 400L, 404L)) {
    expect_false(transient(fake_resp("", status)), info = status)
  }
})

test_that("a long Retry-After on 429 is not waited out", {
  transient <- iconify_request("search")$policies$retry_is_transient
  expect_true(transient(fake_resp("", 429L, headers = list(`Retry-After` = "2"))))
  expect_false(transient(fake_resp("", 429L, headers = list(`Retry-After` = "300"))))

  local_no_cache()
  httr2::local_mocked_responses(function(req) {
    fake_resp("", 429L, "text/plain", headers = list(`Retry-After` = "300"))
  })
  expect_error(iconify_get("mdi:home"), class = "iconifyr_rate_limited")
  expect_error(iconify_get("mdi:home"), "300 seconds")
})

test_that("httr2 retry-wait messages are muffled when not interactive", {
  expect_no_message(quiet_retry_messages(message("Waiting 3s for retry backoff")))
  expect_message(quiet_retry_messages(message("something else")), "something else")
})

test_that("the api option overrides the base url", {
  local_no_cache()
  withr::local_options(iconifyr.api = "https://icons.example.org/v1/")
  seen <- NULL
  httr2::local_mocked_responses(function(req) {
    seen <<- req$url
    fake_resp(fake_svg(), type = "image/svg+xml")
  })
  iconify_get("mdi:home")
  expect_equal(seen, "https://icons.example.org/v1/mdi/home.svg")
})

test_that("iconify_html wraps the svg in HTML", {
  local_no_cache()
  httr2::local_mocked_responses(function(req) fake_resp(fake_svg(), type = "image/svg+xml"))
  out <- iconify_html("mdi:home")
  expect_s3_class(out, "html")
  expect_equal(as.character(out), fake_svg())
})

test_that("iconify_download writes files and returns paths invisibly", {
  local_no_cache()
  httr2::local_mocked_responses(function(req) fake_resp(fake_svg(), type = "image/svg+xml"))
  dir <- file.path(withr::local_tempdir(), "icons")
  expect_invisible(paths <- iconify_download(c("mdi:home", "tabler:star"), dir = dir))
  expect_equal(basename(paths), c("mdi-home.svg", "tabler-star.svg"))
  expect_true(all(file.exists(paths)))
  expect_equal(readLines(paths[[1]], warn = FALSE), fake_svg())
  expect_error(iconify_download("nope", dir = dir), class = "iconifyr_invalid_id")
})

test_that("iconify_png renders with rsvg", {
  skip_if_not_installed("rsvg")
  local_no_cache()
  httr2::local_mocked_responses(function(req) fake_resp(fake_svg(), type = "image/svg+xml"))
  file <- withr::local_tempfile(fileext = ".png")
  expect_invisible(iconify_png("mdi:home", file, width = 32))
  expect_gt(file.size(file), 0)
  expect_equal(as.integer(dim(rsvg::rsvg(charToRaw(fake_svg()), width = 32))[1:2]), c(32L, 32L))
})

test_that("iconify_png fails clearly without rsvg", {
  local_mocked_bindings(is_installed = function(...) FALSE, .package = "rlang")
  expect_error(iconify_png("mdi:home", tempfile()), class = "iconifyr_missing_package")
})
