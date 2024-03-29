% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fom.R
\name{fom}
\alias{fom}
\title{First day of month}
\usage{
fom(date)
}
\arguments{
\item{date}{A date object or a character vector in "yyyy-mm-dd" format.}
}
\value{
First day of month of the given date.
}
\description{
First day of month
}
\examples{
fom(Sys.Date())
fom(fom(Sys.Date()) + 32)
fom(fom(Sys.Date()) - 1)
}
