# Creation of calcium carbonate data and dataframe
carbonate <- c(130.8, 132.7, 134.8, 128.8,
               129.9, 131.5, 131.7, 132.7,
               131.5, 127.8, 133.9, 132.8,
               131.2, 133.7, 129.8, 131.4,
               129.5, 132.2, 131.4, 131.3)

carbon_frame <- data.frame(concentration = carbonate)

# Summary statistics of calcium carbonate data
carbon_frame %>% summarise(range = range(concentration)[2] - range(concentration)[1],
                           IQR = IQR(concentration),
                           mean = mean(concentration),
                           median = median(concentration), 
                           variance = var(concentration))

# Frequency histogram of calcium carbonate data
carbon_frame %>% ggplot(aes(concentration)) + geom_histogram(color = 'black', fill = 'blue') + ds_theme_set()

# Box plot of calcium carbonate data
carbon_frame %>% ggplot(aes(y = concentration)) + geom_boxplot(fill = 'green') + ds_theme_set() + theme(axis.title.x = element_blank(), axis.text.x = element_blank(), axis.ticks.x = element_blank()) + labs(y = 'Concentration (mg/L)') + scale_y_continuous(breaks = seq(127, 135, 1))
