##part 2
complete <- function(directory, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        files <- list.files(directory, full.names=TRUE)
        dat <- data.frame()
        for (i in 1:332) {
                dat <- rbind(dat, read.csv(files[i]))
        }
        
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        dat_subset <- data.frame()
        for (i in id){
                dat_subset <- rbind(dat_subset, dat[which(dat[, "ID"] == i),])
        }
        
        ## Return a data frame of the form:
        ## id nobs
        ## 1  117
        ## 2  1041
        ## ...
        ## where 'id' is the monitor ID number and 'nobs' is the
        ## number of complete cases
        x <- vector()
        y <- vector()
        for (i in id){
                x <- c(x, i)
                y <- c(y, sum(complete.cases(dat[which(dat[, "ID"] == i),])))
        }
        
        df <- data.frame(x, y)
        colnames(df) <- c("id","nobs")
        return(df)        
}
