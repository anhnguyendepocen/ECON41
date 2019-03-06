# Create window test data vector
test_dat <- c(159, 151, 135, 125, 137, 162,
              150, 146, 144, 151, 156, 160,
              147, 140, 135, 153, 139, 149,
              160, 146, 165, 158, 134, 149,
              155, 137, 118, 144, 171, 158,
              142, 148, 158, 163, 144, 152,
              143, 154, 126, 150, 160, 165,
              151, 157, 147, 150, 147, 131,
              154, 142, 123, 137, 155, 150,
              133, 153, 140, 164, 175, 120)

# Standardize window test data and turn it into a data frame
test_dat <- as.data.frame(scale(test_dat))

# Relative frequency histogram and density curve plot with standardized data
test_dat %>% ggplot(aes(.[,1])) + geom_histogram(aes(y = stat(count / sum(count))), color = 'black', fill = 'red', bins = 8) + stat_function(fun = dnorm, args = list(mean = mean(test_dat[,1]), sd = sd(test_dat[,1])), size = 1, color = 'blue') + labs(y = 'Proportion', x = 'Number of standard deviations from mean') + scale_x_continuous(limits = c(-3, 3))

# QQ plot with standardized data
test_dat %>% ggplot(aes(sample = .[,1])) + geom_hline(yintercept = 0, size = 1, color = 'red', linetype = 'dashed') + stat_qq(alpha = 0.5, color = 'blue') + stat_qq_line()  + ds_theme_set()

