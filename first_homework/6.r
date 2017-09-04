data = read.csv('./data/hw1q6_new.csv', header=F)
course1 = data[, 1]
course2 = data[, 2]
#6-1
mean1 = mean(course1)
mean2 = mean(course2)
median1 = median(course1)
median2 = median(course2)
var1 = var(course1)
var2 = var(course2)
range1 = range(course1)
range2 = range(course2)

#6-2
percentiles1 = quantile(course1, c(.25, .50, .75))
percentiles2 = quantile(course2, c(.25, .50, .75))

#6-3
ggplot(NULL, aes(x=course1)) +  
geom_histogram(bins=10, aes(y=..density..)) + 
geom_density()

ggplot(NULL, aes(x=course2)) +  
geom_histogram(bins=10, aes(y=..density..)) + 
geom_density

#6-4
geom_line(aes(x=c(0, (100-mean2)/sqrt(var2)), y=c(mean2, 100)))
ggplot(NULL) +  stat_qq(aes(sample=course2)) + geom_abline(intercept=mean2, slope=sqrt(var2), color='red')
ggplot(NULL) +  stat_qq(aes(sample=course1)) + geom_abline(intercept=mean1, slope=sqrt(var1), color='red')