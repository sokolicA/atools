#' Last day of month
#'
#' @param date A vector of date objects or objects that can be coerced to date
#'
#' @return A vector of dates.
#' @export
#'
#' @examples
#' dates <- seq.Date(from = as.Date("2022-01-15"), to = as.Date("2022-12-15"), by = "1 month")
#' lom(dates)
lom <- function(date) {
  return(fom(fom(date) + 32) - 1)
}
