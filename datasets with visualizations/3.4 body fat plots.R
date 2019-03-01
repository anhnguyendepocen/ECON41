# QQ plot of standardized body fat data
as.data.frame(scale(BodyFat)) %>% ggplot(aes(sample = BODYFAT)) + geom_hline(yintercept = 0, size = 1, color = 'red', linetype = 'dashed') + stat_qq(alpha = 0.5, color = 'blue') + stat_qq_line()  + ds_theme_set()

# Relative frequency histogram of standardized body fat data with normal distribution curve
as.data.frame(scale(BodyFat)) %>% ggplot(aes(BODYFAT)) + geom_histogram(aes(y = stat(count / sum(count))), color = 'black', fill = 'red', bins = 7) + stat_function(fun = dnorm, args = list(mean = 0, sd = 1), size = 1, color = 'blue') + labs(y = 'Proportion', x = 'Number of standard deviations from mean') + scale_x_continuous(limits = c(-3, 3))