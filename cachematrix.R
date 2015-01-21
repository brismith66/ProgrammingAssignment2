## This contains 
## makeCacheMatrix 
## cacheSolve

## makeCacheMatrix
##    accepts a parameter of type matrix
##    returns a list with methods for get/set, and getinv/setinv
makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setsolve <- function(inv) { 
    print("setsolve: hello: m is: ")
    print(m)
    print("setsolve: and inv is ")
    print(inv)
    print("setsolve: bye")
    m <<- inv
  }
  getsolve <- function() { 
    print("getsolve: hello")
    
    m
  }
  list(set=set, get=get, setsolve=setsolve, getsolve=getsolve)
}


## cacheSolve 
##    accepts a parameter of type makeCacheMatrix
##    returns the inverse of the matrix
cacheSolve <- function(x, ...) {
  print("cacheSolve: hello")
  m <- x$getsolve()
  print("cacheSolve: m is ")
  print(m)
  print("cacheSolve: m's class is " )
  print(class(m))
  print("cacheSolve: is.null(m) is ")
  print(is.null(m))
  if (!is.null(m)) {
    print("getting cached solution")
    return(m)
  }
  mat <- x$get()
  m <- solve(mat)
  x$setsolve(m)
  m
}