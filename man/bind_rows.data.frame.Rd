% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/bind_rows.R
\name{bind_rows.data.frame}
\alias{bind_rows.data.frame}
\title{Combine two data.frame objects by rows.}
\usage{
\method{bind_rows}{data.frame}(dt1, dt2)
}
\arguments{
\item{dt1}{Main data.frame object.}

\item{dt2}{Secondary data.frame object to be appended.}
}
\value{
A data.frame containing a concatenation of all the items passed in.
}
\description{
Combine two data.frame objects by rows.
}
\examples{
\dontrun{
x <- data.frame(a = 1:2, b = c("A", "B"))
y <- data.frame(a = 3:4, b = c("C", "D"))
bind_rows(x, y)
}
}
