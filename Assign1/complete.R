complete <- function(directory, id = 1:332) {
        fileList <- list.files(directory, full.names = TRUE)
        DataSet <- data.frame()
        #loop through the ids to pick the file names
        for (i in id) {
				#read the file and sum the complete cases for that file
                ifile <- read.csv(fileList[i])
                nobs <- sum(complete.cases(ifile))
				#put it back in the dataset 
                DataSet <- rbind(DataSet, data.frame(i, nobs))
        }
        #assign col names
        colnames(DataSet) <- c("id", "nobs")
        #return the dataset
		DataSet
}
