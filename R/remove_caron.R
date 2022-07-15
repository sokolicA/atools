#' Remove carons
#'
#' @param str A character vector
#'
#' @return A character vector
#' @export
#'
#' @examples
#' \dontrun{
#' remove_caron("string_with_carons")
#' }
remove_caron <- function(str) {
  stri_trans_general(str, id = "Latin-ASCII")
}


