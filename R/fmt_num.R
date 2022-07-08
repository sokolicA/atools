#' Format numeric values.
#'
#' @param x  Vector with numeric values.
#' @param decimal_mark Decimal separator. Defaults to ","
#' @param big_mark Separator between digits of large numbers.
#'
#' @return A formatted character vector.
#' @export
#'
#' @examples
#' fmt_num(50000.54, decimal_mark = ",")
#' fmt_num("50000.54", decimal_mark = ",")
#' fmt_num("50a4", decimal_mark = ",")
fmt_num <- function(
    x,
    decimal_mark = ",",
    big_mark = NULL) {
  if (!is.numeric(x)) {
    if(!check_warning(as.numeric(x))) {
      x <- as.numeric(x)
    } else {stop("Can not convert to numeric vector. Check data for errors.")}
  }
  if (decimal_mark == "." & is.null(big_mark)) big_mark <- ","
  if (decimal_mark == "," & is.null(big_mark)) big_mark <- "."
  if (decimal_mark == big_mark) warning("How can you know now?")
  format(x, big_mark = big_mark, decimal.mark = decimal_mark)
}
