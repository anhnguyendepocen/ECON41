# Compares theoretical and experimental probabilities
# for a certain PMF
pmf_generator <- function(){
  library(tidyverse)
  library(dslabs)
  df <- data.frame(x = 1:4, prob = c(0.1, 0.2, 0.3, 0.4))
  data <- replicate(1000, sample(df$x, 1, replace = TRUE, prob = df$prob))
  df$rfreq <- as.numeric(prop.table(table(data)))
  df %>% ggplot(aes(x)) +
    geom_bar(aes(y = rfreq), stat = 'identity', color = 'black', fill = 'red') +
    geom_bar(aes(y = prob), stat = 'identity', color = 'black', fill = 'blue') +
    geom_text(aes(y = rfreq, label = rfreq, vjust = -3)) +
    geom_text(aes(y = prob, label = prob, vjust = 5), color = 'white') +
    labs(y = 'Probability, relative frequency', 
         title = '1,000 repetitions of 1 trial') +
    scale_y_continuous(limits = c(0, 0.5)) +
    ds_theme_set()
}