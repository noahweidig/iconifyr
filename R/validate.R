id_pattern <- "^[a-z0-9]+(-[a-z0-9]+)*:[a-z0-9]+(-[a-z0-9]+)*$"
prefix_pattern <- "^[a-z0-9]+(-[a-z0-9]+)*$"

check_id <- function(id, arg = rlang::caller_arg(id), call = rlang::caller_env()) {
  if (!is.character(id) || length(id) != 1L || is.na(id) || !grepl(id_pattern, id)) {
    shown <- if (is.character(id) && length(id) == 1L && !is.na(id)) id else NULL
    cli::cli_abort(
      c(
        "{.arg {arg}} must be a single icon id of the form {.val prefix:name}.",
        x = if (!is.null(shown)) "Got {.val {shown}}.",
        i = "Example: {.val mdi:home}."
      ),
      class = "iconifyr_invalid_id",
      call = call
    )
  }
  invisible(id)
}

check_ids <- function(id, arg = rlang::caller_arg(id), call = rlang::caller_env()) {
  if (!is.character(id) || length(id) == 0L) {
    cli::cli_abort(
      "{.arg {arg}} must be a character vector of icon ids.",
      class = "iconifyr_invalid_id",
      call = call
    )
  }
  for (one in id) {
    check_id(one, arg = arg, call = call)
  }
  invisible(id)
}

check_prefix <- function(prefix, arg = rlang::caller_arg(prefix), call = rlang::caller_env()) {
  if (!is.character(prefix) || length(prefix) != 1L || is.na(prefix) ||
        !grepl(prefix_pattern, prefix)) {
    cli::cli_abort(
      c(
        "{.arg {arg}} must be a single icon set prefix such as {.val mdi}.",
        i = "Prefixes are lowercase letters, digits and hyphens."
      ),
      class = "iconifyr_invalid_prefix",
      call = call
    )
  }
  invisible(prefix)
}

split_id <- function(id) {
  parts <- strsplit(id, ":", fixed = TRUE)[[1]]
  list(prefix = parts[[1]], name = parts[[2]])
}

# Turn user-facing svg options into API query parameters.
svg_query <- function(color = NULL, size = NULL, flip = NULL, rotate = NULL,
                      call = rlang::caller_env()) {
  if (!is.null(color)) {
    if (!is.character(color) || length(color) != 1L || is.na(color) || !nzchar(color)) {
      cli::cli_abort("{.arg color} must be a single string such as {.val #ba3329}.", call = call)
    }
  }

  if (!is.null(size)) {
    ok <- (is.numeric(size) && length(size) == 1L && is.finite(size) && size > 0) ||
      (is.character(size) && length(size) == 1L && !is.na(size) &&
         grepl("^([0-9.]+(px)?|auto|unset|none)$", size))
    if (!ok) {
      cli::cli_abort(
        c(
          "{.arg size} must be a positive number or one of {.val auto}, {.val unset}, {.val none}.",
          i = "It sets the icon height; the width follows the icon's aspect ratio."
        ),
        call = call
      )
    }
    size <- as.character(size)
  }

  if (!is.null(flip)) {
    flip <- unique(rlang::arg_match(
      flip, c("horizontal", "vertical", "both"), multiple = TRUE, error_call = call
    ))
    if ("both" %in% flip) {
      flip <- c("horizontal", "vertical")
    }
    flip <- paste(sort(flip), collapse = ",")
  }

  if (!is.null(rotate)) {
    deg <- suppressWarnings(as.numeric(sub("deg$", "", as.character(rotate))))
    if (length(rotate) != 1L || is.na(deg) || !deg %in% c(90, 180, 270)) {
      cli::cli_abort(
        "{.arg rotate} must be one of {.val 90}, {.val 180}, {.val 270} (or {.val 90deg}, ...).",
        call = call
      )
    }
    rotate <- paste0(deg, "deg")
  }

  list(color = color, height = size, flip = flip, rotate = rotate)
}
