#' View Zuericolors Palettes
#'
#' @description Function to visually inspect values and colors of a specific zuericolors palette
#'
#' @param palette Name of a specific palette. if it is not provided, all palettes are plotted.
#'
#' @return returns a plot of the requested color/palette
#' @export
#'
#' @import scales
#' @import ggplot2
#' @import ggpubr
#'
#' @examples
#' view_zuericolors("qual12")
view_zuericolors <- function(palette) {

  # All Available palettes in zuericolors
  palette_names <- names(palettes)

  # Return all palettes in a plot if no palette provided
  if (missing(palette)) {
    plot_list <- lapply(names(palettes), function(palette_name) {
      name <- names(palettes[palette_name])
      color <- palettes[[palette_name]]
      value <- seq_len(length(color))
      data <- data.frame(value, color)
      p <- ggplot(data = data, aes(
        x = as.factor(value),
        fill = as.factor(value),
        label = color
      )) +
        scale_fill_manual(values = c(color)) +
        scale_y_continuous(limits = c(-1, 1)) +
        geom_bar() +
        theme_void() +
        labs(title = name) +
        theme(
          legend.position = "none",
          axis.text.x = element_blank(),
          plot.title = element_text(
            size = 10,
            hjust = 0.5
          )
        )
      p
    })
    allplots <- ggarrange(plotlist = plot_list, ncol = 2, nrow = 10)
    return(allplots)
  }

  # Transform palette (argument) for further use
  chosen_palette <- tolower(as.character(substitute(palette)))

  # Return error message if palette (argument) does not match with available
  # palettes
  if (!(chosen_palette %in% palette_names)) {
    message <- paste0(
      "The palette ", "\"", chosen_palette, "\"",
      " does not exist. Have you checked for Typos? Please choose one of the palettes above."
    )
    stop(message, cat(palette_names, sep = "\n"))
  }

  # a valid palette has been provided --> prepare plot and return
  name <- chosen_palette
  color <- palettes[[chosen_palette]]
  value <- seq_len(length(color))
  data <- data.frame(value, color)
  p <- ggplot(data = data, aes(
    x = as.factor(value),
    fill = as.factor(value),
    label = color
  )) +
    scale_fill_manual(values = c(color)) +
    scale_y_continuous(limits = c(-1, 1)) +
    geom_bar() +
    geom_text(y = -0.05, angle = 90, hjust = 1) +
    theme_void() +
    labs(title = name) +
    theme(
      legend.position = "none", axis.text.x = element_blank(),
      plot.title = element_text(size = 20, hjust = 0.5)
    )
  return(p)
}
