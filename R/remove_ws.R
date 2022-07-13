#' Remove whitespace from character vectors/columns.
#'
#' @param ... Add
#'
#' @return The form of the value returned by summary depends on the class of its argument. See the documentation of the particular methods for details of what is produced by that method.
#'
#' @examples
#' \dontrun{
#' x <- data.table(test = c("     Hi", "Hey    ", "  Hello   "))
#' remove_ws(x) # Nothing is returned.
#' x$test
#' }
#' @export
remove_ws <- function(...) {
  UseMethod("remove_ws")
}

#' Remove whitespace from character columns.
#'
#' @param x A data.table.
#'
#' @return Nothing, removal is done by reference.
#'
#' @examples
#' \dontrun{
#' x <- data.table(test = c("     Hi", "Hey    ", "  Hello   "))
#' remove_ws(x) # Nothing is returned.
#' x$test
#' }
#' @export
remove_ws.data.table <- function(x) {
  cols <- colnames(x)[sapply(x, is.character)]
  x[, (cols) := lapply(.SD, trimws), .SDcols = cols]
}

#' Remove whitespace from character columns.
#'
#' @param x A data.frame.
#'
#' @return A data.frame without white space in character columns.
#'
#' @examples
#' \dontrun{
#' x <- data.frame(test = c("     Hi", "Hey    ", "  Hello   "))
#' remove_ws(x)
#' }
#' @export
remove_ws.data.frame <- function(x) {
  cols <- colnames(x)[sapply(x, is.character)]
  x[cols] <- apply(x[cols], 2, trimws)
  x
}

#' Remove whitespace from character vector.
#'
#' @param x A character vector.
#'
#' @return A character vector without white space.
#'
#' @examples
#' \dontrun{
#' x <- c("     Hi", "Hey    ", "  Hello   ")
#' remove_ws(x)
#' }
#' @export
remove_ws.character <- function(x) {
  trimws(x)
}
