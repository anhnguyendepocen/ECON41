heads <- function(B){
  library(plyr)
  library(ggplot2)
  heads <- function(B){
    coin <- rep(c('heads', 'tails'), times = c(1, 1))
    data <- replicate(B, sample(coin, 1, replace = TRUE))
    data_frame <- data.frame(data)
    data_frame$n <- seq(1, length(data_frame$data))
    data_frame$prop <- sum(data_frame$data == 'heads') / length(data_frame$data)
  }
  list <- lapply(seq(1, B), heads)
  df <- ldply(list, data.frame)
  df$prop <- df$X..i..
  df$df$X..i.. <- NULL
  df$n <- seq(1, length(df$prop))
  print(ggplot(df, aes(x = n, y = prop)) + geom_line(color = 'blue') + geom_hline(yintercept = 0.5, linetype = 'dashed') + theme_classic() + labs(x = 'Number of flips', y = 'Proportion of flips that are heads', title = 'What proportion of flips of a fair coin are heads?')) + xlim(1, B) + ylim(0, 1)
}