#' Show Scholar Profile Table
#'
#' @param profile Result from [tinyscholar].
#' @param title_citations Title for table `citations`. Set by [gt::tab_header].
#' @param title_publications Title for table `publications`. Set by [gt::tab_header].
#' @param caption_citations Caption for table `citations`. Set by [gt::tab_source_note].
#' @param caption_publications Caption for table `publications`. Set by [gt::tab_source_note].
#'
#' @return a length-2 list of [gt::gt] object.
#' @export
#' @seealso [tinyscholar], [scholar_plot]
scholar_table <- function(profile,
                          title_citations = "Citations",
                          title_publications = "Publications",
                          caption_citations = gt::md(paste("**Update**:", Sys.Date())),
                          caption_publications = caption_citations) {
  stopifnot(inherits(profile, "ScholarProfile"))

  c <- gt::gt(profile$citations) %>%
    gt::tab_header(title = title_citations) %>%
    gt::tab_source_note(caption_citations)
  p <- gt::gt(profile$publications) %>%
    gt::tab_header(title = title_publications) %>%
    gt::tab_source_note(caption_publications)

  invisible(
    list(
      citations = c,
      publications = p
    )
  )
}
