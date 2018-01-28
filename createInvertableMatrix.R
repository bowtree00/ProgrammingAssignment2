createInvertableMatrix <- function() {
    
Mat1 <- matrix(rnorm(100), ncol=4)
Mat2 <- matrix(rnorm(100), ncol=4)

crossprod(Mat1,Mat2)

# solve( crossprod(Mat1,Mat2) )

}
