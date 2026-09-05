## hmplot

`hmplot` provides helper functions for creating and exporting ggplot2 graphics
in a consistent house style. It began as a fork of
[bbc/bbplot](https://github.com/bbc/bbplot).

## Installing hmplot

`hmplot` is not on CRAN, so you will have to install it directly from GitHub
using `devtools`.

If you do not have the `devtools` package installed, you will have to run the
first line in the code below as well.

```r
# install.packages('devtools')
devtools::install_github('hmetcalfe1/hmplot')
```

## Using the functions

The package has three functions: two themes, `theme_hm_pres()` and
`theme_hm_pub()`, and an export helper, `finalise_plot()`.

### `theme_hm_pres()` and `theme_hm_pub()`

Both take no arguments and are added to the end of a ggplot chain. They set
text size, font and colour, gridlines, axis text and the other standard chart
components to house style.

The two differ **only in text sizing**:

| | title | subtitle | caption | axis & legend | facet strip |
|---|---|---|---|---|---|
| `theme_hm_pres()` — slides | 24 | 20 | 12 | 18 | 22 |
| `theme_hm_pub()` — journal figures | 14 | 12 | 8 | 12 | 12 |

Everything else — colours, dashed y gridlines, x ticks, white background — is
shared, so a style change applies to both.

The themes do not adapt to the type of chart you are making, so in some cases
you will want to add your own `theme()` call afterwards, for example to swap
which gridlines are shown. Note also that series colours (line colours, bar
fills) are not set by the theme and need to be set in your geoms as usual.

```r
library(ggplot2)
library(hmplot)

line <- ggplot(line_df, aes(x = year, y = lifeExp)) +
  geom_line(colour = "#007f7f", linewidth = 1) +
  geom_hline(yintercept = 0, linewidth = 1, colour = "#333333") +
  theme_hm_pres()
```

### Fonts

The themes use **Roboto**. The package bundles all four faces and registers
them with `systemfonts` when it loads, so you do not need to install anything —
but a registered font is only visible to `ragg` graphics devices.

- **Saving** with `ggsave()` gets Roboto automatically, since ggplot2 routes
  PNG output through `ragg` when it is installed.
- **On screen**, set RStudio's graphics backend to AGG
  (*Tools > Global Options > General > Graphics > Backend*). Without it,
  previews fall back to `sans` — silently and without warnings. The saved file
  is still in Roboto either way.

If Roboto is installed system-wide, it is used everywhere regardless.

### `finalise_plot()`

Saves your plot with title, subtitle and source left-aligned to the plot, and a
footer rule with your source text and an optional logo.

`finalise_plot(plot_name, source_name, save_filepath, width_pixels, height_pixels, logo_image_path)`

* `plot_name`: the variable holding the plot you want to save.
* `source_name`: the source text for the bottom left of the plot. Include the
  word `"Source:"` yourself, e.g. `source_name = "Source: ONS"`.
* `save_filepath`: the filepath to save to, including the `.png` extension.
  Relative to your working directory, e.g. `charts/line_chart.png`.
* `width_pixels`: defaults to 640.
* `height_pixels`: defaults to 450.
* `logo_image_path`: path to a PNG logo for the bottom right of the footer.
  Defaults to `NULL`, i.e. no logo. A wide, thin image works best.

Call it once your chart data, titles and theme are finalised:

```r
finalise_plot(
  plot_name = my_line_plot,
  source_name = "Source: ONS",
  save_filepath = "charts/line_chart.png",
  width_pixels = 640,
  height_pixels = 550
)
```
