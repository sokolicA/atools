#' Install custom packages list and / or update existing packages
#'
#' @param update Whether to update installed packages with newer versions. Defaults to FALSE.
#'
#' @return Nothing.
#' @export
#' @importFrom rstudioapi restartSession
#' @importFrom utils old.packages
#'
#' @examples
#' \dontrun{
#' install_packages()
#' }
install_packages <- function(update = FALSE) {

  # List of packages
  packages <- c(
    "devtools",
    "sessioninfo",
    "here",
    "knitr",
    "markdown",
    "rmarkdown",
    "shiny",
    "htmltools",
    "data.table",
    "tidyverse",
    "broom",
    "lme4",
    "mlr3",
    "mlr3verse",
    "car",
    "Hmisc",
    "lubridate",
    "forcats",
    "crosstalk",
    "DT",
    "plotly",
    "highcharter",
    "ggh4x",
    "rayshader",
    "gt",
    "gtsummary",
    "ISLR"
  )
  # Missing packages
  missing_pkgs <- setdiff(packages, rownames(utils::installed.packages()))


  # Install missing packages if any
  if(length(missing_pkgs)) utils::install.packages(missing_pkgs)

  if (update) {
    old_pkgs <- rownames(old.packages())
    if(length(old_pkgs)) utils::install.packages(old_pkgs)
  }

  cat("Done!")
}
