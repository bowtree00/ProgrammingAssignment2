# These functions enable a user to create a cacheable matrix object
# and to calculate the inverse of a matrix and store it in the cache.
# If a request is made to invert the matrix, the cacheSolve function
# Will first check whether an inverted matrix is cached already,
# and if not will perform the inversion and store it in the cache.

# Creates a special "matrix" object that can cache its inverse
# See meanCacheExample.R 
makeCacheMatrix <- function(x = matrix()) {
    
    inv <- NULL
    
    set <- function(y) {
        # First set x (the existing matrix) to the new matrix y
        # Then set inv back to NULL
        x <<- y
        inv <<- NULL
    }
    
    get <- function() x
    
    setinv <- function(invMatrix) inv <<- invMatrix 
    
    getinv <- function() inv
    
    list(set = set, get = get, setinv = setinv, getinv = getinv)
    
}


# Computes the inverse of a special matrix
# If the inverse is already calculated (and matrix is not changed),
# should retrieve the inverse from the cache

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    
    inv <- x$getinv()
    
    if(!is.null(inv)) {
        message("Getting cached data")
        return(inv)
    }
    
    data <- x$get()
    inv <- solve(data, ...)
    x$setinv(inv)
    inv
}





