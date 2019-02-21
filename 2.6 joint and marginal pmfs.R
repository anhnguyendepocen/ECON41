jpmf <- function(x1, x2){
       (x1 + x2) / 21
   }
mpmf1 <- function(x1){
       (2 * x1 + 3) / 21
   }
mpmf2 <- function(x2){
       (3 * x2 + 6) / 21
   }
cond1 <- function(x1, x2){
       jpmf(x1, x2) / mpmf2(x2)
   }
cond2 <- function(x2, x1){
       jpmf(x1, x2) / mpmf1(x1)
   }