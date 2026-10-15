cache_enabled <- function() {
  isTRUE(getOption("iconifyr.cache", TRUE))
}

cache_dir <- function() {
  getOption("iconifyr.cache_dir", tools::R_user_dir("iconifyr", "cache"))
}

cache_path <- function(key) {
  file.path(cache_dir(), rlang::hash(key))
}

cache_read <- function(key) {
  if (!cache_enabled()) {
    return(NULL)
  }
  path <- cache_path(key)
  if (!file.exists(path)) {
    return(NULL)
  }
  tryCatch(
    paste(readLines(path, warn = FALSE, encoding = "UTF-8"), collapse = "\n"),
    error = function(e) NULL
  )
}

cache_write <- function(key, body) {
  if (!cache_enabled()) {
    return(invisible(FALSE))
  }
  ok <- tryCatch(
    {
      dir.create(cache_dir(), recursive = TRUE, showWarnings = FALSE)
      writeLines(body, cache_path(key), useBytes = TRUE)
      TRUE
    },
    error = function(e) FALSE,
    warning = function(w) FALSE
  )
  invisible(ok)
}

#' Clear the iconifyr cache
#'
#' Deletes every response cached on disk. Responses are cached when the option
#' `iconifyr.cache` is `TRUE` (the default), in the directory returned by
#' `tools::R_user_dir("iconifyr", "cache")`. Set `options(iconifyr.cache =
#' FALSE)` to turn caching off. The directory can be changed with the option
#' `iconifyr.cache_dir`.
#'
#' @return `TRUE` invisibly if the cache directory was removed or did not
#'   exist, `FALSE` if it could not be removed.
#' @export
#' @examples
#' iconify_cache_clear()
iconify_cache_clear <- function() {
  dir <- cache_dir()
  if (!dir.exists(dir)) {
    return(invisible(TRUE))
  }
  invisible(unlink(dir, recursive = TRUE) == 0L)
}
