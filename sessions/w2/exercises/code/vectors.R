library(caret)

data(GermanCredit)

head(GermanCredit)

gc <- GermanCredit

typeof(gc)

class(gc)

dim(gc)

a <- gc[,c(1)]

