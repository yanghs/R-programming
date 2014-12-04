pollutantmean <- function(directory, pollutant, id = 1:332) {
        files <- list.files(directory, full.names=TRUE)
        dat <- data.frame()
        for (i in 1:332) {
                dat <- rbind(dat, read.csv(files[i]))
        }
        str(dat)

        dat_subset <- data.frame()
        for (i in id){
                dat_subset <- rbind(dat_subset, dat[which(dat[, "ID"] == i),])
        }
        str(dat_subset)

        mean(dat_subset[,pollutant], na.rm=TRUE)
}


weightmedian <- function(directory, day)  {
        files_list <- list.files(directory, full.names=TRUE)   #creates a list of files
        dat <- data.frame()                             #creates an empty data frame
        for (i in 1:5) {                                
                #loops through the files, rbinding them together 
                dat <- rbind(dat, read.csv(files_list[i]))
        }
        dat_subset <- dat[which(dat[, "Day"] == day),]  #subsets the rows that match the 'day' argument
        median(dat_subset[, "Weight"], na.rm=TRUE)      #identifies the median weight 
        #while stripping out the NAs
}