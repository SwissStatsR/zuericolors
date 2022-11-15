<img src='pictures/zuericolors.png' align="right" height="138.5" />

# Statistik Stadt Zuerich Colors (zuericolors) 
zuericolors is an R-Package, which provides specific colors of the corporate design of the city of Zurich. The package contains all colors that [Statistik Stadt Zürich](https://www.stadt-zuerich.ch/prd/de/index/statistik.html) needs for the creation of graphics. There are two main functions in zuericolors:

* `get_zuericolors` extracts colors of a specific color palette and puts them into a vector.
* `view_zuericolors` prints a specific color palette and is useful for visual inspection.

## Installation
The easiest way to get zuericolors is to install it from this repo:

```{r, eval = FALSE}
# install.packages("devtools")
devtools::install_github("StatistikStadtZuerich/zuericolors")
```

Alternatively, download the files (by clicking 'Clone or download' / 'Download Zip'), extract it to any location on your computer, e.g. to your Desktop:

```{r, eval = FALSE}
remotes::install_local("<path_to_location>/zuericolors-main", dependencies = FALSE)
```

## Version
To check your version of zuericolors, run:

```{r, eval = FALSE}
packageVersion("zuericolors")
```

## Usage

```{r, message = FALSE}
library(zuericolors)

# Get all the colors from palette "hamronic 6"
get_zuericolors("harmonic6")

[1] "#0f05a0" "#2ac7c7" "#0a8df6" "#a2e5b0" "#3d575e" "#23c3f1"

# Get first color from palette "diverging5rotgruen"
get_zuericolors("diverging5rotgruen", nth = 1)

[1] "#EA4F61"

# Get first four colors from palette "contrasting12"
get_zuericolors("contrasting12", nth = 1:4)

[1] "#0f05a0" "#65cd8c" "#960055" "#0098c6"

# View color palette "harmonic12"
view_zuericolors("harmonic12")
```


![harmonic12](https://github.com/StatistikStadtZuerich/zuericolors/blob/main/pictures/harmonic12.JPG)

## Getting help

If you encounter a bug, please contact statistik@zuerich.ch.
