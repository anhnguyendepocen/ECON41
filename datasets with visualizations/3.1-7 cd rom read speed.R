# Creation of CD ROM read speed data
read_rates <- c(21.21, 30.60, 15.60,
                14.50, 6.12, 29.38,
                25.10, 19.94, 25.45,
                22.90, 19.61, 30.41,
                30.80, 21.51, 30.11,
                30.62, 28.80, 30.51,
                27.88, 21.72, 28.17,
                20.65, 21.95, 21.42,
                30.90, 18.89)

cd_speeds <- data.frame(speed = read_rates)

# Summary statistics for CD ROM read speed data
cd_speeds %>% summarise(range = range(speed)[2] - range(speed)[1],
                           IQR = IQR(speed),
                           mean = mean(speed),
                           median = median(speed), 
                           variance = var(speed))

# Frequency histogram of CD ROM read speed data
cd_speeds %>% ggplot(aes(speed)) + geom_histogram(fill = 'blue', color = 'black', bins= 10) + ds_theme_set() + scale_y_continuous(breaks = seq(0, 10, 1)) + scale_x_continuous(breaks = seq(0, 31, 5)) + labs(x = 'Read speed (kb/s)', y = 'Frequency')

# Box plot of CD ROM read speed data
cd_speeds %>% ggplot(aes(y = speed)) + geom_boxplot(fill = 'green') + ds_theme_set() + theme(axis.title.x = element_blank(), axis.text.x = element_blank(), axis.ticks.x = element_blank()) + labs(y = 'Read speed (kb/s)') + scale_y_continuous(breaks = seq(0, 30, 5), limits = c(0, 30))
