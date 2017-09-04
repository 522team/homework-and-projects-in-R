library(ggplot2)

#5-1
data = read.csv('./data/iris.csv', header=TRUE)
# plot(data$petal_length, data$petal_width,type="p", xlab="petal_length", ylab="petal_width")​
ggplot() +
geom_point(data = data, mapping = aes(x = petal_length, y = petal_width)) + 
geom_point(data = data.frame(length=c(1,2), width=c(2,3)), mapping=aes(x=length, y=width), color="blue", shape=4)

#5-2
mean_length = mean(data$petal_length)
mean_width = mean(data$petal_width)

#5-3
data2D = cbind(data$petal_length, data$petal_width)
mean = c(mean_length, mean_width)
covMat = CovMat2D(data2D[, 1], data2D[, 2])

CalEuclideanWith = (function(x, f) function(y) f(x, y))(mean, Euclidean)
CalCityBlockWith = (function(x, f) function(y) f(x, y))(mean, CityBlock)
CalMinkowskiWith = (function(x, r, f) function(y) f(x, y, r))(mean, 3, Minkowski)
CalChebyshevWith = (function(x, f) function(y) f(x, y))(mean, Chebyshev)
CalCosineWith = (function(x, f) function(y) f(x, y))(mean, Cosine)
CalMahalanobisWith = (function(x, cov, f) function(y) f(x, y, cov))(mean, covMat, Mahalanobis)

eucDis = mapMat(data2D, CalEuclideanWith)
cityDis = mapMat(data2D, CalCityBlockWith)
minkDis = mapMat(data2D, CalMinkowskiWith)
chebDis = mapMat(data2D, CalChebyshevWith)
cosDis = mapMat(data2D, CalCosineWith)
mahaDis = mapMat(data2D, CalMahalanobisWith)

#5-4
eucNearestTen= data[order(eucDis)[1:10],]
cityNearestTen= data[order(cityDis)[1:10],]
minkNearestTen= data[order(minkDis)[1:10],]
chebNearestTen= data[order(chebDis)[1:10],]
cosNearestTen= data[order(cosDis)[1:10],]
mahaNearestTen= data[order(mahaDis)[1:10],]

myPlot = function(nodes) {
	ggplot(mapping = aes(x = petal_length, y = petal_width)) +
	geom_point(data = nodes,  shape=1, color='blue', size=3) +
	geom_point(data = data.frame(petal_length=mean_length, petal_width=mean_width), shape=4, size=3)
}

myPlot(eucNearestTen)
myPlot(cityNearestTen)
myPlot(minkNearestTen)
myPlot(chebNearestTen)
myPlot(cosNearestTen)
myPlot(mahaNearestTen)
