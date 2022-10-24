
#' Update VS Code snippets
#'
#' @param from Where to copy the files from
#' @param to Copy the files to
#'
#' @return "Success!"
#'
#' @examples
#' \dontrun{
#' update_vsc_snippets()
#' }
update_vsc_snippets <- function(
    from = "C:\\Users\\andre\\AppData\\Roaming\\Code\\User\\snippets",
    to = "C:/Users/andre/OneDrive/AS/PROJECTS/atools/inst/vscode_snippets"
    ) {

  files <- dir(from);
  for (f in files) {
    file.copy(
      from = paste0(from, "\\", f),
      to = to,
      overwrite = TRUE
      )
  }
  return("Success!")

}
