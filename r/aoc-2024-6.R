## AOC 2024 - Day 6


## Part 1----

# get data
d <- readLines("advent of code 2024/data/sample.txt")

# split each line into individual characters, rbind into "2D" list of vectors
d <- do.call(rbind, strsplit(d, ""))

d <- array(d, dim = dim(d))

# determine starting point (find "^")
match("^", map)

which("^" %in% map)
map[7,5]

# initialize position and direction of guard (manual input)
guard_pos <- c(7, 5)
guard_dir <- 0 # 0 up, 1 right, 2 down, 3 left)
next_cell <- vector(mode = "numeric", length = 2) 

# write function to move guard
move_guard <- function(map, pos, dir){
  current_pos <- map[pos[1], pos[2]]
  
  # determine next cell with pos and dir
  if (dir == 0){
    next_cell <- c(pos[1] - 1, pos[2])#if facing up, subtract 1 from row index for cell above current_pos
  } else if (dir == 1){
    next_cell <- c(pos[1], pos[2] + 1)
  } else if (dir == 2){
    next_cell <- c(pos[1] + 1, pos[2])
  } else if (dir == 3){
    next_cell <- c(pos[1], pos[2] - 1)
  }
  
  # bounds
  nrows <- nrow(map)
  ncols <- ncol(map)
  
  # if next_cell is out of bounds, stop
  if(next_cell[1] < 1 || next_cell[1] > nrows || next_cell[2] < 1 || next_cell[2] > ncols){
    stop("The guard has reached the end of the map.")
  }
  
  # turn right if next_cell=="#", ensure that it goes from 3 to 0 again with %%
  if (map[next_cell[1], next_cell[2]] == "#"){
    dir <- (dir + 1) %% 4
  }
  
  # movement rules
  if (dir == 0) {
    pos <- c(pos[1] - 1, pos[2]) # if facing up, subtract 1 from row index (aka move up)
  } else if (dir == 1){
    pos <- c(pos[1], pos[2] + 1)
  } else if (dir == 2){
    pos <- c(pos[1] + 1, pos[2])
  } else if (dir == 3){
    pos <- c(pos[1], pos[2] - 1)
  }
  
  # add pos and dir to list
  result <- data.frame(pos1 = pos[1], pos2 = pos[2], dir = dir)
  return(result)
  
  #return(list(pos = pos, dir = dir))
}

# call function

for (i in 1:10){
  result[i] <- move_guard(d, guard_pos, guard_dir)
  guard_pos <- c(result$pos1[i], result$pos2[2])
  guard_dir <- result$dir[i]
}

move_guard(d, guard_pos, guard_dir)

while(TRUE){
  result2 <- try(move_guard(d, guard_pos, guard_dir))
  
  if(inherits(result, "try-error")) {break}
}

while(TRUE){
  result <- move_guard(d, guard_pos, guard_dir)
  guard_pos <- result$pos
  guard_dir <- result$dir
}
