#' Main escape city creation function: take in city name, scrape tables, write tables to database
#'
#' @param city String of the city name wished to add to escape database
#' @export
add_city <- function(city){

  #scrape and store main tables
  activity <- scrape_activity(city)
  food <- scrape_food(city)

  #make distance matrix from location data scraped above
  DM <- generate_DM(activity, food)

  #write these tables into pre-existing database
  write_db_tables(activity, food, DM, city)

}


