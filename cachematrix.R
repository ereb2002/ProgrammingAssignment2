## Put comments here that give an overall description of what your
## functions do


### Computing the inverse of a square matrix can be done with the `solve`
### function in R. For example, if `X` is a square invertible matrix, then
### `solve(X)` returns its inverse.

## Calculate the inverse matrix
makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y) {
            x <<- y
            m <<- NULL
    }
    get <- function() x
    setinverse <- function(solve) m <<- solve
    getinverse <- function() m
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}


## Gets from the cache or calculates the inverse matrix
cacheSolve <- function(x, ...) {
     m <- x$getinverse()
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    data <- x$get()
    m <- solve(data, ...)
    x$setinverse(m)
    m
}
