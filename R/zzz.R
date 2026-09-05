# R/zzz.R
.onLoad <- function(libname, pkgname) {
  S7::methods_register()
  if (requireNamespace("systemfonts", quietly = TRUE)) {
    register_bundled_roboto(pkgname)
  }
}

register_bundled_roboto <- function(pkgname) {
  font_dir <- system.file("fonts", package = pkgname)
  if (!nzchar(font_dir)) {
    return(invisible(NULL))
  }

  f <- function(name) file.path(font_dir, name)

  tryCatch(
    systemfonts::register_font(
      name = "Roboto",
      plain = f("Roboto-Regular.ttf"),
      bold = f("Roboto-Bold.ttf"),
      italic = f("Roboto-Italic.ttf"),
      bolditalic = f("Roboto-BoldItalic.ttf")
    ),
    error = function(e) NULL
  )
  invisible(NULL)
}

# ponytail: probe the *active* device rather than trusting that ragg is
# installed. Roboto is only in the systemfonts registry (not the OS font DB),
# so cairo/GDI devices warn "font family not found" and silently fall back.
roboto_usable <- function() {
  ok <- TRUE
  tryCatch(
    withCallingHandlers(
      grid::convertWidth(
        grid::grobWidth(
          grid::textGrob("Rg", gp = grid::gpar(fontfamily = "Roboto"))
        ),
        "pt"
      ),
      warning = function(w) {
        ok <<- FALSE
        invokeRestart("muffleWarning")
      }
    ),
    error = function(e) ok <<- FALSE
  )
  ok
}
