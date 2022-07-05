#' Read a SQL file into a string in R.
#'
#' @param path Path to the .sql file.
#'
#' @return A string containing the sql code.
#' @export
#' @importFrom readr read_file
#'
#' @examples
#' \dontrun{
#'  read_SQL("~file.sql")
#' }
read_SQL <- function(path) {
  readr::read_file(path)
}
