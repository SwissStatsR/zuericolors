#' Get Zuericolors Palettes
#'
#' @description Function to access color values of a specific zuericolors palette.
#'
#' @param palette Name of a specific palette
#'
#' @param nth Position of a specific color in a palette
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
  
  # Available palettes in SSZ CI/CD
  paletteNames <- names(palettes)
  
  # Return all SZZ palettes in console
  if (missing(palette) & missing(nth)) {
    return(palettes)
  }
  
  # Return error message if palette (argument) is missing (but not position argument)
  if (missing(palette) & !missing(nth)) {
    warning <- c('You forgot to define a palette. Please choose one of the following palettes above.')
    stop(warning, cat(paletteNames, sep = "\n"))
  }
  
  # Transform palette (argument) for further use
  chosenPalette <- tolower(as.character(substitute(palette)))
  
  # Get colors and their positions from palette and nth (arguments)
  paletteOut <- palettes[[chosenPalette]]
  colorOut <- paletteOut[nth]
  
  # Return all colors if palette (argument) matches available SSZ palettes
  if (chosenPalette %in% paletteNames & !missing(nth)) {
    
    # Check if position (nth argument) is available in chosen palette (argument)
    paletteLast <- last(length(paletteOut))
    nCheck <- last(nth)
    
    # If position (nth argument) is > than length of chosen palette (argument), then return error message
    if (last(paletteLast < nCheck)) {
      warning <- paste0('The palette ', '"', chosenPalette, '"', ' contains ', paletteLast, ' colors. Please change color position parameter (nth).')
      stop(warning)
    } else {
      return(colorOut)
    }
  } 
  
  # Return colors if palette (argument) matches available SSZ palettes and position (nth argument) is defined
  if (chosenPalette %in% paletteNames) {
    return (colorOut)
  } else {
    warning <- paste0('The palette ', '"', chosenPalette, '"', ' does not exist. Have you checked for Typos? Please choose one of the following palettes above.')
    stop(warning, cat(paletteNames, sep = "\n"))
  }
}

#get_zuericolors()
#get_zuericolors("harmonic6")
#get_zuericolors("hArmonic6")
#get_zuericolors("harmonic6", nth = 3)
#get_zuericolors("harmonic6", nth = 2:4)
#get_zuericolors("harmonic6", nth = 5:7)
#get_zuericolors("harmonic6", nth = 20)
#get_zuericolors(palette = 1, nth = 1)
#get_zuericolors(nth = 1)
#get_zuericolors(harmonic6, 2)
#get_zuericolors("asdf",)