## Matrix inversion can be a time consuming computation.
## Using some R functions related to lexical scoping, 
## it can be done more efficiently.

## makeCacheMatrix: This function creates a special 
## "matrix" object that can cache its inverse.

x<- (matrix(c(1,2,3,4), nrow=2))
makeCacheMatrix <- function(x = matrix()) {
        makeCacheMatrix <- function(x = numeric()) {
                s <- NULL
                set <- function(y) {
                        x <<- y
                        s <<- NULL
                }
                get <- function() x
                setsolve <- function(solve) s <<- solve
                getsolve <- function() s
                list(set = set, get = get,
                     setsolve = setsolve,
                     getsolve = getsolve)
        }}
        
## cacheSolve: This function computes the inverse of the 
## special "matrix" returned by makeCacheMatrix above. 
## If the inverse has already been calculated
## (and the matrix has not changed), then the cachesolve 
## should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
                s <- x$getsolve()
                if(!is.null(s)) {
                        message("getting cached data")
                        return(s)
                }}
