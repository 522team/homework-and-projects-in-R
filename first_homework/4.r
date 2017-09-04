#a)
A = diag(3)
#b)
A[,2] = 3
#c)
sum = 0
for(i in A) {sum = i + sum}
#d)
sum(A[3,])   
sum(diag(A))    
sum(A[, 2])
#e)
B = matrix(rnorm(25, mean=7, sd=1), ncol=5, nrow=5)
#f)
C = rbind(B[1,] - B[2,], B[3,] + B[4,])
#g)
Q = matrix(diag(2:6), ncol=5)
C %*% Q
#h)
X = c(1, 3, 5, 8)
Y = c(5, 3, 2, 1)
covMat = CovMat2D(X, Y)
#i)
mean(X^2) == mean(X)^2 + var(X)
