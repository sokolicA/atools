#' Title
#'
#' @param path Where to create the new project. Defaults to current working directory.
#' @param folder_name Name of the new folder. Defaults to "New project".
#' @param overwrite Whether to overwrite an existing folder with the same name as \emph{folder_name}
#'
#' @return Nothing.
#' @export
#'
#' @importFrom stats time
#' @importFrom utils setTxtProgressBar txtProgressBar
#'
#' @examples
#' \dontrun{
#' copy_project_structure()
#' }
copy_project_structure <- function(
    path = getwd(),
    folder_name = "New project",
    overwrite = FALSE) {

  project_structure_folder <- system.file("project_structure", package = "atools")
  new_folder <- paste0(path, "/", folder_name)
  if(dir.exists(new_folder) & overwrite == FALSE) {
    stop("Folder wiwth the same name already exists. Set overwrite to TRUE in order to overwrite the existing folder.")
  } else { dir.create(new_folder, showWarnings = FALSE) }

  list_files <- list.files(project_structure_folder)
  pb <- txtProgressBar(min = 0, max = length(list_files), initial = 0, style = 3)

  for(f in seq_along(list_files)) {
    file.copy(dir(project_structure_folder, list_files[f], full.names = TRUE), new_folder, recursive = TRUE)
    setTxtProgressBar(pb, f)
  }
  close(pb)
  cat("Folder successfully created.")
}
