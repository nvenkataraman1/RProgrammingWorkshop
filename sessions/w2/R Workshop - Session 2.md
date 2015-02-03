---
title: "R Workshop - Session 2"
author: "Naveen Venkataraman"
date: "February 2, 2015"
output: html_document
---

# Overview of today's session

1. Atomic Vectors
2. Matrices and Arrays
3. Data frames
4. Factors
5. Lists

References for today's session:

1. Advanced R by Hadley Wickham
2. The Art of R Programming by Norman Matloff

---

## Housekeeping

1. No static typing
    + No declarations necessary
    + Variable type can change
2. Variable names can contain any combination of alphanumeric characters along with periods (.) and underscores (_). However, they cannot start with a number or an underscore
3. In R, index values start from 1

---

# Data Types in R

R's data types can be organized based on:

1. Dimensionality
2. Homogenous (all contents are same)
3. Heterogenous (contents can be different)

|Dimension|Homogenous |Heterogenous|
|----------:|----------:|----------:|
|1d| Atomic Vector|List|
|2d| Matrix| Data Frame|
|nd| Array||

---

## Vectors

Simplest data type in R. Variable types are called ```modes```.

Note: R does not have a ```scalar``` data type. Scalars in R are vectors of length = 1.

Modes include:

1. numeric
    + integer (whole numbers, no decimals)
    + double (floating-point)
2. character (string)
3. logical

### Numeric: double


```r
num_vec <- c(1,3,5)
num_vec
```

```
## [1] 1 3 5
```

```r
typeof(num_vec)
```

```
## [1] "double"
```

```r
is.numeric(num_vec)
```

```
## [1] TRUE
```

```r
is.double(num_vec)
```

```
## [1] TRUE
```

```r
(mode(num_vec) == "numeric")
```

```
## [1] TRUE
```

### Numeric: integer


```r
int_vec <- c(5L)

typeof(int_vec)
```

```
## [1] "integer"
```

```r
is.numeric(int_vec)
```

```
## [1] TRUE
```

```r
is.integer(int_vec)
```

```
## [1] TRUE
```

```r
is.double(int_vec)
```

```
## [1] FALSE
```

### Type coercion


```r
int_vec <- c(int_vec, 6)

is.numeric(int_vec)
```

```
## [1] TRUE
```

```r
is.integer(int_vec)
```

```
## [1] FALSE
```

```r
is.double(int_vec)
```

```
## [1] TRUE
```

### Typecasting


```r
another_int_vec <- as.integer(3,19)

is.numeric(another_int_vec)
```

```
## [1] TRUE
```

```r
is.integer(another_int_vec)
```

```
## [1] TRUE
```

```r
is.double(another_int_vec)
```

```
## [1] FALSE
```

### Indexing

Individual elements are accessed via __```[ ]```__ by using an __```index```__ or __```subscript```__


```r
num_vec[1]
```

```
## [1] 1
```

```r
num_vec[2]
```

```
## [1] 3
```

```r
num_vec[4]
```

```
## [1] NA
```

```r
num_vec[0]
```

```
## numeric(0)
```

### Common Operations

#### Adding and Removing elements


```r
num_vec[4] <- 7 ## You can only do this if you know the dimensions and if you know the last used index
num_vec
```

```
## [1] 1 3 5 7
```

```r
num_vec <- c(num_vec,9)
num_vec
```

```
## [1] 1 3 5 7 9
```

```r
num_vec <- num_vec[-1]
num_vec
```

```
## [1] 3 5 7 9
```

#### Math operations on vectors

Includes:

+ addition: +
+ subtraction: -
+ multiplication: *
+ division: /
+ modulo: %%


```r
vec_1 <- seq(1:3)

length(vec_1)
```

```
## [1] 3
```

```r
#vec_2 <- seq(1:20, by=2)

vec_2 <- seq(1, 20, by=2)

length(vec_2)
```

```
## [1] 10
```

```r
## Recycling

vec_2
```

```
##  [1]  1  3  5  7  9 11 13 15 17 19
```

```r
vec_1
```

```
## [1] 1 2 3
```

```r
vec_2 + vec_1
```

```
## Warning in vec_2 + vec_1: longer object length is not a multiple of
## shorter object length
```

```
##  [1]  2  5  8  8 11 14 14 17 20 20
```

```r
vec_3 <- seq(1, 20, by=3)

vec_3 + vec_1
```

```
## Warning in vec_3 + vec_1: longer object length is not a multiple of
## shorter object length
```

```
## [1]  2  6 10 11 15 19 20
```

```r
## Seq in loop operations

x <- rnorm(5)

for(i in seq(x)) {
    print(x[i])
}
```

```
## [1] 1.866745
## [1] 0.1307347
## [1] 0.7678465
## [1] 0.4219078
## [1] 0.655168
```

```r
1:10 %% 2
```

```
##  [1] 1 0 1 0 1 0 1 0 1 0
```

#### Using rep


```r
vec <- rep(1, 5)
vec
```

```
## [1] 1 1 1 1 1
```

```r
rep(c(5,12,13),3)
```

```
## [1]  5 12 13  5 12 13  5 12 13
```

```r
rep(c(5,12,13),each=2)
```

```
## [1]  5  5 12 12 13 13
```


## Dates


```r
seq(as.Date("2011-12-30"), as.Date("2012-01-04"), by="days")
```

```
## [1] "2011-12-30" "2011-12-31" "2012-01-01" "2012-01-02" "2012-01-03"
## [6] "2012-01-04"
```
