## makeCacheMatrix() acts as a getter and setter methods for the original matrix and the inverse of the matrix
## cacheSolve() function inverses the matrix and returns the inverses matrix; if already cached ruturns from the cache.
 

##makeCacheMatrix() acts as a getter and setter methods for the original matrix and the inverse of the matrix
##Parameters:
## Input : omatrix - Takes square matrix as input
## Output: returns the list of getter and setter methods.
makeCacheMatrix <- function(omatrix = matrix()) {
        
        imatrix <- NULL
     
        setInverseMatrix <- function(y) {
                imatrix <<- y
               
        }

        getInverseMatrix <- function() {
                imatrix
                
        }
        
        getOriginalMatrix <- function() {
                omatrix
                
        }
        setOriginalMatrix <- function(om) {
                omatrix <<- om
                imatrix <<- NULL
                
        }
       
         list(setInverseMatrix = setInverseMatrix, getInverseMatrix = getInverseMatrix, getOriginalMatrix = getOriginalMatrix, setOriginalMatrix = setOriginalMatrix )
}


## cacheSolve() function inverses the matrix and returns the inverses matrix; if already cached ruturns from the cache.
##Parameters:
## Input : x - Takes makeCacheMatrix object as an input
## Output: returns the inverse of the matrix

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inverseMatrix <- x$getInverseMatrix()
        ##originalMatrix <- mcm$getOriginalMatrix()
        if(!is.null(inverseMatrix))
        {
                message("getting cached data")
               return(inverseMatrix) 
        }
        calinverseMatrix <- solve(x$getOriginalMatrix())
        x$setInverseMatrix(calinverseMatrix)
        calinverseMatrix
}
