#' Get Zuericolors Palettes
#'
#' @description Function to access color values of a specific zuericolors palette.
#'
#' @param palette Name of a specific palette
#'
#' @param nth Position of a specific color in a palette, optional
#'
#' @return the color(s) as hex strings
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
#' @export
get_zuericolors <- function(palette, nth) {

  # All Available palettes in zuericolors
  paletteNames <- names(palettes)

  # Return all palettes in console when both function arguments are missing
  if (missing(palette) & missing(nth)) {
    warning("Please choose one of the available palettes.")
    return(palettes)
  }

  # Return error message if palette argument is missing but position argument (named) has been provided
  if (missing(palette) & !missing(nth)) {
    warning <- c("You forgot to define a palette. Please choose one of the palettes above.")
    stop(warning, cat(paletteNames, sep = "\n"))
  }

  # Transform palette (argument) for further use
  chosenPalette <- tolower(as.character(substitute(palette)))

  # Return error message if palette argument does not match one of the palettes
  if (!(chosenPalette %in% paletteNames)) {
    warning <- paste0("The palette ", '"', chosenPalette, '"', " does not exist. Have you checked for Typos? Please choose one of the palettes above.")
    stop(warning, cat(paletteNames, sep = "\n"))
  }

  # Get color palette
  paletteOut <- palettes[[chosenPalette]]

  # Return the whole palette if we do not have a second argument
  if (missing(nth)) {
    return(paletteOut)
  }

  # if we have a valid palette and a nth argument, check if there are enough colors to satisfy the nth argument
  paletteLast <- length(paletteOut)
  nCheck <- max(nth)

  # Return Error message if position (nth argument) is > than length of chosen palette (argument)
  # Else return colors of chosen palette
  if (paletteLast < nCheck) {
    warning <- paste0("The palette ", '"', chosenPalette, '"', " contains ", paletteLast, " colors. Please change color position parameter (nth).")
    stop(warning)
  }

  # get chosen colors and return them
  colorOut <- paletteOut[nth]
  return(colorOut)
}

# get_zuericolors()
# get_zuericolors("harmonic6")
# get_zuericolors("hArmonic6")
# get_zuericolors("harmonic6", nth = 3)
# get_zuericolors("harmonic6", nth = 2:4)
# get_zuericolors("harmonic6", nth = 5:7)
# get_zuericolors("harmonic6", nth = 20)
# get_zuericolors(palette = 1, nth = 1)
# get_zuericolors(nth = 1)
# get_zuericolors(harmonic6, 2)
# get_zuericolors("asdf",)
