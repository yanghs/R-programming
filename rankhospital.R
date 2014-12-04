rankhospital <- function(state, outcome, num = "best") {
        ## Read outcome data
        data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
        suppressWarnings(data[, 11] <- as.numeric(data[, 11]))
        suppressWarnings(data[, 17] <- as.numeric(data[, 17]))
        suppressWarnings(data[, 23] <- as.numeric(data[, 23]))
        
        ## Check that state and outcome are valid
        states <- data[, 7]
        states <- unique(states)
        if( state %in% states == FALSE ) stop("invalid state")
        
        ## simplify the outcome names
        names(data)[11] <- "heart attack"
        names(data)[17] <- "heart failure"
        names(data)[23] <- "pneumonia"
        outcomes = c("heart attack", "heart failure", "pneumonia")
        if( outcome %in% outcomes == FALSE ) stop("invalid outcome")
        
        ## Return hospital name in that state with the given rank
        ## 30-day death rate
        data <- data[data$State==state & data[outcome] != 'Not Available', ]
        data <- data[order(data[outcome], data$Hospital.Name, decreasing = FALSE), ]
        
        ## Process the num argument
        vals <- data[, outcome]
        if( num == "best" ) {
                rowNum <- which.min(vals)
        } else if( num == "worst" ) {
                rowNum <- which.max(vals)
        } else {
                rowNum <- num
        }
        data[rowNum, ]$Hospital.Name
}