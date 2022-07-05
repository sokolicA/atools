.onAttach <- function(libname, pkgname) {
  packageStartupMessage("Welcome to my package!")
  options(ggplot2.discrete.colour= pars$palette_cb)
}
