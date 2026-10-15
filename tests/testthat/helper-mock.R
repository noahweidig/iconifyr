fake_resp <- function(body = "", status = 200L, type = "application/json") {
  httr2::response(
    status_code = status,
    headers = list(`Content-Type` = type),
    body = charToRaw(body)
  )
}

fake_svg <- function(path = "M0 0h24v24H0z") {
  sprintf(
    '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path fill="currentColor" d="%s"/></svg>',
    path
  )
}

local_no_cache <- function(env = parent.frame()) {
  withr::local_options(iconifyr.cache = FALSE, .local_envir = env)
}
