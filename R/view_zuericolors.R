#' View Zuericolors Palettes
#'
#' @description Function to visually inspect values of a specific zuericolors palette
#'
#' @param palette Name of a specific palette
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
view_zuericolors <- function(palette) {
  
  # Available palettes in SSZ CI/CD
  paletteNames <- names(palettes)
  
  # Transform palette (argument) for further use
  chosenPalette <<- tolower(as.character(substitute(palette)))
  
  # Return all SSZ palettes in a plot
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
    allplots <- ggarrange(plotlist = plotList,
                          ncol = 2,
                          nrow = 10)
    return(allplots)
  }
  
  # Return error message if palette (argument) does not match with available SSZ palettes 
  # Else return plot with chosen palette
  if (chosenPalette %in% paletteNames) {
    name <- chosenPalette
    color <- palettes[[chosenPalette]]
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
  } else {
    warning <- paste0('The palette ', '"', chosenPalette, '"', ' does not exist. Have you checked for Typos? Please choose one of the following palettes above.')
    stop(warning, cat(paletteNames, sep = "\n"))
  }
}

#view_zuericolors
#view_zuericolors("harmonic6)
#view_zuericolors("haRmonic6)
#view_zuericolors(harmonic6)