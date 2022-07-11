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
  qry <- readr::read_file(path)
  #remove comments \* comment *\
  qry <- gsub("/\\*.*?\\*/", "", qry)
  # remove the new line at the beggining
  qry <- gsub("^(\\r\n)*", "", qry)
  # remove everything after ;
  qry <- gsub("(;.*)$", "", qry)

  qry
}
