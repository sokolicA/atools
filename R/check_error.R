#' Check if evaluation of expression returns any errors
#'
#' @param expr A R expression
#'
#' @return Boolean. TRUE if evaluating the expression returns any errors and FALSE otherwise.
#' @export
#'
#' @examples
#' x <- 3
#' check_error(3 * x)
#' rm(x)
#' check_error(3 * x)
check_error <- function(expr) {
  any(class(tryCatch(expr, error = function(e) e)) == "error")
}
