# Generation of home run distance data and data frame
home_runs <- c(382, 340, 418, 390, 393, 380,
               383, 360, 415, 340, 385, 380,
               395, 370, 432, 380, 379, 390,
               380, 374, 420, 370, 416, 390,
               416, 408, 375, 390, 420, 425,
               390, 359, 432, 434, 440, 427,
               420, 419, 373, 395, 354,
               400, 411, 350, 379, 405,
               360, 423, 410, 407, 452)

run_frame <- data.frame(runs = home_runs)

# Division of data into intervals of 10 feet
breaks <- seq(340, 460, 10)
table(cut(run_frame$runs, breaks))

# Mean and variance of home run distances
run_frame %>% summarise(mean_distance = mean(runs), variance = var(runs))

# Relative frequency histogram of home run distances
run_frame %>% ggplot(aes(runs)) + geom_histogram(aes(y = stat(count / sum(count))), color = 'black', fill = 'blue', binwidth = 10) + ds_theme_set() + scale_x_continuous(breaks = seq(340, 450, 10)) + labs(x = 'Home run hit distance (in groups of 10 feet)', y = 'Proportion of runs')

# Boxplot of home run distances
run_frame %>% ggplot(aes(y = runs)) + geom_boxplot(fill = 'green') + ds_theme_set() + theme(axis.title.x = element_blank(), axis.text.x = element_blank(), axis.ticks.x = element_blank()) + labs(y = 'Home run hit distance') + scale_y_continuous(breaks = seq(340, 470, 10))
