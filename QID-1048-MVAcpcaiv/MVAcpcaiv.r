# clear variables and close windows
rm(list = ls(all = TRUE))
graphics.off()

# set working directory
# setwd("C:/...")

# load data
data1 = read.table("XFGvolsurf01.dat")  # 1 month maturity data
data2 = read.table("XFGvolsurf02.dat")  # 2 months maturity data
data3 = read.table("XFGvolsurf03.dat")  # 3 months maturity data

K      = length(C)            # number of groups
P      = dim(data1)[2]        # number of variables

# sample covariance matrices
C      = vector("list", K)
C[[1]] = cov(data1)
C[[2]] = cov(data2)
C[[3]] = cov(data3) 

# CPCA computation
L = 15  # number of iterations
B = diag(P)
T = vector("list", K)
d1 = rep(0, K)
d2 = rep(0, K)

for (l in 1:L) {
  for (p in 1:(P - 1)) {
    for (e in (p + 1):P) {
      Q = diag(2)
      M = diag(2)
      for (k in 1:K) {
        H = B[, c(p, e)]
        T[[k]] = t(H) %*% C[[k]] %*% H
        d1[k] = t(Q[, 1]) %*% T[[k]] %*% Q[, 1]
        d2[k] = t(Q[, 2]) %*% T[[k]] %*% Q[, 2]
        M = M + (d1[k] - d2[k])/(d1[k] * d2[k]) * T[[k]]
      }
      eig <- eigen(M)
      Q = eig$vectors
      B[, c(p, e)] = H %*% Q
    }
  }
}

# plot the first three eigenvectors
plot(-B[, 1], type = "l", lwd = 5, 
     ylim = c(-0.8, 0.8), xlab = "moneyness", ylab = "loading", 
     main = "PCP for CPCA, 3 eigenvectors")
lines(B[, 2], type = "l", lwd = 3)
lines(B[, 3], type = "l", lwd = 1)

# test statistic
test   = 0
n      = c(nrow(data1), nrow(data2), nrow(data3)) # number of observations per group
lambda = array(NA, c(P, P, K))# 3D array to store the diagonal matrices of eigenvalues
Sig    = array(NA, c(P, P, K))# 3D array to store the estimated covariance matrices

for(k in 1:K){
  lambda[, , k] = diag(diag(t(B) %*% C[[k]] %*% B))
  Sig[, , k]    = B %*% lambda[, , k] %*% t(B)
  test          = test + (n[k]-1) * det(Sig[, , k])/det(C[[k]])
}

# p-value
df   = 1/2 * (K - 1) * P * (P - 1)
pval = 1 - pchisq(test, df)


