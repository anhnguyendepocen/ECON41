# Function for calculating pooled standard deviation
s_pooled <- function(nx, ny, sx, sy){
  sqrt(((nx - 1) * sx^2 + (ny - 1) * sy^2) / (nx + ny - 2))
}