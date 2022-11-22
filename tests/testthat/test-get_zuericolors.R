test_that("get entire palette with just palette name", {
  for (name in names(palettes)) {
    expect_equal(get_zuericolors(!!name), palettes[[name]])
    # note the use of `!!` because otherwise name would be tried as a palette rather than the value of name
  }
})

test_that("special dealing with palette name", {
  expect_equal(get_zuericolors("hArmonic6"), palettes[["harmonic6"]])
  expect_equal(get_zuericolors(harmonic6), palettes[["harmonic6"]])
})

test_that("get specific colors", {
  expect_equal(
    get_zuericolors("contrasting12hell", nth = 11),
    palettes[["contrasting12hell"]][[11]]
  )
  expect_equal(
    get_zuericolors("sequential9petrol", nth = 7:9),
    palettes[["sequential9petrol"]][7:9]
  )
})

test_that("asking for more colors than exist", {
  expect_length(get_zuericolors("harmonic6"), 6)
  expect_error(get_zuericolors("harmonic6", nth = 20), "6 colors")
  expect_error(get_zuericolors("harmonic6", nth = 5:7), "6 colors")
})

test_that("error is raised with missing arguments", {
  expect_error(get_zuericolors(), "choose")
  expect_error(get_zuericolors(nth = 1), "choose")
})

test_that("names of palettes are printed with missing arguments", {
  expect_output(
    try(get_zuericolors(), silent = TRUE),
    paste(names(palettes), sep = "", collapse = "\n")
  )
  expect_output(
    try(get_zuericolors(nth = 1), silent = TRUE),
    paste(names(palettes), sep = "", collapse = "\n")
  )
})

test_that("error if palette does not exist", {
  expect_error(get_zuericolors("asdf", ), "does not exist")
  expect_error(get_zuericolors(palette = 1, nth = 1), "does not exist")
})

test_that("names of palettes are printed if palette does not exist", {
  expect_output(
    try(get_zuericolors("asdf"), silent = TRUE),
    paste(names(palettes), sep = "", collapse = "\n")
  )
  expect_output(
    try(get_zuericolors(palette = 1, nth = 1), silent = TRUE),
    paste(names(palettes), sep = "", collapse = "\n")
  )
})
