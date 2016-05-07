rankhospital <- function(state, outcome, num = "best"){
  #read the source file
  datasource <- read.csv("data/outcome-of-care-measures.csv", colClasses = "character")
  #check input as valid
  valid <- c("heart attack", "heart failure" , "pneumonia")
  if(!state %in% datasource$State){
    stop("invalid state")
  }else if(!outcome %in% valid){
    stop("invalid outcome")
  }
  
  if(outcome == "heart attack"){
    index <- 11
  }else if (outcome == "heart failure"){
    index <- 17
  }else{
    index <- 23
  }
  
  #get state data only
  datasource <- datasource[datasource$State == state, ]
  
  #change datatype to numeric
  datasource[, c(11, 17, 23)] <- suppressWarnings(sapply(datasource[, c(11, 17, 23)], as.numeric))
  
  #remove NA
  datasource <- datasource[complete.cases(datasource), ]
  
  if(num == "best") {
    num = 1
  }
  else if(num == "worst") {
    num = nrow(datasource)
  }
  else if(is.numeric(x=num)) {
    if(num<1 || num > nrow(datasource)) {
      return(NA)
    }
  }
  else {
    stop('invalid num')
  }
  #order the dataset
  datasource <- datasource[order(datasource[,index], datasource$Hospital.Name), ]
  
  #get the specific order item
  resultset <- datasource[num, ]$Hospital.Name
  
  resultset
}