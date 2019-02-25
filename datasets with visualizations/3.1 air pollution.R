# Air pollution data
LA <- c(55.9, 56.3, 56.8, 57.2, 61.2, 61.9, 62.5, 63.8, 64.4, 68.2)
NY <- c(55.7, 55.8, 57.0, 57.4, 59.0, 59.5, 59.9, 60.4, 64.2, 67.7)
KC <- c(53.0, 54.6, 54.7, 54.8, 57.6, 58.6, 62.4, 63.5, 65.5, 66.6)
DC <- c(57.3, 58.1, 58.6, 58.7, 59.0, 61.9, 62.6, 64.4, 64.9, 66.7)
SF <- c(50.5, 54.4, 54.8, 56.3, 58.3, 59.0, 61.2, 61.6, 62.2, 63.1)

# Air pollution data frame
cities <- c(rep('LA', 10), 
            rep('NY', 10), 
            rep('KC', 10), 
            rep('DC', 10), 
            rep('SF', 10))
air_pollution <- data.frame(cities = cities, 
                            pollution_index = c(LA, NY, KC, DC, SF))

# Box plot of air pollution data
air_pollution %>% ggplot(aes(cities, pollution_index)) + geom_boxplot(aes(fill = cities)) + scale_y_continuous(limits = c(0, 70)) + scale_x_discrete(labels = c('Washington, D.C.', 'Kansas City', 'Los Angeles', 'New York City', 'San Francisco')) + theme(axis.title.x = element_blank(), legend.position = 'none') + labs(y = 'Air pollution index')
