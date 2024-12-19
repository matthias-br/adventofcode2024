## AOC 2024 - Day 2

## Part 1----

# get data
x <- readLines("advent of code 2024/data/aoc-2024-2.txt") 

# convert from chr to numeric vector 
# (split along separator, unlist to vector, convert to numeric)
x <- lapply(x, function(i) as.numeric(unlist(strsplit(i, split = " "))))

# for each vector in x, return TRUE if: 
# (values ordered descending OR values ordered ascending)
# AND (ascending by 1, 2, 3 OR descending by 1, 2, 3)
result <- sapply(1:length(x),
                 function(i) all(
                   ( all(x[[i]] == cummin(x[[i]])) | all(x[[i]] == cummax(x[[i]])) ) &
                   ( all(diff(x[[i]]) %in% c(1,2,3)) | all(diff(x[[i]]) %in% c(-1,-2,-3)) ) ))

# result
table(result)
