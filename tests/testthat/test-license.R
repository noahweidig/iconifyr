collections_json <- '{
  "fa6-solid": {"name": "Font Awesome 6 Solid", "total": 1388,
    "author": {"name": "Dave Gandy", "url": "https://gh"},
    "license": {"title": "CC BY 4.0", "spdx": "CC-BY-4.0", "url": "https://cc"}}
}'

test_that("iconify_license warns when attribution is required", {
  local_no_cache()
  httr2::local_mocked_responses(function(req) fake_resp(collections_json))
  expect_message(out <- iconify_license("fa6-solid:house"), "attribution is required")
  expect_s3_class(out, "iconify_license")
  expect_equal(out$prefix, "fa6-solid")
  expect_equal(out$spdx, "CC-BY-4.0")
  expect_equal(out$author, "Dave Gandy")
  expect_equal(out$url, "https://cc")
  expect_true(out$attribution_required)
  expect_silent(iconify_license("fa6-solid", quiet = TRUE))
})

test_that("iconify_license is quiet for permissive licenses", {
  local_no_cache()
  json <- '{"mdi": {"name": "Material Design Icons", "total": 1,
    "author": {"name": "P"}, "license": {"title": "Apache 2.0", "spdx": "Apache-2.0"}}}'
  httr2::local_mocked_responses(function(req) fake_resp(json))
  expect_no_message(out <- iconify_license("mdi"))
  expect_false(out$attribution_required)
})

test_that("iconify_license handles missing license and unknown sets", {
  local_no_cache()
  httr2::local_mocked_responses(function(req) fake_resp('{"odd": {"name": "Odd", "total": 1}}'))
  expect_message(out <- iconify_license("odd"), "No license data")
  expect_true(is.na(out$attribution_required))
  httr2::local_mocked_responses(function(req) fake_resp("{}"))
  expect_error(iconify_license("zzz"), class = "iconifyr_not_found")
  expect_error(iconify_license("Not Valid"), class = "iconifyr_invalid_prefix")
  expect_error(iconify_license("a:b:c"), class = "iconifyr_invalid_id")
})

test_that("print method shows license details", {
  local_no_cache()
  httr2::local_mocked_responses(function(req) fake_resp(collections_json))
  out <- iconify_license("fa6-solid", quiet = TRUE)
  expect_output(print(out), "CC BY 4.0")
})
