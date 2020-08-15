#' Get Google Scholar Profile
#'
#' @param id Your google scholar identifier. You can find it in the URL of your google scholar profile.
#' @param sortby_date Logical. If `TRUE`, the publications are sorted by date.
#' @param server Web api server, default is [hiplot platform](https://hiplot.com.cn/).
#'
#' @return a `Profile` object with list structure.
#' @export
#'
#' @examples
#' r <- tinyscholar("FvNp0NkAAAAJ")
#' r
#' tb <- scholar_table(r)
#' tb$citations
#' tb$publications
#' pl <- scholar_plot(r)
#' pl$citations
#' pl$publications
tinyscholar <- function(id, sortby_date = FALSE, server = c("hiplot", "cse")) {
  server <- match.arg(server)

  if (server == "hiplot") {
    server_url <- "https://api.hiplot.org/google/scholar.php"
  } else {
    server_url <- "http://cse.bth.se/~fer/googlescholar-api/googlescholar.php"
  }

  url <- paste0(
    server_url,
    "?user=",
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
  class(r) <- c("ScholarProfile", class(r))
  r
}
