# Low-level request helpers. Nothing here keeps state outside options and the
# on-disk cache.

iconify_api_url <- function() {
  url <- getOption("iconifyr.api", "https://api.iconify.design")
  if (!is.character(url) || length(url) != 1L || is.na(url) || !nzchar(url)) {
    cli::cli_abort(
      "Option {.code iconifyr.api} must be a single URL string.",
      class = "iconifyr_error"
    )
  }
  sub("/+$", "", url)
}

iconify_user_agent <- function() {
  version <- as.character(utils::packageVersion("iconifyr"))
  paste0("iconifyr/", version, " (https://github.com/noahweidig/iconifyr)")
}

iconify_request <- function(path, query = list()) {
  req <- httr2::request(iconify_api_url())
  req <- httr2::req_url_path_append(req, path)
  query <- Filter(Negate(is.null), query)
  if (length(query)) {
    req <- httr2::req_url_query(req, !!!query)
  }
  req <- httr2::req_user_agent(req, iconify_user_agent())
  req <- httr2::req_retry(
    req,
    max_tries = 3,
    is_transient = function(resp) httr2::resp_status(resp) %in% c(429L, 500:599),
    backoff = function(i) 0.5 * 2^(i - 1)
  )
  httr2::req_error(req, is_error = function(resp) FALSE)
}

# Perform a request and return the body as a string. `not_found` is the
# message used for a 404.
iconify_fetch <- function(req, not_found, call = rlang::caller_env()) {
  key <- req$url
  hit <- cache_read(key)
  if (!is.null(hit)) {
    return(hit)
  }

  resp <- tryCatch(
    httr2::req_perform(req),
    error = function(e) {
      cli::cli_abort(
        c(
          "Can't reach the Iconify API at {.url {iconify_api_url()}}.",
          i = "Check your connection or the {.code iconifyr.api} option."
        ),
        class = "iconifyr_network_error",
        parent = e,
        call = call
      )
    }
  )

  status <- httr2::resp_status(resp)
  if (status == 404L) {
    cli::cli_abort(not_found, class = "iconifyr_not_found", call = call, .envir = call)
  }
  if (status >= 400L) {
    cli::cli_abort(
      c(
        "Iconify API request failed with HTTP {status}.",
        i = "URL: {.url {key}}"
      ),
      class = "iconifyr_http_error",
      call = call
    )
  }

  body <- httr2::resp_body_string(resp)
  cache_write(key, body)
  body
}

parse_json <- function(text, call = rlang::caller_env()) {
  tryCatch(
    jsonlite::fromJSON(text, simplifyVector = FALSE),
    error = function(e) {
      cli::cli_abort(
        "The Iconify API returned a response that is not valid JSON.",
        class = "iconifyr_error",
        parent = e,
        call = call
      )
    }
  )
}
