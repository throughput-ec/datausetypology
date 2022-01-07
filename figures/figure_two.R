#' @title Plotting data archives and the associated number of code repositories
#' @description Takes data from Throughput for the number of code repositories
#' associated with various data archives and plots it into a horizontal barplot.
#' @param datatable The input table to be manipulated, should have
#' columns \code{archive} and \code{num}
#' @param outputfile The file (and directory) for the output graph.
#' @param ... variables to be used by \code{ggsave}
#' @return A file saved to the \code{outputfile} location.
gen_figtwo <- function(datatable, outputfile, ...) {

  errormsg <- paste0("The supplied variable 'datatable' does not",
                     " have columns 'archive' or 'num'")

  assertthat::assert_that("archive" %in% colnames(datatable) &
                          "num" %in% colnames(datatable),
                          msg = errormsg)

  archives <- ggplot(datatable, aes(x = reorder(archive, num), y = num)) +
    geom_bar(stat = "identity") +
    geom_text(aes(label = num), hjust = -0.2, size = 2, family = "serif") +
    coord_flip(expand = 0, ylim = c(0, 450)) +
    theme_tufte() +
    ylab("Linked Code Repositories") +
    xlab("Data Archive") +
    theme(axis.title = element_text(face = "bold", size = 18),
          axis.text = element_text(size = 10),
          panel.grid.major.x = element_line(color = rgb(0.2, 0.2, 0.2, 0.1)))

  ggsave(outputfile, archives, ...)
}
