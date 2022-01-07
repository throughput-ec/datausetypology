pacman::p_load(colorspace, tidyr, tibble, readr,
               dplyr, ggplot2, ggthemes, assertthat)

figureSource <- list.files("figures", full.names = TRUE)
sapply(figureSource, source)

typology <- readr::read_csv('data/repositoryMetadata.csv') %>% 
  mutate(Category = ifelse(Category == "Miscellaneous: Scraping", 
                           "Miscellaneous: Informational", Category))

repoPlot <- readr::read_csv("data/linkeddbs.csv") %>% 
  rename(c("archive" = "db.name"))

gen_figtwo(repoPlot, "svgplots/figuretwo.svg")
gen_figthree(typology, "svgplots/figurethree.svg")
gen_figfour(typology, "svgplots/figurefour.svg")
