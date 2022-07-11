#' Set working directory
#'
#' @param ... String containing directory.
#' @param file_loc Whether to set working directory to document path.
#'
#' @return Nothing.
#' @export
#'
#' @examples
#' #set_wd()
set_wd <- function(..., file_loc = FALSE) {
  if (file_loc & missing(...)) {
    setwd(dirname(rstudioapi::documentPath()))
  } else {
    setwd(...)
  }
  cat(paste0("New working directory: ", getwd()))
}
