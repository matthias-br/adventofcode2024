# AOC 2024 - Day 1

# get data
d <- read.table("advent of code 2024/data/aoc-2024-1.txt")

head(d)

# sort ascending for somparison
id1 <- sort(d$V1)
id2 <- sort(d$V2)

d <- data.frame(id1 = id1, 
                id2 = id2)

# differences
d$diff <- abs(id1 - id2)

# total difference
total_diff <- sum(d$diff)
total_diff






     