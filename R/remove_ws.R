#' Remove whitespace from character vectors/columns.
#'
#' @param x Any of the following: A character vector, a data.frame or a data.table.
#' @param ... Add
#'
#' @return Nothing, if x is a data.table and same object as x without white space in character columns otherwise.
#' @export
#'
#' @examples
#' \dontrun{
#' x <- data.table(test = c("     Hi", "Hey    ", "  Hello   "))
#' remove_ws(x) # Nothing is returned.
#' x$test
#' }
remove_ws <- function(...) {
  UseMethod("remove_ws")
}
remove_ws.data.table <- function(x) {
  cols <- colnames(x)[sapply(x, is.character)]
  x[, (cols) := lapply(.SD, trimws), .SDcols = cols]
}

remove_ws.data.frame <- function(x) {
  cols <- colnames(x)[sapply(x, is.character)]
  x[cols] <- apply(x[cols], 2, trimws)
  x
}

remove_ws.character <- function(x) {
  trimws(x)
}