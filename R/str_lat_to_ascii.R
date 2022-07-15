#' Transliterate characters from Latin to ASCII
#'
#' @param str A character vector
#'
#' @return A character vector in UTF-8/ASCII encoding.
#' @export
#'
#' @examples
#' \dontrun{
#' str_lat_to_ascii("string_with_carons")
#' }
str_lat_to_ascii <- function(str) {
  stri_trans_general(str, id = "Latin-ASCII")
}


