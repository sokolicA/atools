#' Read a SQL file into a string in R.
#'
#' @param path Path to the .sql file.
#'
#' @return A string containing the sql code.
#' @export
#'
#' @examples
#' \dontrun{
#'  read_SQL("~file.sql")
#' }
read_sql <- function(path, rm_comments = FALSE) {
  # qry <- readr::read_file(path)
  # #remove comments \* comment *\
  # qry <- gsub("/\\*.*?\\*/", "", qry)
  # # remove the new line at the beggining
  # qry <- gsub("^(\\r\n)*", "", qry)
  # # remove everything after ;
  # qry <- gsub("(;.*)$", "", qry)

  con = file(path, "r")
  sql <- ""

  while (TRUE) {
    line <- readLines(con, n = 1)

    if ( length(line) == 0 ){
      break
    }

    line <- gsub("\\t", " ", line)

    if (grepl("--", line) == TRUE) {
      line <- paste(sub("--", "/*",line),"*/")
    }
    sql <- gsub("( *?)$", "", sql)

    if (nchar(line) > 0) {
      sql <- paste(sql, line, "\r\n")
    }
  }
  close(con)

  if (rm_comments) {
    sql <- gsub("/\\*.*?\\*/", "", sql)
  }

  sql <- gsub("^(.*?)start query\\*/", "", sql)
  sql <- gsub("/\\*end query(.*?)$", "", sql)
<<<<<<< HEAD

=======
>>>>>>> cdceb9cde681059a3ddec3c3084c1709b47bd42f

  sql
}
