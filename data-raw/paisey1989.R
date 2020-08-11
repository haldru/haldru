URL <- "https://raw.githubusercontent.com/haldru/Paisey1989/master/data/gnd.json"
entity_gnd <- unlist(jsonlite::read_json(URL))
entity_url <- paste0("http://hub.culturegraph.org/entityfacts/", entity_gnd)
entity_names <- sapply(entity_url, function(x) {
  res <- jsonlite::read_json(x)
  res$preferredName
})
paisey1989 <- data.frame(
  "id" = as.character(entity_gnd),
  "preferredName" = as.character(entity_names),
  stringsAsFactors=FALSE
)
usethis::use_data(paisey1989, overwrite = TRUE)
