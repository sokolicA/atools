#' Format path to be readable by R
#'
#' @param path Path. Can be quoted or unquoted.
#' @param fwd_slash Whether to return single forward slashes. Defaults to FALSE, which returns double backslashes.
#' @param write Whether to write the new path to clipboard.
#'
#' @return A string containing the new path.
#' @export
#' @importFrom utils readClipboard
#'
#'
#' @examples
#' x <- "C:\ example"
#' fmt_path(x, write = FALSE)
fmt_path <- function(
    path = "clipboard",
    fwd_slash = FALSE,
    write = TRUE) {
  old_path <- if (path == "clipboard") {
    readClipboard()
  } else {
    path
  }
  new_path <- gsub("\"", '', old_path)
  if (fwd_slash) new_path <- chartr("\\", "/", new_path)
  if (write) {
    writeLines(text = gsub("\\", "\\\\", new_path, fixed = TRUE), con = "clipboard", sep = "")
    #writeClipboard(gsub("\\", "\\\\", new_path, fixed = TRUE))
    cat("New path successfully copied to clipboard.\n")
  }
  new_path
}
