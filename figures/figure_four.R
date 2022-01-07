gen_figfour <- function(datatable, outputfile) {
  
  geoRecCor <- datatable %>%
    filter(!Category == "Can't Categorize") %>% 
    mutate_at(function(x){sqrt(scale(x, center = FALSE))}, 
              .vars = vars(-Category)) %>%
    group_by(Category) %>%
    summarise(across(everything(), mean)) %>% 
    ungroup() %>% 
    tibble::column_to_rownames("Category") %>% 
    t() %>% 
    cor() %>% 
    as.dist() %>% 
    hclust()
  
  typologyRose <- datatable %>% 
    filter(!Category == "Can't Categorize") %>% 
    mutate(row = seq(1:nrow(.))) %>%
    mutate_at(function(x) { scale(x^0.5, center = FALSE) }, 
              .vars = vars(-c(Category, row))) %>% 
    pivot_longer(!c(Category, row))
  
  typologyRose$Category <- factor(typologyRose$Category,
                                  levels = geoRecCor$labels[geoRecCor$order])
  
  typologyRose$name <- factor(typologyRose$name, 
                              levels = c('READMEChrCount', 'No.READMEHeadings',
                                         'Badges', 'DescriptionChrCount',
                                         'Issues',
                                         'Branches', 'TotalCommits',
                                         'Stars', 'Forks'))
  
  typologyRose$name <- recode(typologyRose$name,
                              "READMEChrCount" = "README\nLength",
                              "No.READMEHeadings" = "README\nHeadings",
                              "DescriptionChrCount" = "Description\nLength",
                              "TotalCommits" = "Commits")
  
  typologyRose <- typologyRose %>% 
    arrange(row) %>% 
    group_by(Category, name) %>% 
    summarise(value = mean(value))
  
  radialOut <- ggplot(typologyRose, aes(x = name, y = value, color = Category)) + 
    geom_point(size = 2) +
    geom_line(aes(x = name, y = value, group = Category), 
              size = 1.5, alpha = 0.5) +
    scale_color_discrete_qualitative(palette = "Harmonic") +
    scale_y_sqrt() +
    coord_polar() +
    ylab("") +
    xlab("") +
    theme_tufte() +
    theme(rect = element_blank(),
          axis.text.x = element_text(face = "bold", size = 12),
          axis.ticks.y = element_blank(),
          axis.text.y = element_blank(),
          panel.grid.major.x = element_line(color = rgb(0.2, 0.2,0.2, 0.2)))
  
  ggsave(outputfile, radialOut, width = 8, height = 6)
  
}