#' First day of month
#'
#' @param date A date object or a character vector in "yyyy-mm-dd" format.
#'
#' @return First day of month of the given date.
#' @export
#'
#' @examples
#' fom(Sys.Date())
#' fom(fom(Sys.Date()) + 32)
#' fom(fom(Sys.Date()) - 1)
fom <- function(date) {
  date <- as.Date(date)
  as.Date(cut(date, "month"))
}
