# test 1: normal functioning with correct arguments
test_that("a plot is returned", {

  # when a palette is specified
  expect_type(view_zuericolors("harmonic6"), "list")
  expect_s3_class(view_zuericolors("harmonic6"), c("gg", "ggplot"))

  # when no palette is specified
  expect_type(view_zuericolors(), "list")
  expect_s3_class(view_zuericolors(), c("gg", "ggplot", "ggarrange"))
})

# test 2: special handling of palette name argument
test_that("deal with palette names correctly", {
  expect_s3_class(view_zuericolors(harmonic6), c("gg", "ggplot"))
  expect_s3_class(view_zuericolors(haRmonic6), c("gg", "ggplot"))
})

# test 3: correct colors are returned
test_that("colors are correctly taken from the palettes", {
  for (name in names(palettes)) {
    expect_equal(view_zuericolors(!!name)$data$color, palettes[[name]])
    # note the use of `!!` because otherwise name would be tried as a palette rather than the value of name
  }
})

# test 4: error if the given palette does not exist
test_that("error thrown when palette does not exist", {
  expect_error(view_zuericolors("harm"), "does not exist")
})
