# PDF of example in Wackerly 7.3
pdf <- function(x){
  ifelse(x == 0, 0, (1 / 10) * exp(-x / 10))
}

# Plot grid for above PDF
# PDF redefined locally so no need to define it in the workspace
clt_plot <- function(n, trials){
  library(tidyverse)
  library(ggpubr)
  library(dslabs)
  pdf <- function(x){
    ifelse(x == 0, 0, (1 / 10) * exp(-x / 10))
  }
  dat <- data.frame(x = seq(0.01, 25, 2.25), prob = pdf(seq(0.01, 25, 2.25)))
  mean_data <- as.numeric(replicate(trials, mean(sample(dat$x, n, replace = TRUE, prob = dat$prob))))
  mean_frame <- data.frame(x = length(0:(length(mean_data) - 1)), samp = mean_data)
  sampling_dist <- as.data.frame(scale(mean_frame)) %>% ggplot(aes(samp, stat(count / sum(count)))) + geom_histogram(color = 'black', fill = 'blue', bins = 10) + labs(x = 'Number of standard deviations', y = 'Proportion', title = 'Sampling distribution') + geom_vline(xintercept = 0, color = 'red', linetype = 'dashed', size = 1) + ds_theme_set()  
  qq <- as.data.frame(scale(mean_frame)) %>% ggplot(aes(sample = samp)) + stat_qq(color = 'blue', alpha = 0.5) + stat_qq_line() + labs(title = 'QQ plot') + ds_theme_set()
  pdf <- dat %>% ggplot(aes(x)) + stat_function(fun = pdf, size = 1) + scale_y_continuous(limits = c(0, max(dat$prob) + 0.05)) + labs(title = 'PDF') + ds_theme_set()
  samp_dist <- dat %>% ggplot(aes(x, prob)) + geom_bar(stat = 'identity', color = 'black', fill = 'red') + labs(y = 'Probability', x = 'x', title = 'Sample distribution') + ds_theme_set()
  ggarrange(pdf, samp_dist, sampling_dist, qq, ncol = 2, nrow = 2)
}

# Plot grid for Poisson distribution
clt_plot_pois <- function(n, trials, lambda){
  library(tidyverse)
  library(ggpubr)
  library(dslabs)
  if(any(lambda < 0 | lambda >= 25 | lambda %% 1 != 0)) stop('Please choose a value for lambda which is a whole number between 0 and 25')
  if(any(n <= 0 | n >= 25 | n %% 1 != 0)) stop('Please choose a value for n that is a whole number between 1 and 24')
  dat <- data.frame(x = seq(0, 25, 1), prob = dpois(seq(0, 25, 1), lambda))
  mean_data <- as.numeric(replicate(trials, mean(sample(dat$x, n, replace = TRUE, prob = dat$prob))))
  mean_frame <- data.frame(x = length(0:(length(mean_data) - 1)), samp = mean_data)
  sampling_dist <- as.data.frame(scale(mean_frame)) %>% ggplot(aes(samp, stat(count / sum(count)))) + geom_histogram(color = 'black', fill = 'blue', bins = 10) + labs(x = 'Number of standard deviations', y = 'Proportion', title = 'Sampling distribution') + geom_vline(xintercept = 0, color = 'red', linetype = 'dashed', size = 1) + ds_theme_set()  
  qq <- as.data.frame(scale(mean_frame)) %>% ggplot(aes(sample = samp)) + stat_qq(color = 'blue', alpha = 0.5) + stat_qq_line() + labs(title = 'QQ plot') + ds_theme_set()
  pdf <- dat %>% ggplot(aes(x, prob)) + geom_line(size = 1) + geom_vline(xintercept = lambda, size = 1, linetype = 'dashed', color = 'red') + scale_y_continuous(limits = c(0, max(dat$prob) + 0.05)) + labs(title = 'PMF') + ds_theme_set()
  samp_dist <- dat %>% ggplot(aes(x, prob)) + geom_bar(stat = 'identity', color = 'black', fill = 'red') + geom_vline(xintercept = lambda, size = 1, color = 'green', linetype = 'dashed') + labs(y = 'Frequency', x = 'x', title = 'Sample distribution') + ds_theme_set()
  ggarrange(pdf, samp_dist, sampling_dist, qq, ncol = 2, nrow = 2)
}

# Plot grid for uniform distribution
clt_plot_unif <- function(n, trials){
  dat <- data.frame(x = seq(0, 10, 1), prob = dunif(n, 0, 10))
  mean_data <- as.numeric(replicate(trials, mean(sample(dat$x, n, replace = TRUE, prob = dat$prob))))
  mean_frame <- data.frame(x = length(0:(length(mean_data) - 1)), samp = mean_data)
  sampling_dist <- as.data.frame(scale(mean_frame)) %>% ggplot(aes(samp, stat(count / sum(count)))) + geom_histogram(color = 'black', fill = 'blue', bins = 10) + labs(x = 'Number of standard deviations', y = 'Proportion', title = 'Sampling distribution') + geom_vline(xintercept = 0, color = 'red', linetype = 'dashed', size = 1) + ds_theme_set()  
  qq <- as.data.frame(scale(mean_frame)) %>% ggplot(aes(sample = samp)) + stat_qq(color = 'blue', alpha = 0.5) + stat_qq_line() + labs(title = 'QQ plot') + ds_theme_set()
  pdf <- dat %>% ggplot(aes(x, prob)) + geom_line(size = 1) + scale_y_continuous(limits = c(0, max(dat$prob) + 0.05)) + labs(title = 'PDF') + ds_theme_set()
  samp_dist <- dat %>% ggplot(aes(x, prob)) + geom_bar(stat = 'identity', color = 'black', fill = 'red') + labs(y = 'Probability', x = 'x', title = 'Sample distribution') + ds_theme_set()
  ggarrange(pdf, samp_dist, sampling_dist, qq, ncol = 2, nrow = 2)
}
