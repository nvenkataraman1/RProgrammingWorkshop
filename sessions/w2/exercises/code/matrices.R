rates <- read.csv("../data/rates.csv", header=TRUE, row.names=1)
rates

dim(rates)

typeof(rates)

class(rates)

---
    
rate_matrix <- as.matrix(rates)

typeof(rate_matrix)

class(rate_matrix)

dim(rate_matrix)

colnames(rate_matrix)
rownames(rate_matrix)

---

rate_matrix
    
rate_matrix["BTC","EUR"]

---

## Return value and Type coercion

class(rate_matrix[,1])

class(t(rate_matrix[,1]))

---

## Convert 100 BTC to EUR, JPY, USD
    
100 * rate_matrix[1,2:4]
