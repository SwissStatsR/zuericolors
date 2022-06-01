\name{get_zuericolors}
\alias{get_zuericolors}
\title{
Get Colors and Palettes from zuericolors
}
\description{
Function to access a specific hex values of a color palette from zuericolors.
}
\usage{
get_zuericolors(palette, nth)
}
\arguments{
  \item{palette}{
Character String which defines the available Palettes in zuericolors.
}
  \item{nth}{
Numeric Value which defines what specific Color to extract. 
}
}

\value{
This functions returns specific hex color values in a vector. If no palette is provided, get_zuericolors prints all available color palettes as a list.
}

\author{
Alessandro Feller, Scientific Researcher, alessandro.feller@zuerich.ch, Statistik Stadt Zürich (SSZ)
}

\examples{
# Get all the Colors of Palette "harmonic6"
get_zuericolors("harmonic6")

# Get the third Color Value of Palette "harmonic6"
get_zuericolors("harmonic6", nth = 3)

# Get the first three Color Values of Palette "harmonic6"
get_zuericolors("harmonic6", nth = 1:3)