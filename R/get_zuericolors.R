#' Get Zuericolors Palettes
#'
#' @description Function to access color values of a specific zuericolors palette. To see the available palettes, call `view_zuericolors()`.
#'
#' @param palette Name of a specific palette; to see the available palettes, call `view_zuericolors()`
#'
#' @param nth Position of a specific color in a palette, optional
#'
#' @return the color(s) as hex strings
#'
#' @examples
#' # Get colors of palette 'qual12'
#' get_zuericolors("qual12")
#'
#' # Get third color value of palette 'qual12'
#' get_zuericolors("qual12", 3)
#'
#' # Get first three color values of palette 'qual12'
#' get_zuericolors("qual12", 1:3)
#'
#' @export
get_zuericolors <- function(palette = names(palettes), nth) {

  # Return error message if palette argument is missing (even if position
  # argument (named) has been provided)
  if ((missing(palette) & missing(nth)) || (missing(palette) & !missing(nth))) {
    warning <- c("You forgot to define a palette. Please choose one of the palettes above.")
    stop(warning, cat(names(palettes), sep = "\n"))asdf
  }
  
  # Transform palette (argument) for further use
  chosen_palette <- tolower(as.character(substitute(palette)))
  
  # check argument is one of the available palettes
  palette <- match.arg(chosen_palette, names(palettes))

  # Get color palette
  palette_out <- palettes[[chosen_palette]]

  # Return the whole palette if we do not have a second argument
  if (missing(nth)) {
    return(palette_out)
  }

  # if we have a valid palette and a nth argument, check if there are enough
  # colors to satisfy the nth argument
  palette_last <- length(palette_out)
  n_check <- max(nth)

  # Return Error message if position (nth argument) is > than length of chosen
  # palette (argument) Else return colors of chosen palette
  if (palette_last < n_check) {
    warning <- paste0(
      "The palette ", "\"", chosen_palette, "\"", " contains ",
      palette_last, " colors. Please change color position parameter (nth)."
    )
    stop(warning)
  }

  # get chosen colors and return them
  color_out <- palette_out[nth]
  return(color_out)
}
