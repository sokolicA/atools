#' Combine two objects by rows.
#'
#' @param ... Add
#'
#' @export
#'
#' @examples
#' \dontrun{
#' bind_rows(...)
#' }
bind_rows <- function(...) {
  UseMethod("bind_rows")
}

#' Combine two data.table objects by rows.
#'
#' @param dt1 Main data.table object.
#' @param dt2 Secondary data.table object to be appended.
#' @param fill Whether to fill missing values with NAs. Defaults to FALSE. When TRUE, use_names is set to TRUE.
#' @param use_names Whether to bind by matching column names. Defaults to TRUE. If FALSE, matching is done by position.
#' @export
#' @import data.table
#' @return An unkeyed data.table containing a concatenation of all the items passed in.
#'
#' @examples
#' \dontrun{
#' x <- data.table(a = 1:2, b = c("A", "B"))
#' y <- data.table(a = 3:4, b = c("C", "D"))
#' bind_rows(x, y)
#' }
bind_rows.data.table <- function(
    dt1,
    dt2,
    fill = FALSE,
    use_names = TRUE) {
  data.table::rbindlist(
    list(
      dt1,
      dt2
    ),
    fill = fill,
    use.names = use_names
  )
}


#' Combine two data.frame objects by rows.
#'
#' @param dt1 Main data.frame object.
#' @param dt2 Secondary data.frame object to be appended.
#' @export
#' @return A data.frame containing a concatenation of all the items passed in.
#'
#' @examples
#' \dontrun{
#' x <- data.frame(a = 1:2, b = c("A", "B"))
#' y <- data.frame(a = 3:4, b = c("C", "D"))
#' bind_rows(x, y)
#' }
#' @export
bind_rows.data.frame <- function(
    dt1,
    dt2
) {
    rbind(
      dt1,
      dt2
    )
}
