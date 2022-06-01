\name{get_zuericolors}
\alias{get_zuericolors}
\title{
Get Colors and Palettes from zuericolors
}
\description{
Function to get a specific hex value of a color palette from zuericolors. It is also possible to extract multiple color values.
}
\usage{
get_zuericolors(palette, nth)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{palette}{
Character String which defines the available Palettes in zuericolors.
}
  \item{nth}{
Numeric Value which defines what specific Color to extract.
}
}

\value{
get_zuericolors() returns a list with all available Palettes. If a specific Palette has been defined, the function will return a vector with the respective hex values.
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

