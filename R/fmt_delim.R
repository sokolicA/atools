#' Format delimeter
#'
#' @description Useful when copying a list with space or other characters as delimeter.
#' @param data_loc Path to where the data is stored. Defaults to clipboard.
#' @param delim_before Delimeter used in the supplied string.
#' @param delim_after  Replacement of the original delimeter.
#'
#' @return A string with the new delimeter.
#' @export
#'
#' @examples
#' \dontrun{
#' fmt_delim()
#' }
fmt_delim <- function (
    data_loc = "clipboard",
    delim_before = " ",
    delim_after = ", "
    ) {

    str_in <- tryCatch(
      readLines(con = data_loc, warn = FALSE),
      error = function(cond) {
        message("Error - Something went wrong!")
        message(cond)
      },
      warning = function(cond) {
        message("Warning - Something may be wrong!")
        message(cond)
      }
    )
    str_out <- if (length(str_in) > 1) {
      paste(str_in, collapse = delim_after)
    } else {
      gsub(delim_before, delim_after, str_in, fixed = TRUE)
    }

    return(str_out)
}
