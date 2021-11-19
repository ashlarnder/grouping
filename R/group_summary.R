#' Group numerical summary
#'
#' @description This function groups the data by a variable and
#' then summarizes the remaining numerical variables based on a
#' defined summary function.
#'
#' @param data The data set you want to work with. This is named
#' data because it is the data set you are working with. There must
#' be at least one numerical variable in this data set.
#' @param group The variable in the data set you want to group by.
#' This is named group because it is the group within the data set
#' that you will be grouping by.
#' @param fun The summary function you wish to apply to the numerical
#' variables in the data set. This is named fun, short for function,
#' because it is the function that will be applied.
#' @return This function returns another data set. The rows will be
#'  the different levels of groups in the variable that was used to
#'   group_by. The data within the numerical columns will be the
#'   summarized data statistic applied to the numerical values
#'   pertaining to the group. For example, for all of the penguins
#'   from Dream island, we will have calculated the mean body_mass_g
#'   for that population of penguins.
#' @details This function works by taking your data set and grouping
#'  it according to the variable specified by group (using the group_by()
#'  function). It then looks across all the remaining variables and
#'  selects the ones containing numerical data. With these numerical
#'  variables it will apply the summary function, to give you the
#'  summary statistic for each subsetted group identified previously
#'  and for each numerical variable. The function also includes a
#'  stop criteria that prevents the function from running when
#'  there is no numerical data in the data set present, as this is
#'   geared to summary functions of quantitative data. There are no
#'   restrictions on the type of the group variable as you may want
#'   to group by a numerical variable (ex. year).
#' @references
#' Vincenzo Coia. (2021). R Functions for Data Analysis (https://stat545.stat.ubc.ca/notes/notes-b01/)
#' @examples
#' group_summary(palmerpenguins::penguins, island, mean)
#' group_summary(palmerpenguins::penguins, species, sd)
#' @importFrom dplyr %>%
#' @importFrom tidyselect vars_select_helpers
#' @export
group_summary <- function(data, group, fun) {
  if ( is.na(match(TRUE,sapply(data, is.numeric))) ) {
    stop('This does not contain numerical data.')
  }
  data %>%
    dplyr::group_by({{group}}) %>%
    dplyr::summarize(dplyr::across(tidyselect::vars_select_helpers$where(is.numeric), fun, na.rm=TRUE))
}
