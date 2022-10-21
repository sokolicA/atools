#' Install custom packages list and / or update existing packages
#'
#' @details It is suggested to use the function on a fresh R session with no packages loaded.
#' An error is returned if other packages are loaded. This may include packages that are included via the .Rprofile file.
#'
#' @param update Whether to update installed packages with newer versions. Defaults to FALSE.
#'
#' @return Nothing.
#' @export
#' @importFrom utils old.packages
#'
#' @examples
#' \dontrun{
#' install_packages()
#' }
install_packages <- function(update = FALSE) {

  other_pkgs_loaded <- length(utils::sessionInfo()$otherPkgs) > 0
  if (other_pkgs_loaded) stop("Non base packages loaded. It is suggested to install packages on a fresh R session.")

  # List of packages
  packages <- c(
    "devtools",
    "sessioninfo",
    "here",
    "knitr",
    "blogdown",
    "flexdashboard",
    "markdown",
    "rmarkdown",
    "prettydoc",
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
    "ggrepel",
    "rayshader",
    "flextable",
    "webshot",
    "gt",
    "gtsummary",
    "ISLR",
    "readxl",
    "writexl",
    "jsonlite"
  )
  # Missing packages
  missing_pkgs <- setdiff(packages, rownames(utils::installed.packages()))


  # Install missing packages if any
  if(length(missing_pkgs)) utils::install.packages(missing_pkgs)

  if (update) {
    old_pkgs <- rownames(old.packages())
    if(length(old_pkgs)) utils::install.packages(old_pkgs)
  }

  cat("Done!\n")
}
