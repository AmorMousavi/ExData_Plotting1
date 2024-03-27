## Assuming each numeric column takes 8 bytes, 
## and each character column takes 4 bytes per character
## Date and Time are considered as character strings initially
## We will later convert them to Date and Time classes

## Number of rows
num_rows <- 2075259

## Number of columns
num_cols_char <- 2
num_cols_numer <- 7

## Memory estimation for character columns (Date, Time)
memory_char <- num_rows * num_cols_char * 4 * 10  ## Assuming maximum
## length of 10 characters
## per string

## Memory estimation for numeric columns
memory_numeric <- num_rows * num_cols_numer * 8 

## Total memory estimation
total_memory <- (memory_char + memory_numeric) / (1024^3)  ## Convert bytes 
total_memory      