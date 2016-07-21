
#' Function to add scraped dataframes as tables in the escape database
#'
#' @param activity Data frame returned from activity scraping function
#' @param food Data frame returned from food scraping function
#' @param DM Data frame of distance matrix generated from location data scraped into respective tables
#' @param city String of the city name wished to add to escape database
#'
write_db_tables <- function(activity, food, DM, city) {

  #load necessary package for SQL
  library(RSQLite)

  #connect to escape database
  db <- dbConnect(SQLite(), "escapeDB.sqlite")

  #create names of database tables w/city name
  actName <- paste(city, ".activity", sep ="")
  foodName <- paste(city, ".food", sep ="")
  dmName <- paste(city, ".dm", sep ="")

  #write tables to database:
  #activity
  dbWriteTable(db, actName, activity, overwrite = TRUE)
  #food
  dbWriteTable(db, foodName, food, overwrite = TRUE)
  #distance matrix
  dbWriteTable(db, dmName, DM, overwrite = TRUE)

  #disconnect from database to ensure correct writing to .sqlite file
  dbDisconnect(db)
}
