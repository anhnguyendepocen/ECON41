# Plot of critical value selection for 95% CI with df = 12
# For estimating population standard deviation

qchisq(c(0.025, 0.975), 12)

data.frame(x = seq(0, 50, 0.01), 
           chiprob = dchisq(seq(0, 50, 0.01), 12)) %>% ggplot(aes(x)) + 
  geom_line(aes(y = chiprob), size = 1, color = 'blue') + 
  stat_function(fun = dchisq, xlim = c(4.403, 23.337), geom = 'area', 
                fill = 'blue', alpha = 0.3, args = list(df = 12)) + 
  stat_function(fun = dchisq, xlim = c(0, 4.403), geom = 'area', 
                fill = 'red', alpha = 0.3, args = list(df = 12)) + 
  stat_function(fun = dchisq, xlim = c(23.337, 50), geom = 'area', 
                fill = 'red', alpha = 0.3, args = list(df = 12)) +
  annotate('text', x = 10.4, y = 0.06, size = 8, label = '0.95', 
           color = 'blue') +
  annotate('text', x = 30, y = 0.05, size = 8,
           label = 'X[0.975]^12 == 23.337', parse = TRUE, color = 'blue') +
  annotate('text', x = 30, y = 0.035, size = 8,
           label = 'X[0.025]^12 == 4.403', parse = TRUE, color = 'blue') +
  scale_x_continuous(breaks = c(0, 4.403, 10, 23.337, 30, 41.92, 50)) + 
  labs(y = 'Probability') + ds_theme_set()

