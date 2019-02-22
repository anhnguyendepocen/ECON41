# Returns all possible combinations of heads and tails for flipping a coin N number of times
# Creates a matrix, not a data frame
# Not very useful if N > 4--too many possible combinations

coin_flips <- function(N){
  coin <- c('h', 't')
  flips <- lapply(numeric(N), function(x) coin)
  as.matrix(expand.grid(flips))
}

# Returns the count of possible combinations of heads and tails for flipping a coin N number of times
# Useful for dealing with relatively large numbers of flips (N > 4)
# Don't use N > 20 because it will overload R

flip_count <- function(N){
  coin <- c('h', 't')
  flips <- lapply(numeric(N), function(x) coin)
  length(as.matrix(expand.grid(flips))[,1])
}