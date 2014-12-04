best <- function(state, outcome) {
        ## Read outcome data
        data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
        
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
        
        
        ## Return hospital name in that state with lowest 30-day death
        ## rate
        data <- data[data$State==state & data[outcome] != 'Not Available', ]
        vals <- data[, outcome]
        rowNum <- which.min(vals)
        data[rowNum, ]$Hospital.Name
}
