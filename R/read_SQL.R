#' Read a SQL file into a string in R.
#'
#' @param path Path to the .sql file. If the sql file includes multiple queries or has other text before and after the query, mark the start of the query with "-- start query" and the end of the query with "-- end query".
#' @param enc Encoding of the SQL file. Defaults to native - unknown.
#' @param rm_comments Whether to remove comments in sql code.
#'
#' @return A string containing the sql code.
#' @export
#'
#' @examples
#' \dontrun{
#'  read_SQL("~file.sql")
#' }
read_sql <- function(path, enc = "unknown", rm_comments = FALSE) {
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
    line <- readLines(con, n = 1, encoding = enc)

    if ( length(line) == 0 ){
      break
    }

    line <- gsub("\\t", " ", line)

    if (grepl("--", line) == TRUE) {
      line <- paste(sub("--", "/*",line),"*/")
    }
    line <- gsub("( *?)$", "", line)

    if (nchar(line) > 0) {
      sql <- paste(sql, line, "\r\n")
    }
  }
  close(con)

  if (rm_comments) {
    sql <- gsub("/\\*.*?\\*/", "", sql)
  }

  sql <- gsub("^(.*?)start query \\*/", "", sql)
  sql <- gsub("/\\* end query(.*?)$", "", sql)


  sql
}
