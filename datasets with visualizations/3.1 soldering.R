# Generation of soldering data
level <- c(rep('Low', 10), rep('High', 10))
measurements <- c(63.4, 64.3, 64.3, 64.8, 64.8, 65.3, 65.6, 66.1, 66.7, 67.1,
                  61.2, 62.0, 63.5, 64.5, 64.6, 65.1, 66.4, 67.3, 67.5, 69.7)
soldering <- data.frame(level = level, measurements = measurements)

# Soldering data box plots
soldering %>% ggplot(aes(level, measurements)) + geom_boxplot(aes(fill = level)) + scale_y_continuous(breaks = seq(60, 70, 1)) + ds_theme_set() + theme(legend.position = 'none') + labs(y = 'Pull strength', x = 'Soldering temperature')
