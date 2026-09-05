# ponytail: resolve the font family at DRAW time, not when hm_style() is
# called. The device current when a plot object is built (typically RStudio's
# cairo/GDI device) is usually not the device it is finally drawn on (ragg,
# via ggsave). Baking the family in at build time freezes the wrong answer.

hm_element_text <- S7::new_class(
  "hm_element_text",
  package = "hmplot",
  parent = ggplot2::element_text
)

#' @importFrom ggplot2 element_grob
# `method<-` needs a bare name on the left, so alias the generic first.
element_grob <- ggplot2::element_grob

S7::method(element_grob, hm_element_text) <- function(element, ...) {
  element@family <- default_font_family()
  # element_grob is an S3 generic, so drop back to a plain element_text
  # rather than S7::super() (which S3 dispatch cannot consume).
  ggplot2::element_grob(S7::convert(element, ggplot2::element_text), ...)
}
