getwd()
setwd("~/R Class")


makeCacheMatrix <- function(x=matrix()) {
    i <- NULL
    set <- function(y){
        x <<-y
        i <<- NULL
    }
    get <- function()x
    setinverse <- function(inverse) i <<- inverse
    getinverse <- function()i
    list(set = set, 
         get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}


cacheSolve <- function(x, ...) {
    i <- x$getinverse()
    if(!is.null(i)) {
        message("getting cached data")
        return(i)
    }
    data <- x$get()
    i <- solve(data, ...)
    x$setinverse(i)
}


B <- matrix(c(1:4), 2, 2)
B
B1 <- makeCacheMatrix(B)
cacheSolve(B1)
