rankall <- function(outcome, num = "best") {
        ## Read outcome data
        data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
        suppressWarnings(data[, 11] <- as.numeric(data[, 11]))
        suppressWarnings(data[, 17] <- as.numeric(data[, 17]))
        suppressWarnings(data[, 23] <- as.numeric(data[, 23]))
        
        ## Check that state and outcome are valid
        states <- data[, 7]
        states <- sort(unique(states))
        #if( state %in% states == FALSE ) stop("invalid state")
        
        ## simplify the outcome names
        names(data)[11] <- "heart attack"
        names(data)[17] <- "heart failure"
        names(data)[23] <- "pneumonia"
        outcomes = c("heart attack", "heart failure", "pneumonia")
        if( outcome %in% outcomes == FALSE ) stop("invalid outcome")
        
        ## For each state, find the hospital of the given rank
        ## Return a data frame with the hospital names and the
        ## (abbreviated) state name
        #data$rank <- ave(data[outcome], data$Hospital.Name, FUN=rank)
        
        result.df <- list()
        result <- character(0)
        for(state in states) {
                d <- data[data$State==state & data[outcome] != 'Not Available', ]
                d <- d[order(d[outcome], d$Hospital.Name, decreasing = FALSE), ]
                
                ## Process the num argument
                vals <- d[, outcome]
                if( num == "best" ) {
                        rowNum <- 1
                } else if( num == "worst" ) {
                        rowNum <- which.max(vals)
                } else {
                        rowNum <- num
                }
                result <- c(result, d[rowNum, ]$Hospital.Name)                
        }
        
        
        # --- Return value is a data frame (hospital, state)
        return(data.frame(hospital = result, state = states))
}
                