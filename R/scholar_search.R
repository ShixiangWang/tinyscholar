#' Search Google Scholar Highly Related Papers or Author
#'
#' @param keyword A keyword, can be author name, e.g. "Shixiang Wang".
#' @param is_author Default is `TRUE`, find author information, if `FALSE`, return the first page result in search engine.
#' @param server_url Server URL, here I use [Scale SERP API](https://www.scaleserp.com/google-scholar-api).
#' @param server_key Key for searching data (multiple is acceptable), you can obtain it from URL above. If not set, use personal key from Shixiang.
#' Total 125x2 free searches per month.
#'
#' @return A `data.frame` or a `list`.
#' @export
#'
#' @examples
#' \donttest{
#' x <- scholar_search("Shixiang Wang")
#' x
#' x <- scholar_search("Shixiang Wang", is_author = FALSE)
#' if (!is.null(x)) {
#'   x$gt
#' }
#' }
scholar_search <- function(keyword, is_author = TRUE, server_url = "https://api.scaleserp.com", server_key = NULL) {
  stopifnot(is.character(keyword), length(keyword) == 1, is.character(server_url), length(server_url) == 1)

  message("Searching ", ifelse(is_author, "author ", ""), keyword)
  message("Using API server: ", server_url)

  if (is.null(server_key)) {
    server_key <- c("4E4D8A41324841C9A283A8F520775132", "A6C716AB393448B19DFB7A242DB6605D")
    message("Using Shixiang's personal API key, only 125x2 free searches per month for all packages users")
  } else {
    message("Using API key: ", paste(server_key, collapse = ", "))
  }

  query_url <- paste0(
    server_url,
    "/search?api_key=",
    server_key,
    "&q=",
    gsub(" ", "+", keyword, fixed = TRUE),
    "&include_html=true&hl=en&scholar_include_citations=true&search_type=scholar&output=json"
  )

  if (length(query_url) > 1) {
    x <- NULL
    for (i in seq_along(query_url)) {
      message("querying with the ", i, "th API key")
      url <- query_url[i]
      x <- tryCatch(
        suppressWarnings(jsonlite::read_json(url)),
        error = function(e) {
          x <- curl::curl_fetch_memory(url)
          jsonlite::fromJSON(rawToChar(x$content))
        }
      )

      if (x$request_info$success) break()
    }


    if (is.null(x)) {
      message("query failed for multiple keys. Probably no free searches left this month.")
      return(NULL)
    }
  } else {
    x <- tryCatch(
      suppressWarnings(jsonlite::read_json(query_url)),
      error = function(e) {
        x <- curl::curl_fetch_memory(query_url)
        jsonlite::fromJSON(rawToChar(x$content))
      }
    )
  }

  if (!x$request_info$success) {
    message("No free searches left this month.")
    if (server_key %in% c("4E4D8A41324841C9A283A8F520775132", "A6C716AB393448B19DFB7A242DB6605D")) {
      message("You can apply your own key at https://scaleserp.com/")
    }
    return(invisible(NULL))
  }

  message("Search times used: ", x$request_info$credits_used)
  message("Search times left: ", x$request_info$credits_remaining)

  if (is_author) {
    page <- xml2::read_html(x$html)
    z <- rvest::html_elements(page, "#gs_res_ccl_mid > div:nth-child(1) > table")
    if (length(z) < 1) {
      message("No info found, the XPath to query info may be changed, please report to the developer.\nNULL will be returned!")
      return(invisible(NULL))
    }

    text <- rvest::html_text(z)
    loc <- stringr::str_locate_all(text, "Cited by [0-9]+")[[1]][, 2]
    loc_list <- split(sort(c(loc[-length(loc)], c(0, 1e4, loc[-length(loc)]) + 1)), rep(seq_along(loc), each = 2))

    text <- sapply(loc_list, function(x) {
      substr(text, x[1], x[2])
    })

    id <- gsub(".*user=([^&]+)&.*", "\\1", as.character(z))

    id <- stringr::str_extract_all(as.character(z), "user=([^&]+)&") %>%
      unlist() %>%
      stringr::str_remove("user=") %>%
      stringr::str_remove("&")

    authors <- data.frame(
      id = id,
      desc = as.character(text)
    )

    return(authors)
  } else {
    if (!is.null(x$scholar_results)) {
      xx <- x$scholar_results %>%
        purrr::transpose() %>%
        purrr::map(function(x) {
          y = lapply(x, function(x) ifelse(is.null(x), NA, x))
          unlist(y)
        }) %>%
        as.data.frame()
      xx$position <- NULL
      return(list(
        data = xx,
        gt = gt::gt(xx)
      ))
    }

    message("No data found in this query. Maybe try again?")
    return(invisible(NULL))
  }
}
