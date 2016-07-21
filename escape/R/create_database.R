
#if no data base, make one

create_database <- function(x = -1){

  #if database file already exists in directory, move along
  if(check_database()){
    return(TRUE)
  }

  #otherwise, create db file for later use writing tables
  else {
    db <- dbConnect(SQLite(), "escapeDB.sqlite")
    return(TRUE)
  }
}

check_database <- function(x = -1){
  files <- list.files()
  for(c in 1:length(test)){
    if (files[[c]] == "escapeDB.sqlite"){
      return(TRUE)
    }
  }

  return(FALSE)
}
