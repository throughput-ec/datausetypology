# Load all packages using `pacman`.
pacman::p_load(colorspace, tidyr, tibble, readr,
               dplyr, ggplot2, ggthemes, assertthat)

# Execute each of the R scripts for the plots.  Each figure is contained
#  within its own function.
figureSource <- list.files("figures", full.names = TRUE)
sapply(figureSource, source)

# Load the data
typology <- readr::read_csv('data/repositoryMetadata.csv') %>% 
  mutate(Category = ifelse(Category == "Miscellaneous: Scraping", 
                           "Miscellaneous: Informational", Category))

repoPlot <- readr::read_csv("data/linkeddbs.csv") %>% 
  rename(c("archive" = "db.name"))

# Execute each plot independently:
gen_figtwo(repoPlot, "svgplots/figuretwo.tiff", width = 8, height = 6)
gen_figthree(typology, "svgplots/figurethree.tiff", width = 8, height = 6)
gen_figfour(typology, "svgplots/figurefour.svg", width = 8, height = 6)
