corr <- function(directory, threshold = 0) {
        fileList <- list.files(directory, full.names = TRUE)
        DataSet <- vector(mode = "numeric", length = 0)
        
        for (i in 1:length(fileList)) {
                ifile <- read.csv(fileList[i])
                csum <- sum((!is.na(ifile$sulfate)) & (!is.na(ifile$nitrate)))
                if (csum > threshold) {
                        temp <- ifile[which(!is.na(ifile$sulfate)), ]
                        submoni_i <- temp[which(!is.na(temp$nitrate)), ]
                        DataSet <- c(DataSet, cor(submoni_i$sulfate, submoni_i$nitrate))
                }
        }
        
        DataSet
}