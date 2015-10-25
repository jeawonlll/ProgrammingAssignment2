# See README.md for instructions on running the code and output from it 
# The assignment states that running the code is not part of the grading  
# but I have the instructions anyway. 
# makeCacheMatrix is a function that returns a list of functions 
# Its puspose is to store a martix and a cached value of the inverse of the  
# matrix. Contains the following functions: 
# * setMatrix      set the value of a matrix 
# * getMatrix      get the value of a matrix 
# * cacheInverse   get the cahced value (inverse of the matrix) 
# * getInverse     get the cahced value (inverse of the matrix) 
# 
# Notes: 
# not sure how the "x = numeric()" part works in the argument list of the  
# function, but it seems to be creating a variable "x" that is not reachable  
# from the global environment, but is available in the environment of the  
# makeCacheMatrix function 
makeCacheMatrix <- function(x = numeric()) { 
  
 # holds the cached value or NULL if nothing is cached 
 # initially nothing is cached so set it to NULL 
 cache <- NULL 
 
 # store a matrix 
 setMatrix <- function(newValue) { 
         x <<- newValue 
         # since the matrix is assigned a new value, flush the cache 
         cache <<- NULL 
 } 
 
 
         # returns the stored matrix 
         getMatrix <- function() { 
         x 
 } 

 
 # cache the given argument  
 cacheInverse <- function(solve) { 
         cache <<- solve 
 } 

 
 # get the cached value 
 getInverse <- function() { 
         cache 
 } 
  
 # return a list. Each named element of the list is a function 
 list(setMatrix = setMatrix, getMatrix = getMatrix, cacheInverse = cacheInverse, getInverse = getInverse) 
} 

 
50 
 
51 # The following function calculates the inverse of a "special" matrix created with  
52 # makeCacheMatrix 
53 cacheSolve <- function(y, ...) { 
54         # get the cached value 
55         inverse <- y$getInverse() 
56         # if a cached value exists return it 
57         if(!is.null(inverse)) { 
58                 message("getting cached data") 
59                 return(inverse) 
60         } 
61         # otherwise get the matrix, caclulate the inverse and store it in 
62         # the cache 
63         data <- y$getMatrix() 
64         inverse <- solve(data) 
65         y$cacheInverse(inverse) 
66          
67         # return the inverse 
68         inverse 
69 } 
