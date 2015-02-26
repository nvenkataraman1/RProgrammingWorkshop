---
title: "Session 4: Functions, Control Structures, Scoping, apply Family"
author: "Naveen Venkataraman"
date: "February 15, 2015"
output: html_document
---

# Topics Covered Today

+ Functions
+ Control Structures
+ Lexical Scoping
    + Variable
    + Function
+ ```apply``` family of functions
    + apply
    + lapply
    + tapply
    + sapply

## Writing Functions

#### Q1: Functions with Arguments

Write a function to pass the radius and calculate circular area
+ Note:
    + Area of circle = pi * r * r
    + ```pi``` is a default variable in R


#### Q2: Passing Multiple Arguments

Using the ```euro.cross``` dataset, do the following:


a. Create a function to take in 2 currencies and print exchange rate
b. What happens when you reverse the order of function arguments?
c. What happens when you pass named arguments to the function?

---

## Control Statements: Using ```for``` loops, ```while``` loops, ```ifelse```

#### Q3: Create a numeric vector of length 10. Pass it into a function to calculate and print the cumulative sum at each iteration.


#### Q4: Set variable i = 1. While i is less than 10, print the value of i.

__Very important__: When using loops, you need to iterate (increase the value of) the looping variable (in this case, i) . Failure to do so leads to what is called an ```INFINITE``` loop, which will break your programming flow.

#### Q5: Write a function to take an input of 10 random numbers. If a number is below 0.5, set it to 0, else to 1.

---

## Group Manipulation: ```apply``` family

#### Q6: Generate a 6x5 matrix using rnorm


a. Calculate row means using ```apply``` / ```rowMeans```

b. Calculate column means using ```apply``` / ```colMeans```

c. Calculate ```rowSums``` and ```colSums```

#### Q7: Use ```mtcars``` dataset


a. Return a list of column variances

b. Return a vector of column variances

#### Q8: Create this dataset and return maximum batting average by team


```r
baseball.data <- data.frame(
                            team = gl(5, 5,
                            labels = paste("Team", LETTERS[1:5])),
                            player = sample(letters, 25),
                            batting.average = runif(25, .200, .400))
```

---

## Variable Scoping

#### Analyze this code and predict the output


```r
f <- function() {
  x <- 1
  y <- 2
  c(x, y)
}
f()
rm(f)
```


```r
x <- 2
g <- function() {
  y <- 1
  c(x, y)
}
g()
rm(x, g)
```


```r
x <- 1
h <- function() {
  y <- 2
  i <- function() {
    z <- 3
    c(x, y, z)
  }
  i()
}
h()
rm(x, h)
```


```r
j <- function(x) {
  y <- 2
  function() {
    c(x, y)
  }
}
k <- j(1)
k()
rm(j, k)
```

## Function Scoping

#### Analyze this code and predict the output


```r
l <- function(x) x + 1
m <- function() {
  l <- function(x) x * 2
  l(10)
}
m()
rm(l, m)
```


```r
n <- function(x) x / 2
o <- function() {
  n <- 10
  n(n)
}
o()
#> [1] 5
rm(n, o)
```

---

## Advanced Practice

#### Write a program to take an input and print out a Fibonacci Sequence.
