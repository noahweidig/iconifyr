#' Get an icon as SVG
#'
#' Fetches `/{prefix}/{name}.svg` from the Iconify API.
#'
#' @param id Icon id of the form `"prefix:name"`, e.g. `"mdi:home"`.
#' @param color Icon color: a CSS color name or hex string such as
#'   `"#ba3329"`. Only affects monotone icons.
#' @param size Icon height in pixels, or `"auto"`, `"unset"` or `"none"`. The
#'   width follows the icon's aspect ratio. `NULL` keeps the API default
#'   (`1em`).
#' @param flip One or more of `"horizontal"`, `"vertical"`, `"both"`.
#' @param rotate `90`, `180` or `270` degrees (`"90deg"` also works). When
#'   combined with `flip`, the icon is flipped first.
#'
#' @return A length-1 character vector containing the SVG markup.
#' @seealso [iconify_html()], [iconify_download()], [iconify_png()]
#' @export
#' @examplesIf identical(Sys.getenv("NOT_CRAN"), "true")
#' svg <- iconify_get("mdi:home", color = "#ba3329", size = 48)
#' cat(svg)
iconify_get <- function(id, color = NULL, size = NULL, flip = NULL, rotate = NULL) {
  check_id(id)
  query <- svg_query(color, size, flip, rotate)
  parts <- split_id(id)
  req <- iconify_request(c(parts$prefix, paste0(parts$name, ".svg")), query)
  svg <- iconify_fetch(
    req,
    not_found = c(
      "Icon {.val {id}} not found.",
      i = "Check the prefix and name with {.fn iconify_search} or {.fn iconify_icons}."
    )
  )
  if (!grepl("^\\s*<svg", svg)) {
    cli::cli_abort(
      "The Iconify API did not return SVG for {.val {id}}.",
      class = "iconifyr_error"
    )
  }
  svg
}

#' Download icons as SVG files
#'
#' Writes one `.svg` file per icon. Files are named `{prefix}-{name}.svg`.
#'
#' @param id Character vector of icon ids (`"prefix:name"`).
#' @param dir Output directory. Created if it does not exist.
#' @param ... Passed to [iconify_get()] (`color`, `size`, `flip`, `rotate`).
#'
#' @return The file paths, invisibly.
#' @seealso [iconify_get()]
#' @export
#' @examplesIf identical(Sys.getenv("NOT_CRAN"), "true")
#' paths <- iconify_download(c("mdi:home", "tabler:star"), dir = tempdir())
#' basename(paths)
iconify_download <- function(id, dir = ".", ...) {
  check_ids(id)
  if (!is.character(dir) || length(dir) != 1L || is.na(dir)) {
    cli::cli_abort("{.arg dir} must be a single path.")
  }
  svgs <- lapply(id, iconify_get, ...)
  dir.create(dir, recursive = TRUE, showWarnings = FALSE)
  paths <- file.path(dir, paste0(sub(":", "-", id, fixed = TRUE), ".svg"))
  for (i in seq_along(id)) {
    writeLines(svgs[[i]], paths[[i]], useBytes = TRUE)
  }
  invisible(paths)
}

#' Inline an icon as HTML
#'
#' Returns the icon's SVG as [htmltools::HTML()], ready to print in R Markdown
#' or Quarto chunks (`results = "asis"`), inline code, or Shiny UI.
#'
#' @inheritParams iconify_get
#' @param ... Passed to [iconify_get()] (`color`, `size`, `flip`, `rotate`).
#'
#' @return An object of class `html` (see [htmltools::HTML()]).
#' @seealso [iconify_get()]
#' @export
#' @examplesIf identical(Sys.getenv("NOT_CRAN"), "true")
#' iconify_html("mdi:home", color = "steelblue")
iconify_html <- function(id, ...) {
  htmltools::HTML(iconify_get(id, ...))
}

#' Render an icon to PNG
#'
#' Requires the suggested package rsvg.
#'
#' @inheritParams iconify_get
#' @param file Output PNG path.
#' @param width Width in pixels. The icon is requested at this height and
#'   rendered at this width.
#' @param ... Passed to [iconify_get()] (`color`, `flip`, `rotate`).
#'
#' @return `file`, invisibly.
#' @seealso [iconify_get()]
#' @export
#' @examplesIf identical(Sys.getenv("NOT_CRAN"), "true") && rlang::is_installed("rsvg")
#' iconify_png("mdi:home", tempfile(fileext = ".png"), width = 64)
iconify_png <- function(id, file, width = 128, ...) {
  if (!rlang::is_installed("rsvg")) {
    cli::cli_abort(
      c(
        "{.fn iconify_png} needs the {.pkg rsvg} package.",
        i = "Install it with {.code install.packages(\"rsvg\")}."
      ),
      class = "iconifyr_missing_package"
    )
  }
  check_id(id)
  if (!is.character(file) || length(file) != 1L || is.na(file)) {
    cli::cli_abort("{.arg file} must be a single path.")
  }
  if (!is.numeric(width) || length(width) != 1L || !is.finite(width) || width <= 0) {
    cli::cli_abort("{.arg width} must be a positive number.")
  }
  svg <- iconify_get(id, size = width, ...)
  rsvg::rsvg_png(charToRaw(svg), file = file, width = width)
  invisible(file)
}
