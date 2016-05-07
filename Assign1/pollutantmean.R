pollutantmean <- function(directory, pollutant, id = 1:332) {
    ##read all the files in the directory
	fileList <- list.files(directory, full.names = TRUE) 
    
	#create an empty data frame 
    DataSet <- data.frame()
    
	#loop through the ids to pick the file names... if file name = ids then add in datset
    for (i in id) {
		DataSet <- rbind(DataSet, read.csv(fileList[i]))
    }
    
	## remove NA values
	mean(DataSet[, pollutant], na.rm = TRUE)

}