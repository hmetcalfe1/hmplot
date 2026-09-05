#' Add hm theme to ggplot chart for presentations
#'
#' This function allows you to add the hm theme to your ggplot graphics.
#' @keywords hm_style
#' @export
#' @examples
#' line <- ggplot(line_df, aes(x = year, y = lifeExp)) +
#' geom_line(colour = "#007f7f", size = 1) +
#' geom_hline(yintercept = 0, size = 1, colour="#333333") +
#' hm_style()

theme_hm_pres <- function() {
  ggplot2::theme(
    #Text format:
    #This sets the font, size, type and colour of text for the chart's title and aligns it to the plot, as well as setting a margin between the title and the subtitle
    plot.title = hm_element_text(
      size = 24,
      face = "bold",
      color = "#222222",
      margin = ggplot2::margin(b = 10)
    ),
    plot.title.position = "plot",
    #This sets the font, size, type and colour of text for the chart's subtitle, as well as setting a margin between the subtitle and the plot
    plot.subtitle = hm_element_text(
      size = 20,
      color = "#222222",
      margin = ggplot2::margin(b = 10)
    ),
    #This sets the font, size, type and colour of text for the chart's caption, and aligns it to the plot
    plot.caption = hm_element_text(
      size = 12,
      color = "#666666",
      margin = ggplot2::margin(t = 10),
      hjust = 0
    ),
    plot.caption.position = "plot",
    #This leaves the caption text element empty, because it is set elsewhere in the finalise plot function

    #Legend format
    #This sets the position and alignment of the legend, removes a title and backround for it and sets the requirements for any text within the legend. The legend may often need some more manual tweaking when it comes to its exact position based on the plot coordinates.
    legend.position = "top",
    legend.text.align = 0,
    legend.background = ggplot2::element_blank(),
    legend.title = ggplot2::element_blank(),
    legend.key = ggplot2::element_blank(),
    legend.text = hm_element_text(
      size = 18,
      color = "#222222"
    ),

    #Axis format
    #This sets the text font, size and colour for the axis test, as well as setting the margins and removes lines and ticks. In some cases, axis lines and axis ticks are things we would want to have in the chart - the cookbook shows examples of how to do so.
    axis.title = ggplot2::element_blank(),
    axis.text = hm_element_text(
      size = 18,
      color = "#222222"
    ),
    axis.text.x = hm_element_text(margin = ggplot2::margin(5, b = 10)),
    axis.ticks = ggplot2::element_blank(),
    axis.line = ggplot2::element_blank(),

    #Grid lines
    #This removes all minor gridlines and adds major y gridlines. In many cases you will want to change this to remove y gridlines and add x gridlines. The cookbook shows you examples for doing so
    panel.grid.minor = ggplot2::element_blank(),
    panel.grid.major.y = ggplot2::element_line(
      color = "#999999",
      linetype = "dashed",
      linewidth = 0.15
    ),
    panel.grid.major.x = ggplot2::element_blank(),
    axis.ticks.x = element_line(
      linetype = "solid",
      linewidth = 0.25,
      color = "#999999"
    ),
    axis.ticks.length.x = unit(2.5, units = "pt"),

    #Blank background
    #This sets the panel background as blank, removing the standard grey ggplot background colour from the plot
    panel.background = ggplot2::element_blank(),

    #Strip background (#This sets the panel background for facet-wrapped plots to white, removing the standard grey ggplot background colour and sets the title size of the facet-wrap title to font size 22)
    strip.background = ggplot2::element_rect(fill = "white"),
    strip.text = hm_element_text(size = 22, hjust = 0)
  )
}

#' Add hm theme to ggplot chart for publications
#'
#' This function allows you to add the hm theme to your ggplot graphics.
#' @keywords hm_style
#' @export
#' @examples
#' line <- ggplot(line_df, aes(x = year, y = lifeExp)) +
#' geom_line(colour = "#007f7f", size = 1) +
#' geom_hline(yintercept = 0, size = 1, colour="#333333") +
#' hm_style()

theme_hm_pub <- function() {
  ggplot2::theme(
    #Text format:
    #This sets the font, size, type and colour of text for the chart's title and aligns it to the plot, as well as setting a margin between the title and the subtitle
    plot.title = hm_element_text(
      size = 14,
      face = "bold",
      color = "#222222",
      margin = ggplot2::margin(b = 8)
    ),
    plot.title.position = "plot",
    #This sets the font, size, type and colour of text for the chart's subtitle, as well as setting a margin between the subtitle and the plot
    plot.subtitle = hm_element_text(
      size = 12,
      color = "#222222",
      margin = ggplot2::margin(b = 8)
    ),
    #This sets the font, size, type and colour of text for the chart's caption, and aligns it to the plot
    plot.caption = hm_element_text(
      size = 8,
      color = "#666666",
      margin = ggplot2::margin(t = 8),
      hjust = 0
    ),
    plot.caption.position = "plot",
    #This leaves the caption text element empty, because it is set elsewhere in the finalise plot function

    #Legend format
    #This sets the position and alignment of the legend, removes a title and backround for it and sets the requirements for any text within the legend. The legend may often need some more manual tweaking when it comes to its exact position based on the plot coordinates.
    legend.position = "top",
    legend.text.align = 0,
    legend.background = ggplot2::element_blank(),
    legend.title = ggplot2::element_blank(),
    legend.key = ggplot2::element_blank(),
    legend.text = hm_element_text(
      size = 12,
      color = "#222222"
    ),

    #Axis format
    #This sets the text font, size and colour for the axis test, as well as setting the margins and removes lines and ticks. In some cases, axis lines and axis ticks are things we would want to have in the chart - the cookbook shows examples of how to do so.
    axis.title = ggplot2::element_blank(),
    axis.text = hm_element_text(
      size = 12,
      color = "#222222"
    ),
    axis.text.x = hm_element_text(margin = ggplot2::margin(5, b = 10)),
    axis.ticks = ggplot2::element_blank(),
    axis.line = ggplot2::element_blank(),

    #Grid lines
    #This removes all minor gridlines and adds major y gridlines. In many cases you will want to change this to remove y gridlines and add x gridlines. The cookbook shows you examples for doing so
    panel.grid.minor = ggplot2::element_blank(),
    panel.grid.major.y = ggplot2::element_line(
      color = "#999999",
      linetype = "dashed",
      linewidth = 0.15
    ),
    panel.grid.major.x = ggplot2::element_blank(),
    axis.ticks.x = element_line(
      linetype = "solid",
      linewidth = 0.25,
      color = "#999999"
    ),
    axis.ticks.length.x = unit(2.5, units = "pt"),

    #Blank background
    #This sets the panel background as blank, removing the standard grey ggplot background colour from the plot
    panel.background = ggplot2::element_blank(),

    #Strip background (#This sets the panel background for facet-wrapped plots to white, removing the standard grey ggplot background colour and sets the title size of the facet-wrap title to font size 12)
    strip.background = ggplot2::element_rect(fill = "white"),
    strip.text = hm_element_text(size = 12, hjust = 0)
  )
}


default_font_family <- function() {
  if (roboto_usable())
    "Roboto"
  else
    "sans"
}
