suppressMessages(library(pbixr))

# Helpers for this vignette
suppressMessages(library(RCurl))
suppressMessages(library(ggplot2))
suppressMessages(library(ggraph))
suppressMessages(library(igraph))
suppressMessages(library(imager))
suppressMessages(library(tidyr))
suppressMessages(library(formatR))


temp_dir <- file.path(tempdir(), "vig")
if (!dir.exists(temp_dir)) {
  dir.create(temp_dir)
}
sample_file_name <- "sample_vig.pbix"
path_file_sample <- file.path(temp_dir, sample_file_name)
parent_temp_dir <- dirname(temp_dir)
existing_file <- list.files(parent_temp_dir,
                            pattern = sample_file_name, recursive = TRUE, full.names = TRUE)
if (length(existing_file) == 0) {
  url_pt1 <- "https://github.com/KoenVerbeeck/PowerBI-Course/blob/"
  url_pt2 <- "master/pbix/TopMovies.pbix?raw=true"
  url <- paste0(url_pt1, url_pt2)
  req <- download.file(url, destfile = path_file_sample, mode = "wb")
} else {
  path_file_sample <- existing_file[1]
}




# File path of the sample
input_pbix <- path_file_sample
pbi_content <- f_get_pbix_info(input_pbix)
pbi_content_names <- pbi_content$Name
# Identify exentsions
pbi_content_types <- unique(tools::file_ext(pbi_content_names))
# Show content
# Make the size look pretty
biggest_file <- max(as.numeric(gsub("[^0-9]*","",pbi_content$Length)))
pbi_content$Length <- prettyNum(pbi_content$Length, big.mark = ",")
knitr::kable(pbi_content)


image_reg <- "[.]png"
# Get the images
image_information <- f_extract_images(input_pbix, image_reg)
image_name <- gsub(".*/", "", image_information[[2]]$Name)
# Plot the first image
im <- imager::load.image(image_information[[1]])
plot(im, main = image_name)
