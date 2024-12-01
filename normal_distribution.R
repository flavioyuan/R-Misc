
num <- 1000
normal <- rnorm(num, mean=0, sd=1)
normal1 <- rnorm(num, mean=10, sd=5)

# Funcao distribuicao acumulada
pontos <- c(-1, 0, 1)
pnorm(pontos, mean=0, sd=1)

# Densidade
pontos <- c(-2, 0, 2)
dnorm(pontos, mean=0, sd=1)

par(mfrow=c(2,1))
hist(normal)
hist(normal1)
