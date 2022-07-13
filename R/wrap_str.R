#' Wrap Character Strings to Format Paragraphs
#'
#' @param x A character vector or an object which can be converted to a character vector by as.character
#' @param col_len Maximum length of the column
#'
#' @return A character vector.
#' @export
#'
#' @examples
#' wrap_str("This line is supposedly too long to display in one row.", col_len = 10)
wrap_str <- function(x, col_len = 10) {
  x <- strwrap(x, width = col_len, simplify = FALSE)
  x <- lapply(x, paste, collapse = "\n")
  unlist(x)
}
