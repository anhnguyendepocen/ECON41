# Generate nail data and data frame
nails <- c(9.42, 9.41, 8.29, 8.58, 9.20,
           8.69, 8.56, 8.79, 9.21, 8.24,
           8.93, 8.82, 8.51, 8.27, 8.57,
           8.27, 8.58, 8.85, 8.76, 8.85,
           8.82, 8.43, 9.34, 9.26, 8.69,
           8.66, 8.05, 9.21, 8.59, 8.85,
           8.90, 8.56, 8.38, 8.36, 9.08,
           8.31, 8.55, 8.51, 8.71, 9.40,
           9.15, 8.88, 8.41, 8.51, 9.25,
           9.63, 8.73, 8.98, 8.88, 8.79)

nail_frame <- data.frame(nail_weights = nails)

# Summary statistics for nail weights
nail_frame %>% summarize(mean = mean(nail_weights), sd = sd(nail_weights))

# Frequency histogram of nail weights 
nail_frame %>% ggplot(aes(nail_weights)) + geom_histogram(color = 'black', fill = 'blue', bins = 7) + scale_x_continuous(breaks = seq(min(nail_frame$nail_weights), max(nail_frame$nail_weights) + 0.25, 0.25)) + labs(x = 'Nail weights', y = 'Frequency')


