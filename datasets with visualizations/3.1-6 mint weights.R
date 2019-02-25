# Creation of mint weight data and data frame

weights <- c(21.8, 21.0, 21.6, 21.7, 21.7, 21.6, 21.2, 21.4, 20.7,
             21.7, 21.6, 21.3, 21.4, 21.5, 21.6, 21.8, 21.4, 21.1,
             21.7, 21.6, 21.9, 20.9, 21.5, 21.5, 21.7, 21.9, 20.8,
             21.6, 21.6, 21.9, 22.0, 21.1, 21.5, 21.7, 21.8, 20.6,
             21.3, 21.5, 21.6, 21.3, 21.3, 21.2, 21.6, 21.7, 20.6,
             21.6, 21.4, 21.0, 21.2, 21.3, 21.5, 20.5, 21.4, 22.0,
             21.5, 21.8, 20.7, 21.0, 21.2, 21.4, 21.8, 21.3, 22.0,
             21.3, 21.7, 21.8, 21.0, 21.0, 21.4, 21.7, 20.9, 21.7,
             21.2, 21.6, 21.7, 21.9, 20.8, 21.3, 21.5, 21.9, 21.6)

mint_frame <- data.frame(weight = weights)

# Summary statistics of mint weight data

mint_frame %>% summarise(range = range(weight)[2] - range(weight)[1],
                           IQR = IQR(weight),
                           mean = mean(weight),
                           median = median(weight), 
                           variance = var(weight))

# Frequency histogram of mint weight data
mint_frame %>% ggplot(aes(weight)) + geom_histogram(binwidth = 0.1, color = 'black', fill = 'blue') + ds_theme_set() + scale_y_continuous(breaks = seq(0, 13, 1)) + scale_x_continuous(breaks = seq(min(mint_frame$weight), max(mint_frame$weight), 0.1)) + theme(axis.text.x = element_text(angle = 45, hjust = 1)) + labs(x = 'Weight (g)', y = 'Frequency')

# Box plot of mint weight data
mint_frame %>% ggplot(aes(y = weight)) + geom_boxplot(fill = 'Green') + ds_theme_set() + theme(axis.title.x = element_blank(), axis.text.x = element_blank(), axis.ticks.x = element_blank()) + labs(y = 'Weight (g)') + scale_y_continuous(breaks = seq(min(mint_frame$weight), max(mint_frame$weight), 0.1))

