test_that("Testing group-summary function", {
  # I want to make sure the output is still a dataframe
  expect_s3_class(
    group_summary(palmerpenguins::penguins, species, sd),
    "tbl_df"
  )

  # I want to double check there are no NA values in the summarized data set
  expect_equal(
    sum(is.na(group_summary(palmerpenguins::penguins, species, sd))), 0
  )

  # I want to test if my function can handle two summary functions in the input
  expect_equal(
    NCOL(group_summary(mtcars, cyl, c(mean,sd))), #mt cars has 11 cols (grouped by and 10 numeric)
    21) #if we applied two functions, we would expect numerical cols to double

  #Finally I want to check that if my data does not contain a numerical column, it will throw an error.
  expect_error(
    group_summary(palmerpenguins::penguins[c("species","island","sex")], island, mean),
    'This does not contain numerical data.'
  )

}
)
