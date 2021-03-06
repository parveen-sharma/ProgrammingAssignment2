## April 26, 2015

## makeCacheMatrix: 
## This function creates a special "matrix" 
## object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  
  set <- function(y){
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setInvMatrix <- function(solve) m <<- solve
  getmatrix <- function() m
  
  list(set=set, get=get, setInvMatrix=setInvMatrix, getmatrix=getmatrix)
}

## cacheSolve: 
## This function computes the inverse of the special "matrix" 
## returned by makeCacheMatrix above. 
## If the inverse has already been calculated (and the matrix 
## has not changed), then the cachesolve should retrieve the 
## inverse from the cache.

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  m<-x$getmatrix()
  if(!is.null(m)){
    message("getting cached data")
    return(m)
  }
  matrix<-x$get()
  m<-solve(matrix, ...)
  x$setInvMatrix(m)
  m
}

# SAMPLE RUN
## x <- matrix(1:4, byrow=TRUE, nrow=2, ncol=2)
## m <- makeCacheMatrix(x)
## m$get()
## cacheSolve(m)


