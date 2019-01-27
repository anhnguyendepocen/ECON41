pnbinom41 <- function(x, r, p){
  sum(choose(r:x - 1, r - 1) * (1 - p)^(r:x - r) * p^r)
}