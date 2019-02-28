# Generates relative frequency histograms of randomly generated data that is normally distributed
# n is the number of random numbers to generate
# bins is the number of bars in the histogram to be drawn
# mean is the mean of the data to be generated
# sd is the standard deviation of the data to be generated
normal <- function(n, bins, mean, sd){
  library(tidyverse)
  library(dslabs)
  dat <- data.frame(x = rnorm(n, mean = mean, sd = sd))
  dat %>% ggplot(aes(x)) + geom_histogram(aes(y = stat(count / sum(count))), bins = bins, color = 'black', fill = 'blue') + geom_vline(xintercept = mean, color = 'red', linetype = 'dashed', size = 1) + scale_x_continuous(breaks = seq(-3 * sd, 3 * sd, sd)) + labs(x = '', y = 'Relative frequency') + ds_theme_set()
}