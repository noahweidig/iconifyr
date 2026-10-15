# Builds pkgdown/favicon/ without realfavicongenerator.net.
# File names match pkgdown >= 2.1.2's head template: favicon-96x96.png,
# favicon.svg, favicon.ico, apple-touch-icon.png, site.webmanifest.
# The mark is the logo's hexagon and star without the wordmark, which is
# unreadable at 16 px.
devtools::load_all(quiet = TRUE)

star <- sub('.*<path[^>]* d="([^"]+)".*', "\\1", iconify_get("mdi:star"))
navy <- "#1b2340"; gold <- "#f4b942"

hex <- sprintf(
  paste0(
    '<polygon points="300,22 540,161 540,439 300,578 60,439 60,161" fill="%s" ',
    'stroke="%s" stroke-width="34" stroke-linejoin="round"/>',
    '<path transform="translate(150 150) scale(12.5)" d="%s" fill="%s"/>'
  ),
  navy, gold, star, gold
)
svg_transparent <- sprintf(
  '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 600 600" width="600" height="600">%s</svg>', hex
)
# Opaque square for iOS / PWA icons; the hexagon stays inside the 80% safe zone.
svg_opaque <- sprintf(
  paste0(
    '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 600 600" width="600" height="600">',
    '<rect width="600" height="600" fill="%s"/>',
    '<g transform="translate(60 60) scale(0.8)">%s</g></svg>'
  ),
  navy, hex
)

dir <- "pkgdown/favicon"
unlink(dir, recursive = TRUE)
dir.create(dir, recursive = TRUE)
writeLines(svg_transparent, file.path(dir, "favicon.svg"))
png <- function(svg, file, size) {
  rsvg::rsvg_png(charToRaw(svg), file.path(dir, file), width = size, height = size)
}
png(svg_transparent, "favicon-96x96.png", 96)
png(svg_opaque, "apple-touch-icon.png", 180)
png(svg_opaque, "web-app-manifest-192x192.png", 192)
png(svg_opaque, "web-app-manifest-512x512.png", 512)

# favicon.ico: PNG-compressed entries at 16, 32 and 48 px.
sizes <- c(16L, 32L, 48L)
pngs <- lapply(sizes, function(s) rsvg::rsvg_png(charToRaw(svg_transparent), width = s, height = s))
u16 <- function(x) writeBin(as.integer(x), raw(), size = 2, endian = "little")
u32 <- function(x) writeBin(as.integer(x), raw(), size = 4, endian = "little")
offset <- 6L + 16L * length(sizes)
entries <- list()
for (i in seq_along(sizes)) {
  entries[[i]] <- c(
    as.raw(c(sizes[[i]], sizes[[i]], 0, 0)), u16(1), u16(32),
    u32(length(pngs[[i]])), u32(offset)
  )
  offset <- offset + length(pngs[[i]])
}
writeBin(
  c(u16(0), u16(1), u16(length(sizes)), unlist(entries), unlist(pngs)),
  file.path(dir, "favicon.ico")
)

writeLines(
  jsonlite::toJSON(list(
    name = "iconifyr",
    short_name = "iconifyr",
    icons = list(
      list(src = "web-app-manifest-192x192.png", sizes = "192x192", type = "image/png", purpose = "any"),
      list(src = "web-app-manifest-512x512.png", sizes = "512x512", type = "image/png", purpose = "any")
    ),
    theme_color = navy,
    background_color = navy,
    display = "standalone"
  ), auto_unbox = TRUE, pretty = TRUE),
  file.path(dir, "site.webmanifest")
)
