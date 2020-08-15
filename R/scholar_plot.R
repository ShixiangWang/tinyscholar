#' Show Scholar Profile Plot.
#'
#' @param profile Result from [tinyscholar].
#' @param title_citations Title for plot `citations`. Set by [ggplot2::labs].
#' @param title_publications Title for plot `publications`. Set by [ggplot2::labs].
#' @param caption_citations Caption for plot `citations`. Set by [ggplot2::labs].
#' @param caption_publications Caption for plot `publications`. Set by [ggplot2::labs].
#'
#' @return a length-2 list of [ggplot2::ggplot] object.
#' @export
#' @seealso [tinyscholar], [scholar_table]
scholar_plot <- function(profile,
                          title_citations = NULL,
                          title_publications = NULL,
                          caption_citations = paste("Update:", Sys.Date()),
                          caption_publications = caption_citations) {
  stopifnot(inherits(profile, "ScholarProfile"))

  c <- ggplot(profile$citations, aes_string(x = "when", y = "count")) +
    geom_bar(stat = "identity") + theme_minimal(base_size = 14) +
    labs(x = NULL, y = "Citations", title = title_citations, caption = caption_citations)

  p <- ggplot(profile$publications %>%
                dplyr::count(.data$year) %>%
                dplyr::add_row(year = "total", n = sum(.$n)),
              aes_string(x = "year", y = "n")) +
    geom_bar(stat = "identity") + theme_minimal(base_size = 14) +
    labs(x = NULL, y = "Publications", title = title_publications, caption = caption_publications)

  invisible(
    list(
      citations = c,
      publications = p
    )
  )
}
