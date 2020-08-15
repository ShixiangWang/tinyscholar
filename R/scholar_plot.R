#' Show Scholar Profile Plot.
#'
#' @param profile Result from [tinyscholar].
#' @param bar_width bar width.
#' @param add_text If `TRUE` (default), add text on the top of bar.
#' @param title_citations Title for plot `citations`. Set by [ggplot2::labs].
#' @param title_publications Title for plot `publications`. Set by [ggplot2::labs].
#' @param caption_citations Caption for plot `citations`. Set by [ggplot2::labs].
#' @param caption_publications Caption for plot `publications`. Set by [ggplot2::labs].
#'
#' @return a length-2 list of [ggplot2::ggplot] object.
#' @export
#' @seealso [tinyscholar], [scholar_table]
scholar_plot <- function(profile,
                         bar_width = 0.5,
                         add_text = TRUE,
                         title_citations = NULL,
                         title_publications = NULL,
                         caption_citations = paste("Update:", Sys.Date()),
                         caption_publications = caption_citations) {
  stopifnot(inherits(profile, "ScholarProfile"))

  c <- ggplot(profile$citations, aes_string(x = "when", y = "count")) +
    geom_bar(stat = "identity", width = bar_width) +
    theme_minimal(base_size = 14) +
    labs(x = NULL, y = "Citations", title = title_citations, caption = caption_citations)

  p <- ggplot(
    profile$publications %>%
      dplyr::count(.data$year) %>%
      dplyr::add_row(year = "total", n = sum(.$n)),
    aes_string(x = "year", y = "n")
  ) +
    geom_bar(stat = "identity", width = bar_width) +
    theme_minimal(base_size = 14) +
    labs(x = NULL, y = "Publications", title = title_publications, caption = caption_publications)

  if (add_text) {
    c <- c + geom_text(aes_string(label = "count"), vjust = -0.2)
    p <- p + geom_text(aes_string(label = "n"), vjust = -0.2)
  }

  invisible(
    list(
      citations = c,
      publications = p
    )
  )
}
