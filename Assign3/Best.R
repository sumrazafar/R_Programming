best <- function(state, outcome){
  #read the source file
  datasource <- read.csv("data/outcome-of-care-measures.csv", colClasses = "character")
  #check input as valid
  valid <- c("heart attack", "heart failure" , "pneumonia")
  if(!state %in% datasource$State){
    stop("invalid state")
  }else if(!outcome %in% valid){
    stop("invalid outcome")
  }
  
  #use min function to fetch the resultset
  if(outcome == "heart attack"){
    index <- 11
  }else if (outcome == "heart failure"){
    index <- 17
  }else{
    index <- 23
  }
  
  #get state data only
  datasource <- datasource[datasource$State == state, ]
  
  #remove NAs
  #datasource <-datasource[complete.cases(datasource[, index]),]
  
  #change datatype to numeric
  datasource[, c(11, 17, 23)] <- suppressWarnings(sapply(datasource[, c(11, 17, 23)], as.numeric))
  
  #order data by hospital Name
  datasource <- datasource[order(datasource[, 2]), ]
  
  resultset <- datasource[which.min(datasource[, index]), "Hospital.Name"]
  
  resultset
}