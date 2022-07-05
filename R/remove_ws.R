#' Remove whitespace from character columns
#'
#' @param dt A data.table object
#'
#' @return Nothing. Removal is done by assignment.
#' @export
#'
#' @examples
#' \dontrun{
#' x <- data.table(test = c("     Hi", "Hey    ", "  Hello   "))
#' remove_ws(x) # Nothing is returned.
#' x$test
#' }
remove_ws <- function(dt) {
  if(!data.table::is.data.table(dt)) stop("Works for data.table objects only.")
  cols <- colnames(dt)[sapply(dt, is.character)]
  dt[, (cols) := lapply(.SD, trimws), .SDcols = cols]
}
