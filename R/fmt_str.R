#' Format string
#'
#' @param str A character vector
#' @param u_case Whether to return upper case letters.
#' @param rm_caron Whether to remove carons.
#' @param rm_special Whether to remove special characters.
#' @param rm_space Whether to remove spaces.
#' @param n_char Maximum number of characters in each element of the vector.
#'
#' @return A character vector.
#' @export
#'
#' @examples
#' fmt_str("tek%kl oaf", u_case = FALSE, rm_special = TRUE, n_char = 5)
fmt_str <- function(
    str,
    u_case,
    rm_caron = FALSE,
    rm_special = FALSE,
    rm_space = FALSE,
    n_char = NULL) {

  if (u_case) {str <- toupper(str)}
  if (rm_caron) {str <- remove_caron(str)}
  if (rm_special) {str <- gsub("[[:punct:]]", "", str)}
  if (rm_space) {str <- gsub("[ ]", "", str)}
  if (!is.null(n_char)) { str <- strtrim(str, n_char)  }
  str
}
