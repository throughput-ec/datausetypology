gen_figthree <- function(datatable, outputfile) {
  
  typologyCount <- datatable %>% group_by(Category) %>% 
    summarise(n = n()) %>% 
    arrange(desc(n))
  
  output <- ggplot(typologyCount, aes(x = reorder(Category, -n), y = n)) +
    geom_bar(stat = "identity") +
    scale_x_discrete(labels = function(x){sub("\\s", "\n", x)}) +
    coord_cartesian(expand = 0) +
    ylim(c(0, 45)) +
    theme_tufte() +
    xlab("Data Use Type") +
    ylab("Repository Count") +
    theme(axis.title = element_text(face = 'bold', size = 18),
          axis.text = element_text(size = 10))
  
  ggsave(outputfile, output)
}