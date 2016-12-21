# clear all variables
rm(list = ls(all = TRUE))
graphics.off()

# load data
ibm   = read.csv("ibm.csv")
apple = read.csv("apple.csv")
bac   = read.csv("bac.csv")
ford  = read.csv("ford.csv")
ed    = read.csv("ed.csv")
ms    = read.csv("ms.csv")

# sort data by date
ibm$Date   = as.Date(ibm$Date, "%Y-%m-%d") # this variable is the same in all data sets
OrderIndex = order(ibm$Date)
ibm        = ibm[OrderIndex, ]
apple      = apple[OrderIndex, ]
bac        = bac[OrderIndex, ]
ford       = ford[OrderIndex, ]
ed         = ed[OrderIndex, ]

end = nrow(ibm)  # number of ibservations

# compute returns for IBM
y1 = ibm[, 5]
x1 = diff(y1)/y1[2:end]

# compute returns for Apple
y2 = apple[, 5]
x2 = diff(y2)/y2[2:end]

# compute returns for Bank of America Corporation
y3 = bac[, 5]
x3 = diff(y3)/y3[2:end]

# compute returns for Forward Industries
y4 = ford[, 5]
x4 = diff(y4)/y4[2:end]

# compute returns for Consolidated Edison
y5 = ed[, 5]
x5 = diff(y5)/y5[2:end]

# compute returns for Morgan Stanley
y6 = ms[, 5]
x6 = diff(y6)/y6[2:end]

Date  = ibm$Date[2:end]
NAMES = c("IBM", "Apple", "BAC", "Forward Industries",
           "Consolidated Edison", "Morgan Stanley")
xx    = cbind(x1, x2, x3, x4, x5, x6)

# plot
par(mfrow = c(3, 2))
for (i in 1:6){
  plot(Date, xx[, i], type = "l", col = "blue", ylim = c(-1.5, 1.5), 
       ylab = "", xlab = "", main = NAMES[i], 
       cex.lab = 1.4, cex.axis = 1.4, cex.main = 1.4)
}
