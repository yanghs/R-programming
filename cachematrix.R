## Put comments here that give an overall description of what your
## functions do

# Matrix inversion is usually a costly computation and there may be some benefit
# to caching the inverse of a matrix rather than compute it repeatedly. The
# following two functions are used to cache the inverse of a matrix.


## Write a short comment describing this function
# 1. set the value of the matrix
# 2. get the value of the matrix
# 3. set the value of inverse of the matrix
# 4. get the value of inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
        inv<-NULL
        set<-function(y){
                x<<-y
                inv<<-NULL
        }
        get<-function() x
        setmatrix<-function(solve) inv<<- solve
        getmatrix<-function() inv
        list(set=set, get=get,
             setmatrix=setmatrix,
             getmatrix=getmatrix)
}



## Write a short comment describing this function
# The following function returns the inverse of the matrix. It first checks if
# the inverse has already been computed. If so, it gets the result and skips the
# computation. If not, it computes the inverse, sets the value in the cache via
# setinverse function.

# This function assumes that the matrix is always invertible.
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inv<-x$getmatrix()
        if(!is.null(inv)){
                message("getting cached data")
                return(inv)
        }
        matrix<-x$get()
        inv<-solve(matrix, ...)
        x$setmatrix(inv)
        inv
}
