### Function 'makeCacheMatrix(x)' take an invertible matrix as input 'x' and 
### cache it as an object with functions to access and write the data
makeCacheMatrix <- function(x = matrix()) {
      ## Initialise 'm' as NULL
      CachedMatrix<-NULL
      ## Create local function 'set' to cache matrix. 
      ## Set take value 'y' and write to cache variable 'x' and
      ## initialise 'm' as NULL as chache matrix variable.
      set<-function(y){
            x<<-y
            CachedMatrix<<-NULL
      }
      ## Create local function 'get' to fetch variable 'x' from cache (original matrix)
      get<-function() x
      ## Create local function 'setmatrix' to solve matrix inverse and write to 
      ## cache.
      setmatrix<-function(solve) CachedMatrix<<- solve
      ## Create local function 'getmatrix' to fetch cachad invere matrix .
      getmatrix<-function() CachedMatrix
      ## Use "list" command to create an object with the previoulsly created
      ## methods.
      list(set=set, get=get, setmatrix=setmatrix,  getmatrix=getmatrix)
}


## 'cacheSolve(x, ...)' return the inverse of the input matrix object from 
## 'makeCacheMatrix' 'x', or if the
## inverse already exist in the working directory, read this from cache.
cacheSolve <- function(x=matrix(), ...) {
      ## fetch inverse matrix from matrix object 'x' using 'getmatrix' method in 'makeCacheMatrix'
      m<-x$getmatrix()
      ## if content of matrix 'm' (cached inverse) is NULL, return 'm' from function and exit
      if(!is.null(m)){
            message("getting cached data")
            return(m)
      }
      ## if inverse matrix data doesnt exist, computer inverse
      matrix<-x$get()
      ## solve inverse matrix and place in matrix object 'x' by mehtod 'setmatrix'
      m<-solve(matrix, ...)
      x$setmatrix(m)
      ##return inverse matrix
      m
}