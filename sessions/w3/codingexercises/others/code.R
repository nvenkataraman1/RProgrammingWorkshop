## Reading data

dj <- read.csv("./data//dow_jones_index/dow_jones_index.data")

head(dj)

typeof(dj)
class(dj)

---
    
    
state.abb
state.area
state.center
state.division
state.name
state.region
state.x77


aggregate(state.x77,list(region=state.region),mean)

aggregate(state.x77,list(region=state.abb),mean)

state.abb[grep("A+",state.abb)]

matrix(JohnsonJohnson, ncol=4) %*% diag(4)

euro
euro.cross

class(sleep[[2]])



df <- data.frame(normal=rnorm(1000), gaussian=rnorm(1000,mean=10),
                 unif=runif(1000), binom=rbinom(1000, size=1, prob=0.5))
df_melt <- reshape2::melt(df)
library(ggplot2)
ggplot(df_melt, aes(x = value)) + geom_density(stat="density") + 
    facet_grid(variable ~ .)
