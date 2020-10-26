#' Get Google Scholar Profile
#'
#' @param id Your google scholar identifier. You can find it in the URL of your google scholar profile.
#' @param sortby_date Logical. If `TRUE`, the publications are sorted by date.
#' @param use_cache If `TRUE` (default), store data to a cache file to avoid querying in next time within a day.
#' The store file is identical for each person and each date.
#' @param cache_dir A directory path.
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
tinyscholar <- function(id, sortby_date = FALSE,
                        use_cache = TRUE, cache_dir = file.path(tempdir(), "tinyscholar")) {
  stopifnot(is.character(id), length(id) == 1)

  if (use_cache) {
    message("Using cache directory: ", cache_dir)

    cache_file <- file.path(
      cache_dir,
      paste0(
        ifelse(sortby_date, "sorted_", "unsorted_"),
        Sys.Date(), "_", id, ".rds"
      )
    )
    if (file.exists(cache_file)) {
      message("Data found, done")
      return(readRDS(cache_file))
    } else {
      message("Cannot find cache file ", cache_file)
    }
  }

  server_url1 <- "https://api.hiplot.org/google/scholar.php"
  server_url2 <- "http://cse.bth.se/~fer/googlescholar-api/googlescholar.php"

  url1 <- paste0(
    server_url1,
    "?user=",
    id,
    ifelse(sortby_date,
      "%26view_op=list_works%26sortby=pubdate",
      ""
    )
  )
  url2 <- paste0(
    server_url2,
    "?user=",
    id,
    ifelse(sortby_date,
      "%26view_op=list_works%26sortby=pubdate",
      ""
    )
  )

  r <- tryCatch(
    expr = {
      message("Try quering data from server: hiplot")
      R.utils::withTimeout(
        {
          suppressWarnings(jsonlite::read_json(url1, simplifyVector = TRUE))
        },
        timeout = 5
      )
    },
    error = function(ex) {
      message("Timeout/error when use hiplot server. Switch to use the server: cse.")
      R.utils::withTimeout(
        {
          suppressWarnings(jsonlite::read_json(url2, simplifyVector = TRUE))
        },
        timeout = 30
      )
    }
  )

  r$citations_per_year <- sapply(r$citations_per_year, function(x) x)
  # r$publications$title <- gsub("&#8217;", "'", r$publications$title)
  r$publications <- lapply(r$publications, function(x) gsub("(&#8217;)|(&#39;)", "'", x)) %>%
    as.data.frame()
  r$citations <- data.frame(
    when = c("total", names(r$citations_per_year)),
    count = c(r$total_citations, as.integer(r$citations_per_year))
  )
  r$total_citations <- r$citations_per_year <- NULL
  class(r) <- c("ScholarProfile", class(r))

  if (use_cache) {
    message("Save data to cache file ", cache_file)

    if (!dir.exists(dirname(cache_file))) {
      dir.create(dirname(cache_file), recursive = TRUE)
    }

    saveRDS(r, file = cache_file)
  }

  message("Done")
  r
}
