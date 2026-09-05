# ponytail: theme_hm_pres() and theme_hm_pub() differ only in text sizes and
# one margin, so the theme is defined once here and the exported wrappers just
# supply the numbers. Style changes then land in both by construction.
hm_theme <- function(title, subtitle, caption, text, strip, gap) {
  ggplot2::theme(
    # Title, subtitle and caption, all aligned to the plot rather than the panel
    plot.title = hm_element_text(
      size = title,
      face = "bold",
      color = "#222222",
      margin = ggplot2::margin(b = gap)
    ),
    plot.title.position = "plot",
    plot.subtitle = hm_element_text(
      size = subtitle,
      color = "#222222",
      margin = ggplot2::margin(b = gap)
    ),
    plot.caption = hm_element_text(
      size = caption,
      color = "#666666",
      margin = ggplot2::margin(t = gap),
      hjust = 0
    ),
    plot.caption.position = "plot",

    # Legend: no title or background, sat above the panel. Often needs manual
    # nudging per chart based on the plot coordinates.
    legend.position = "top",
    legend.text.align = 0,
    legend.background = ggplot2::element_blank(),
    legend.title = ggplot2::element_blank(),
    legend.key = ggplot2::element_blank(),
    legend.text = hm_element_text(
      size = text,
      color = "#222222"
    ),

    # Axes: no titles, no lines, ticks on x only
    axis.title = ggplot2::element_blank(),
    axis.text = hm_element_text(
      size = text,
      color = "#222222"
    ),
    axis.text.x = hm_element_text(margin = ggplot2::margin(5, b = 10)),
    axis.ticks = ggplot2::element_blank(),
    axis.line = ggplot2::element_blank(),
    axis.ticks.x = ggplot2::element_line(
      linetype = "solid",
      linewidth = 0.25,
      color = "#999999"
    ),
    axis.ticks.length.x = grid::unit(2.5, units = "pt"),

    # Gridlines: dashed major y only. Some charts want the opposite - add
    # panel.grid.major.x back in your own theme() call after this one.
    panel.grid.minor = ggplot2::element_blank(),
    panel.grid.major.y = ggplot2::element_line(
      color = "#999999",
      linetype = "dashed",
      linewidth = 0.15
    ),
    panel.grid.major.x = ggplot2::element_blank(),

    # White throughout, dropping ggplot's grey panel and facet strips
    panel.background = ggplot2::element_blank(),
    strip.background = ggplot2::element_rect(fill = "white"),
    strip.text = hm_element_text(size = strip, hjust = 0)
  )
}

#' Add hm theme to ggplot chart for presentations
#'
#' Large text sized for slides. Added to the end of a ggplot chain. Colours for
#' lines and bars are not set here - set them in your geoms as usual.
#'
#' @return A ggplot2 theme object.
#' @seealso [theme_hm_pub()] for the smaller publication sizing.
#' @keywords hm_style
#' @export
#' @examples
#' library(ggplot2)
#' ggplot(economics, aes(date, unemploy)) +
#'   geom_line() +
#'   labs(
#'     title = "Unemployed persons in the United States",
#'     subtitle = "Monthly aggregation from 1967 - 2015",
#'     caption = "Data source: {ggplot2} R package",
#'     x = NULL,
#'     y = NULL
#'   ) +
#'   theme_hm_pres()
theme_hm_pres <- function() {
  hm_theme(
    title = 24,
    subtitle = 20,
    caption = 12,
    text = 18,
    strip = 22,
    gap = 10
  )
}

#' Add hm theme to ggplot chart for publications
#'
#' As [theme_hm_pres()] but with text sized for a journal figure.
#'
#' @return A ggplot2 theme object.
#' @seealso [theme_hm_pres()] for the larger presentation sizing.
#' @keywords hm_style
#' @export
#' @examples
#' library(ggplot2)
#' ggplot(economics, aes(date, unemploy)) +
#'   geom_line() +
#'   labs(
#'     title = "Unemployed persons in the United States",
#'     subtitle = "Monthly aggregation from 1967 - 2015",
#'     caption = "Data source: {ggplot2} R package",
#'     x = NULL,
#'     y = NULL
#'   ) +
#'   theme_hm_pub()
theme_hm_pub <- function() {
  hm_theme(
    title = 14,
    subtitle = 12,
    caption = 8,
    text = 12,
    strip = 12,
    gap = 8
  )
}


default_font_family <- function() {
  if (roboto_usable())
    "Roboto"
  else
    "sans"
}
