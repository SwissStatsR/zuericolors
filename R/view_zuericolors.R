#' View Zuericolors Palettes
#'
#' @description Function to visually inspect values of a specific zuericolors palette
#'
#' @param palette character vector
#'
#' @return
#' @export
#'
#' @import scales
#' @import ggplot2
#' @import ggpubr
#'
#' @examples
#' # View colors of palette "harmonic6"
#' view_zuericolors("harmonic6")
view_zuericolors <- function(palette = " ") {
  choosenPalette <- deparse(substitute(palette))
  if (missing(palette))  {
    plotList <- lapply(names(palettes),
                       function(paletteName) {
                         name <- names(palettes[paletteName])
                         color <- palettes[[paletteName]]
                         value <- seq(1:length(color))
                         data <- data.frame(value, color)
                         p <- ggplot(data = data,
                                     aes(x = as.factor(value),
                                         fill = as.factor(value),
                                         label = color)) +
                           scale_fill_manual(values = c(color)) +
                           scale_y_continuous(limits = c(-1,1)) +
                           geom_bar() +
                           theme_void() +
                           labs(title = name) +
                           theme(legend.position = "none",
                                 axis.text.x = element_blank(),
                                 plot.title = element_text(size = 10,
                                                           hjust = 0.5))
                         p
                       })
    allplots <- ggarrange(plotlist = plotList)
    return(allplots)
  }
  if (is.null(palettes[[palette]])) {
    warning <- paste0('The palette ', choosenPalette, ' does not exist. Please choose one of the following:\n')
    availablePalettes <- names(palettes)
    return(cat(warning, availablePalettes, sep = "\n"))
  } else {
    name <- names(palettes[palette])
    color <- palettes[[palette]]
    value <- seq(1:length(color))
    data <- data.frame(value, color)
    p <- ggplot(data = data,
                aes(x = as.factor(value),
                    fill = as.factor(value),
                    label = color)) +
      scale_fill_manual(values = c(color)) +
      scale_y_continuous(limits = c(-1,1)) +
      geom_bar() +
      geom_text(y = -0.05,
                angle = 90,
                hjust = 1) +
      theme_void() +
      labs(title = name) +
      theme(legend.position = "none",
            axis.text.x = element_blank(),
            plot.title = element_text(size = 20,
                                      hjust = 0.5))
    return(p)
  }
}