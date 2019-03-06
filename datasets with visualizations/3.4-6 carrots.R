# Creation of carrot data vector
carrots <- c(1.12, 1.13, 1.19,
             1.25, 1.06, 1.31,
             1.12, 1.23, 1.29,
             1.17, 1.20, 1.11)

# Creation of carrot data frame
carrot_frame <- data.frame(weight = carrots)

# QQ plot of standardized carrot data
as.data.frame(scale(carrots)) %>% ggplot(aes(sample = V1)) + geom_hline(yintercept = 0, size = 1, color = 'red', linetype = 'dashed') + stat_qq(alpha = 0.5, color = 'blue') + stat_qq_line()  + ds_theme_set()
