chr1 <- function(x) {
  if (is.null(x) || length(x) == 0L) NA_character_ else as.character(x[[1]])
}

num1 <- function(x) {
  if (is.null(x) || length(x) == 0L) NA_real_ else as.numeric(x[[1]])
}

#' Search for icons
#'
#' Queries `/search`.
#'
#' @param query Search term.
#' @param prefixes Optional character vector of icon set prefixes to restrict
#'   the search to. A prefix ending in `"-"` matches partially, so `"mdi-"`
#'   matches `"mdi-light"`.
#' @param limit Maximum number of results, 1 to 999. The API returns at least
#'   32 results per request; extra results are dropped.
#'
#' @return A data frame with columns `id` (`"prefix:name"`), `prefix` and
#'   `name`.
#' @seealso [iconify_sets()], [iconify_icons()]
#' @export
#' @examplesIf identical(Sys.getenv("NOT_CRAN"), "true")
#' iconify_search("home", prefixes = c("mdi", "tabler"), limit = 40)
iconify_search <- function(query, prefixes = NULL, limit = 64) {
  if (!is.character(query) || length(query) != 1L || is.na(query) || !nzchar(trimws(query))) {
    cli::cli_abort("{.arg query} must be a single non-empty string.")
  }
  if (!is.numeric(limit) || length(limit) != 1L || !is.finite(limit) ||
        limit < 1 || limit > 999) {
    cli::cli_abort("{.arg limit} must be a number between 1 and 999.")
  }
  if (!is.null(prefixes) && (!is.character(prefixes) || anyNA(prefixes))) {
    cli::cli_abort("{.arg prefixes} must be a character vector or {.code NULL}.")
  }
  limit <- as.integer(limit)

  req <- iconify_request(
    "search",
    list(
      query = query,
      limit = max(limit, 32L),
      prefixes = if (length(prefixes)) paste(prefixes, collapse = ",")
    )
  )
  body <- iconify_fetch(req, not_found = c(
    "The search endpoint is not available on {.url {iconify_api_url()}}."
  ))
  res <- parse_json(body)

  ids <- as.character(unlist(res$icons))
  ids <- utils::head(ids, limit)
  parts <- strsplit(ids, ":", fixed = TRUE)
  data.frame(
    id = ids,
    prefix = vapply(parts, `[`, "", 1L),
    name = vapply(parts, `[`, "", 2L),
    stringsAsFactors = FALSE
  )
}

#' List icon sets
#'
#' Queries `/collections`.
#'
#' @return A data frame with one row per icon set and columns `prefix`,
#'   `name`, `author`, `license_spdx`, `license_title` and `total`. Missing
#'   values are `NA`.
#' @seealso [iconify_icons()], [iconify_license()]
#' @export
#' @examplesIf identical(Sys.getenv("NOT_CRAN"), "true")
#' sets <- iconify_sets()
#' head(sets)
iconify_sets <- function() {
  req <- iconify_request("collections")
  body <- iconify_fetch(req, not_found = c(
    "The collections endpoint is not available on {.url {iconify_api_url()}}."
  ))
  sets_df(parse_json(body))
}

sets_df <- function(res) {
  prefixes <- names(res) %||% character()
  data.frame(
    prefix = prefixes,
    name = vapply(res, function(x) chr1(x$name), "", USE.NAMES = FALSE),
    author = vapply(res, function(x) chr1(x$author$name), "", USE.NAMES = FALSE),
    license_spdx = vapply(res, function(x) chr1(x$license$spdx), "", USE.NAMES = FALSE),
    license_title = vapply(res, function(x) chr1(x$license$title), "", USE.NAMES = FALSE),
    total = vapply(res, function(x) num1(x$total), 0, USE.NAMES = FALSE),
    stringsAsFactors = FALSE
  )
}

#' List the icons in a set
#'
#' Queries `/collection`. Returns the icons the API lists as visible: the
#' uncategorized icons plus every categorized icon. Aliases and hidden icons
#' exist and can be fetched with [iconify_get()], but are not included.
#'
#' @param prefix Icon set prefix, e.g. `"mdi"`.
#'
#' @return A sorted character vector of icon names (without the prefix).
#' @seealso [iconify_sets()], [iconify_search()]
#' @export
#' @examplesIf identical(Sys.getenv("NOT_CRAN"), "true")
#' head(iconify_icons("tabler"))
iconify_icons <- function(prefix) {
  check_prefix(prefix)
  req <- iconify_request("collection", list(prefix = prefix))
  body <- iconify_fetch(req, not_found = c(
    "Icon set {.val {prefix}} not found or can't be browsed.",
    i = "List available sets with {.fn iconify_sets}."
  ))
  res <- parse_json(body)
  names <- c(unlist(res$uncategorized), unlist(res$categories, use.names = FALSE))
  sort(unique(as.character(names)))
}
