# Builds man/figures/logo.svg and logo.png using iconifyr itself.
# Icons: Material Design Icons (Apache-2.0), https://pictogrammers.com/library/mdi/
devtools::load_all(quiet = TRUE)

ids <- c(
  "mdi:home", "mdi:heart", "mdi:bell",
  "mdi:cog", "mdi:star", "mdi:camera",
  "mdi:magnify", "mdi:bookmark", "mdi:account"
)
path_d <- function(id) {
  svg <- iconify_get(id)
  sub('.*<path[^>]* d="([^"]+)".*', "\\1", svg)
}

tile <- 64; gap <- 14; x0 <- 149; y0 <- 168
scale <- 38 / 24
tiles <- vapply(seq_along(ids), function(i) {
  col <- (i - 1) %% 3; row <- (i - 1) %/% 3
  x <- x0 + col * (tile + gap); y <- y0 + row * (tile + gap)
  hi <- ids[[i]] == "mdi:star"
  sprintf(
    paste0(
      '<rect x="%d" y="%d" width="%d" height="%d" rx="14" fill="%s"/>',
      '<g transform="translate(%.1f %.1f) scale(%.4f)"><path d="%s" fill="%s"/></g>'
    ),
    x, y, tile, tile, if (hi) "#f4b942" else "#ffffff", 
    x + (tile - 38) / 2, y + (tile - 38) / 2, scale, path_d(ids[[i]]),
    if (hi) "#1b2340" else "#ffffff"
  )
}, "")
tiles <- sub('fill="#ffffff"/><g', 'fill="#ffffff" fill-opacity="0.14"/><g', tiles, fixed = TRUE)
tiles <- sub('<path d="([^"]+)" fill="#ffffff"/>', '<path d="\\1" fill="#ffffff" fill-opacity="0.9"/>', tiles)

svg <- sprintf('<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 518 600" width="518" height="600">
<defs><linearGradient id="bg" x1="0" y1="0" x2="1" y2="1"><stop offset="0" stop-color="#2b3a6b"/><stop offset="1" stop-color="#141a33"/></linearGradient></defs>
<polygon points="259,6 512,153 512,447 259,594 6,447 6,153" fill="url(#bg)" stroke="#f4b942" stroke-width="12" stroke-linejoin="round"/>
%s
<text x="259" y="505" text-anchor="middle" font-family="Helvetica, Arial, sans-serif" font-weight="700" font-size="68" fill="#ffffff">iconifyr</text>
</svg>', paste(tiles, collapse = "\n"))

writeLines(svg, "man/figures/logo.svg")
rsvg::rsvg_png("man/figures/logo.svg", "man/figures/logo.png", width = 240)
