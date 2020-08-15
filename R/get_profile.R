#' Get Google Scholar Profile
#'
#' @param id Your google scholar identifier. You can find it in the URL of your google scholar profile.
#' @param sortby_date Logical. If `TRUE`, the publications are sorted by date.
#'
#' @return a `Profile` object with list structure.
#' @export
#'
#' @examples
#' r <- get_profile("FvNp0NkAAAAJ")
#' r
get_profile <- function(sortby_date = FALSE) {
  url <- paste0(
    "http://cse.bth.se/~fer/googlescholar-api/googlescholar.php?user=",
    id,
    ifelse(sortby_date,
           "%26view_op=list_works%26sortby=pubdate",
           "")
  )
  r <- jsonlite::read_json(url, simplifyVector = TRUE)
  r$citations_per_year <- sapply(r$citations_per_year, function(x) x)
  #r$publications$title <- gsub("&#8217;", "'", r$publications$title)
  r$publications <- lapply(r$publications, function(x) gsub("&#8217;", "'", x)) %>%
    as.data.frame()
  r$citations <- data.frame(
    when = c("total", names(r$citations_per_year)),
    count = c(r$total_citations, as.integer(r$citations_per_year))
  )
  r$total_citations <- r$citations_per_year <- NULL
  class(r) <- c("profile", class(r))
  r
}
