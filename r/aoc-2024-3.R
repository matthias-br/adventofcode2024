## AOC 2024 - Day 3

## Part 1----

# get data (linewise)
d <- readLines("advent of code 2024/data/aoc-2024-3.txt")

# combine lines into one single string
d <- paste(d, collapse = "")

# regex pattern
pattern <- "mul\\(\\d{1,3}\\,\\d{1,3}\\)"

# get regex matches
matches <- regmatches(d, gregexpr(pattern, d))

# clean up matches
blergh <- lapply(matches, function(i) gsub("mul\\((\\d{1,3},\\d{1,3})\\)", "\\1", i))
blergh <- lapply(blergh, function(i) strsplit(i, "\\,"))

# cleaned up matches as df
bleh <- t(as.data.frame(blergh))
bleh <- data.frame(col1 = as.numeric(bleh[,1]),
                   col2 = as.numeric(bleh[,2]))
head(bleh)

# solution
bleh$product <- bleh$col1 * bleh$col2
sum(bleh$product)
