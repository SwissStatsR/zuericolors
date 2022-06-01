\name{view_zuericolors}
\alias{view_zuericolors}
\title{
View Palettes from zuericolors
}
\description{
Function that allows to visually view a specific zuericolors color Palette.
}
\usage{
view_zuericolors(palette = " ")
}
\arguments{
  \item{palette}{
Character String which defines the available Palettes in zuericolors.
}
}

\value{
view_zuericolors() returns a ggplot2 object.
}
\author{
Alessandro Feller, Scientific Researcher, alessandro.feller@zuerich.ch, Statistik Stadt Zürich (SSZ)
}
\examples{
# View the Colors of Palette "harmonic6"
view_zuericolors("harmonic6")