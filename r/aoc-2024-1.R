# AOC 2024 - Day 1

## puzzle 1 ----

# get data
d <- read.table("advent of code 2024/data/aoc-2024-1.txt")

head(d)

# sort ascending for comparison
id1 <- sort(d$V1)
id2 <- sort(d$V2)

d <- data.frame(id1 = id1, 
                id2 = id2)

# differences
d$diff <- abs(id1 - id2)

# total difference
total_diff <- sum(d$diff)
total_diff

## puzzle 2----

# for each element in id1, return length (number) of indices of id2 of equal value.
# multiply by id1 value.
sim <- sapply(1:length(d$id1), 
              function(i) length(which(d$id1[i] == d$id2)) * d$id1[i])

# similarity score
sim_score <- sum(sim)
sim_score



     