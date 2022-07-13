#' Format path to be readable by R
#'
#' @description Useful when copying paths (Copy as path)
#'
#' @details By the UNC (Universal Naming Convention) paths starting with "\\\\" (also "//") refer to network , shared locations or directories. (Windows)
#' Windows uses backslash ("\") as a folder separator. The backslash ("\") is often (in many programming languages) also an escaping character, therefore a double backslash is necessary to print a single backslash at run time.
#' Unix based systems use a forward slash ("/") as a folder separator. R (and many others, such as Python) accept both as folder separators ("\\\\" for a single and "\\\\\\\\" for a double backslash).
#'
#'
#' @param path Path. Can be quoted or unquoted.
#' @param unix Whether to return a Unix systems based path using single forward slashes. Defaults to FALSE, which returns double backslashes.
#' @param write Whether to write the new path to clipboard.
#'
#' @return A string containing the new path.
#' @export
#' @importFrom utils readClipboard
#'
#' @references [Wikipedia Path (computing)](https://en.wikipedia.org/wiki/Path_(computing))
#'
#' @examples
#' x <- "C:\ example"
#' fmt_path(x, write = FALSE)
fmt_path <- function(
    path = "clipboard",
    unix = FALSE,
    write = TRUE) {
  old_path <- if (path == "clipboard") {
    readClipboard()
  } else {
    path
  }
  new_path <- gsub("\"", '', old_path)
  if (fwd_slash) {
    new_path <- chartr("\\", "/", new_path)
  }
  new_path <- gsub("(/)\\1+", "\\1", new_path)
  if (write) {
    writeLines(text = gsub("\\", "\\\\", new_path, fixed = TRUE), con = "clipboard", sep = "")
    #writeClipboard(gsub("\\", "\\\\", new_path, fixed = TRUE))
    cat("New path successfully copied to clipboard.\n")
  }
  new_path
}
