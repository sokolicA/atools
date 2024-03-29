% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/remove_ws.R
\name{remove_ws.data.table}
\alias{remove_ws.data.table}
\title{Remove whitespace from character columns.}
\usage{
\method{remove_ws}{data.table}(x)
}
\arguments{
\item{x}{A data.table.}
}
\value{
Nothing, removal is done by reference.
}
\description{
Remove whitespace from character columns.
}
\examples{
\dontrun{
x <- data.table(test = c("     Hi", "Hey    ", "  Hello   "))
remove_ws(x) # Nothing is returned.
x$test
}
}
