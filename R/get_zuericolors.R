#' Zuericolors Palettes
#'
#' @description Function to access color values of a specific zuericolors palette.
#'
#' @param palette Character that names the color palette
#'
#' @param nth Choose specific color of a specific palette
#'
#' @examples
#' # Get colors of palette "harmonic6"
#' get_zuericolors("harmonic6")
#'
#' # Get third color value of palette "harmonic6"
#' get_zuericolors("harmonic6", 3)
#'
#' # Get first three color values of palette "harmonic6"
#' get_zuericolors("harmonic6", 1:3)
#'
#' @export
get_zuericolors <- function(palette, nth) {
  choosenPalette <- deparse(substitute(palette))
  if (missing(palette) & missing(nth)) {
    lists <- palettes
    return(lists)
  }
  if (missing(palette) & !missing(nth)) {
    warning <- c('You have not defined a palette. Please choose one of the following:\n')
    availablePalettes <- names(palettes)
    return(cat(warning, availablePalettes, sep = "\n"))
  } else {
    palette <- palettes[[palette]]
    color <- palette[nth]
    if (is.null(color)) {
      warning <- paste0('The palette ', choosenPalette, ' does not exist. Please choose one of the following:\n')
      availablePalettes <- names(palettes)
      return(cat(warning, availablePalettes, sep = "\n"))
    } 
    else {
      return (color)
    }
  }
}