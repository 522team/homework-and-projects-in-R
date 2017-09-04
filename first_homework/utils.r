Euclidean = function(x, y) sqrt(sum((x - y)^2))

CityBlock = function(x, y) sum(abs(x - y))

Minkowski = function(x, y, r) sum(abs(x - y) ^ r) ^ (1 / r)

Chebyshev = function(x, y) max(abs(x - y))

Cosine = function(x, y) 1 - sum((x * y)) / (sqrt(sum(x^2)) * sqrt(sum(y^2)))

Mahalanobis = function(x, y, covMatrix) {
	mat = matrix((x - y), nrow=1)
	return(sqrt(mat %*% solve(covMatrix) %*% t(mat)))
}

CovMat2D = function(x, y) {
	var_x = var(x)
	var_y = var(y)
	cov_xy = cov(x, y)
	return(matrix(c(var_x, cov_xy, cov_xy, var_y), ncol=2))
}

mapMat = function(x, func) {
	y = c()
	for(i in 1:nrow(x)) {
		y[i] = func(x[i,])
	}
	return(y)
}

