# Candy bar weight data
weights <- c(20.5, 22.6, 23.6, 24.9,
             20.7, 22.6, 23.6, 24.9,
             20.8, 22.7, 23.6, 25.1,
             21.0, 22.7, 23.9, 25.1,
             21.0, 22.9, 24.1, 25.2,
             21.4, 22.9, 24.3, 25.6,
             21.5, 23.1, 24.5, 25.8,
             22.0, 23.3, 24.5, 25.9,
             22.1, 23.4, 24.8, 26.1,
             22.5, 23.5, 24.8, 26.7)

candy <- data.frame(weights = weights)

# Frequency histogram
freq_hist <- candy %>% ggplot(aes(weights)) + geom_histogram(color = 'black', 
                                                fill = 'blue', 
                                                binwidth = 0.8) + scale_x_continuous(breaks = seq(20, 30, 0.8)) + scale_y_continuous(breaks = 0:9) + labs(x = 'Weights', y = 'Count') + theme_classic()

# Relative frequency/density histogram
dens_hist <- candy %>% ggplot(aes(weights)) + geom_histogram(aes(y = stat(count / sum(count))), 
                   color = 'black', 
                   fill = 'red', 
                   binwidth = 0.8) + scale_x_continuous(breaks = seq(20, 30, 0.8)) + labs(x = 'Weights', y = 'Proportion') + theme_classic()

# Histograms side by side
hist_pair <- ggarrange(freq_hist + theme(axis.text.x = element_text(angle = 90)), dens_hist + theme(axis.text.x = element_text(angle = 90)))

