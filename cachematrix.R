
## example of using two functions below:
## a0 <- matrix(c(1,2,3,4,5,6,1,4,4),3,3)
## a1 <- makeCacheMatrix(a0)
## a2 <- cacheSolve(a1)

## function to create cache of a matrix to track status 

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
          x <<- y
          m <<- NULL
        }
        get <- function() x
        setinv <- function(solve) m <<- solve
        getinv <- function() m
        list(set = set, get = get,
             setinv = setinv,
             getinv = getinv)
}


## function to invert a matrix if it is not already inverted

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        m <- x$getinv()
        if(!is.null(m)) {
          message("getting cached data")
          return(m)
        }
        message("inverting...")
        data <- x$get()
        m <- solve(data, ...)
        x$setinv(m)
        m
  
}
