These R files are assignments from R Programming course in Coursera.

1. 
Data
The zip file containing the data can be downloaded here:
specdata.zip [2.4MB]
The zip file contains 332 comma-separated-value (CSV) files containing pollution monitoring data for fine particulate matter (PM) air pollution at 332 locations in the United States. Each file contains data from a single monitor and the ID number for each monitor is contained in the file name. For example, data for monitor 200 is contained in the file "200.csv". Each file contains three variables:
Date: the date of the observation in YYYY-MM-DD format (year-month-day)
sulfate: the level of sulfate PM in the air on that date (measured in micrograms per cubic meter)
nitrate: the level of nitrate PM in the air on that date (measured in micrograms per cubic meter)

pollutantmean.R is a a function that calculates the mean of a pollutant (sulfate or nitrate) across a specified list of monitors.
complete.R is a function that returns a data frame where the first column is the name of the file and the second column is the number of complete cases.
corr.R a function that takes a directory of data files and a threshold for complete cases and calculates the correlation between sulfate and nitrate for monitor locations where the number of completely observed cases (on all variables) is greater than the threshold. 

2.
Assignment: Caching the Inverse of a Matrix

Matrix inversion is usually a costly computation and their may be some benefit to caching the inverse of a matrix rather than compute it repeatedly (there are also alternatives to matrix inversion that we will not discuss here). Your assignment is to write a pair of functions that cache the inverse of a matrix.

cachematrix.R includes the following two functions.
makeCacheMatrix: This function creates a special "matrix" object that can cache its inverse.
cacheSolve: This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. If the inverse has already been calculated (and the matrix has not changed), then the cachesolve should retrieve the inverse from the cache.
Computing the inverse of a square matrix can be done with the solve function in R. For example, if X is a square invertible matrix, then solve(X) returns its inverse.

3.
Data
The zip file containing the data for this assignment can be downloaded here:
Programming Assignment 3 Data [832K]

best.R is a function to find the best hospital in a state.
rankHospital.R is a function that ranks hospitals by outcome in a state.
rankall.R is a function that ranks hospitals in all states.



=============
