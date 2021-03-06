## Matrix inversion is usually a costly computation and there may be some
## benefit to caching the inverse of a matrix rather than compute it repeatedly 
## The following functions allowa to cache the inverse of a matrix.

## makeCacheMatrix creates a special matrix, which contain a function to

## 1. set the value of the matrix

## 2. get the value of the matrix

## 3. set the value of inverse of the matrix

## 4. get the value of inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) m <<- inverse
  getinverse <- function() m
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}

## The following function returns the inverse of the matrix

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
