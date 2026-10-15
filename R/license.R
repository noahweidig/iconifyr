#' Get license and author information
#'
#' Looks up the icon set's license and author via `/collections`. Prints a
#' message when the license requires attribution (any Creative Commons
#' Attribution license such as CC BY 4.0, and ODbL).
#'
#' Permissive licenses such as MIT or Apache-2.0 do not require attribution in
#' this sense but still require keeping the license notice. This function is
#' not legal advice; check the license URL.
#'
#' @param id_or_prefix An icon id (`"mdi:home"`) or a set prefix (`"mdi"`).
#' @param quiet If `TRUE`, don't emit the attribution message.
#'
#' @return A list of class `iconify_license` with elements `prefix`, `set`,
#'   `license`, `spdx`, `url`, `author`, `author_url` and
#'   `attribution_required` (`NA` when the set has no license data).
#' @seealso [iconify_sets()]
#' @export
#' @examplesIf identical(Sys.getenv("NOT_CRAN"), "true")
#' iconify_license("mdi")
#' iconify_license("fa6-solid:house")
iconify_license <- function(id_or_prefix, quiet = FALSE) {
  if (is.character(id_or_prefix) && length(id_or_prefix) == 1L &&
        !is.na(id_or_prefix) && grepl(":", id_or_prefix, fixed = TRUE)) {
    check_id(id_or_prefix, arg = "id_or_prefix")
    prefix <- split_id(id_or_prefix)$prefix
  } else {
    check_prefix(id_or_prefix, arg = "id_or_prefix")
    prefix <- id_or_prefix
  }

  req <- iconify_request("collections", list(prefix = prefix))
  body <- iconify_fetch(req, not_found = c(
    "Icon set {.val {prefix}} not found.",
    i = "List available sets with {.fn iconify_sets}."
  ))
  res <- parse_json(body)
  info <- res[[prefix]]
  if (is.null(info)) {
    cli::cli_abort(
      c(
        "Icon set {.val {prefix}} not found.",
        i = "List available sets with {.fn iconify_sets}."
      ),
      class = "iconifyr_not_found"
    )
  }

  spdx <- chr1(info$license$spdx)
  title <- chr1(info$license$title)
  out <- structure(
    list(
      prefix = prefix,
      set = chr1(info$name),
      license = title,
      spdx = spdx,
      url = chr1(info$license$url),
      author = chr1(info$author$name),
      author_url = chr1(info$author$url),
      attribution_required = needs_attribution(spdx, title)
    ),
    class = "iconify_license"
  )

  if (!quiet) {
    if (isTRUE(out$attribution_required)) {
      cli::cli_alert_warning(
        "{.val {out$set}} ({.val {prefix}}) is licensed {.val {out$license}}: attribution is required. Credit {.val {out$author}}."
      )
    } else if (is.na(out$attribution_required)) {
      cli::cli_alert_info(
        "No license data for {.val {prefix}}. Check the icon set's source before use."
      )
    }
  }
  out
}

needs_attribution <- function(spdx, title) {
  if (is.na(spdx) && is.na(title)) {
    return(NA)
  }
  label <- if (is.na(spdx)) title else spdx
  grepl("^CC[- ]BY|^ODbL", label, ignore.case = TRUE)
}

#' @export
print.iconify_license <- function(x, ...) {
  cli::cli_text("{.strong {x$set}} ({.val {x$prefix}})")
  cli::cli_dl(c(
    License = if (is.na(x$license)) "unknown" else x$license,
    SPDX = if (is.na(x$spdx)) "unknown" else x$spdx,
    `License URL` = if (is.na(x$url)) "unknown" else x$url,
    Author = if (is.na(x$author)) "unknown" else x$author,
    `Author URL` = if (is.na(x$author_url)) "unknown" else x$author_url,
    `Attribution required` = if (is.na(x$attribution_required)) "unknown" else
      if (x$attribution_required) "yes" else "no"
  ))
  invisible(x)
}
