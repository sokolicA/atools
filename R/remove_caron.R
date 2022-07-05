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
  raw_list <- lapply(str, charToRaw)
  if (grepl("1250", Sys.getlocale())) {
    raw_list <- lapply(raw_list, function(x) {x[x %in% c("e6", "e8")] <- charToRaw("c"); return(x)})
    raw_list <- lapply(raw_list, function(x) {x[x %in% c("c6", "c8")] <- charToRaw("C"); return(x)})
    raw_list <- lapply(raw_list, function(x) {x[x == "9a"] <- charToRaw("s"); return(x)})
    raw_list <- lapply(raw_list, function(x) {x[x == "8a"] <- charToRaw("S"); return(x)})
    raw_list <- lapply(raw_list, function(x) {x[x == "9e"] <- charToRaw("z"); return(x)})
    raw_list <- lapply(raw_list, function(x) {x[x == "8e"] <- charToRaw("Z"); return(x)})
  }
  unlist(lapply(raw_list, rawToChar))
}
