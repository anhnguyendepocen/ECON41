# Statistics test scores
scores <- c(93, 75, 34, 58, 68,
            77, 97, 54, 69, 76,
            67, 84, 71, 82, 85,
            72, 73, 47, 76, 58,
            52, 81, 79, 71, 45,
            83, 42, 70, 60, 73,
            66, 61, 65, 38, 75,
            84, 51, 57, 81, 42,
            59, 91, 90, 74, 93,
            63, 87, 83, 69, 65)

# Statistics test score data frame
stats_tests <- data.frame(scores = scores)

# Frequency histogram of test scores
stats_tests %>% ggplot(aes(scores)) + geom_histogram(color = 'black', fill = 'blue', bins = 7) + scale_x_continuous(breaks = seq(min(scores), max(scores), 10), labels = c('30s', '40s', '50s', '60s', '70s', '80s', '90s')) + scale_y_continuous(breaks = seq(0, 15, 5)) + labs(x = 'Score decile', y = 'Frequency') + ds_theme_set()

# Box plot of test scores
stats_tests %>% ggplot(aes(y = scores)) + geom_boxplot() + coord_flip() + theme(axis.text.y = element_blank(), axis.ticks.y = element_blank()) + scale_y_continuous(breaks = seq(30, 90, 10)) + labs(y = 'Score decile')
