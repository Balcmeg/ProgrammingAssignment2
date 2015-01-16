### Function makeCacheMatrix(x) take an invertible matrix as input x and cache it
makeCacheMatrix <- function(x = matrix()) {
      ## Initialise 'm' as NULL
      m<-NULL
      ## Create local function 'set' to cache matrix. 
      ## Set take value 'y' and write to cache variable 'x' and
      ## initialise 'm' as NULL as chache matrix variable.
      set<-function(y){
            x<<-y
            m<<-NULL
      }
      ## Create local function 'get' to fetch variable 'x' from cache
      get<-function() x
      ## Create local function 'setmatrix' to solve matrix inverse and write to 
      ## cache.
      setmatrix<-function(solve) m<<- solve
      ## Create local function 'getmatrix' to fetch cachad invere matrix .
      getmatrix<-function() m
      ## Use "list" command to create an object with the previoulsly created
      ## methods.
      list(set=set, get=get, setmatrix=setmatrix,  getmatrix=getmatrix)
}


## cacheSolve(x, ...) return the inverse of the input matrix x, or if the
## inverse already exist in the working directory, read this from cache.
cacheSolve <- function(x, ...) {
}