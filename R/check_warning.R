#' Check if evaluation of expression returns any warnings
#'
#' @param expr A R expression
#'
#' @return Boolean. TRUE if evaluating the expression returns any warnings and FALSE otherwise.
#' @export
#'
#' @examples
#' x <- 3
#' check_warning(3 * x)
#' check_warning(as.numeric("3a"))
check_warning <- function(expr) {
  any(class(tryCatch(expr, warning = function(w) w)) == "warning")
}
