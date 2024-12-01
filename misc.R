# Creating a vector
m <- c(8, 10 , 2, 5)
cat("vector m: ", m)

m[2]
typeof(m)

m[c(1,3)]
m[1:3]
m[3] <- 20
m

m[m>5] <- 0
m

v <- seq(1, 50, length.out=30)
v
