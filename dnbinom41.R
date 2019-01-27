dnbinom41 <- function(x, r, p){
  choose(x - 1, r - 1) * (1 - p)^(x - r) * p^r
}