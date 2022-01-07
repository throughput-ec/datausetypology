#' @title Barplot of data-use typologies and the associated counts
#' @description Takes code repositories from a subset of all Throughput data
#' for which metadata was collected and use case typologies were assigned.
#' @param datatable The input table to be manipulated.
#' @param outputfile The file (and directory) for the output graph.
#' @param ... variables to be used by \code{ggsave}
#' @return A file saved to the \code{outputfile} location.
gen_figthree <- function(datatable, outputfile, ...) {
  
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
  
  ggsave(outputfile, output, ...)
}