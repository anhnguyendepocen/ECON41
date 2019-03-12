# Chi squared plot generator
chisq_plot <- function(a, b){
  dat <- data.frame(x = seq(a, b, 0.01), 
             prob1 = dchisq(seq(a, b, 0.01), 1), 
             prob2 = dchisq(seq(a, b, 0.01), 2), 
             prob4 = dchisq(seq(a, b, 0.01), 4), 
             prob6 = dchisq(seq(a, b, 0.01), 6), 
             prob10 = dchisq(seq(a, b, 0.01), 10), 
             prob20 = dchisq(seq(a, b, 0.01), 20)) 
  dat %>% ggplot(aes(x)) + geom_line(aes(y = prob1), size = 1) + 
    geom_line(aes(y = prob2), size = 1, color = 'blue') + 
    geom_line(aes(y = prob4), size = 1, color = 'green') + 
    geom_line(aes(y = prob6), size = 1, color = 'purple') + 
    geom_line(aes(y = prob10), size = 1, color = 'red') + 
    geom_line(aes(y = prob20), color = 'brown', size = 1) + 
    scale_y_continuous(limits = c(0, 0.6))  + 
    annotate('text', x = 2.3, y = 0.5, label = 'r[1]', size = 8, color = 'black', parse = TRUE) + 
    annotate('text', x = 3, y = 0.3, label = 'r[2]', size = 8, color = 'blue', parse = TRUE) + 
    annotate('text', x = 4.2, y = 0.19, label = 'r[4]', size = 8, color = 'green', parse = TRUE) + 
    annotate('text', x = 5, y = 0.15, label = 'r[6]', size = 8, color = 'purple', parse = TRUE) + 
    annotate('text', x = 10, y = 0.11, label = 'r[10]', size = 8, color = 'red', parse = TRUE) + 
    annotate('text', x = 20, y = 0.09, label = 'r[20]', size = 8, color = 'brown', parse = TRUE) + 
    theme(axis.title.y = element_blank()) + 
    labs(y = 'Probability', title = 'Chi squared distribution \n with various degrees of freedom (r)') + 
    ds_theme_set()
}
chisq_plot(0, 50)

# T distribution example plot
# Blue curve is normal distribution
data.frame(x = seq(-3, 3, 0.01), 
           nprob = dnorm(seq(-3, 3, 0.01), 0, 1), 
           tprob1 = dt(seq(-3, 3, 0.01), 1), 
           tprob2 = dt(seq(-3, 3, 0.01), 2), 
           tprob4 = dt(seq(-3, 3, 0.01), 4), 
           tprob8 = dt(seq(-3, 3, 0.01), 8)) %>% ggplot(aes(x)) + 
  geom_line(aes(y = nprob), color = 'blue', size = 1) + 
  geom_line(aes(y = tprob1), color = 'red', size = 1) + 
  geom_line(aes(y = tprob2), color = 'green', size = 1, linetype = 'dashed') + 
  geom_line(aes(y = tprob4), color = 'purple', size = 1, linetype = 'dashed') + 
  geom_line(aes(y = tprob8), color = 'brown', size = 1, linetype = 'dashed') + 
  scale_x_continuous(breaks = seq(-3, 3, 1)) + labs(y = 'Probability')

# T distribution critical value example plot (one tailed)
data.frame(x = seq(-3, 3, 0.01), 
           tprob = dt(seq(-3, 3, 0.01), 16)) %>% ggplot(aes(x)) + 
  geom_line(aes(y = tprob), size = 1, color = 'blue') + 
  stat_function(fun = dt, xlim = c(-3, 1.746), geom = 'area', 
                fill = 'blue', alpha = 0.3, args = list(df = 16)) + 
  stat_function(fun = dt, xlim = c(1.746, 3), geom = 'area', 
                fill = 'red', alpha = 0.3, args = list(df = 16)) + 
  annotate('text', x = 0, y = 0.2, size = 8, label = '0.95', 
           color = 'blue') + 
  annotate('text', x = 0, y = 0.15, size = 8,
           label = 't[16,0.90]^0.90 == 1.746', color = 'blue', parse = TRUE) + 
  annotate('text', x = 2.05, y = 0.02, size = 5, 
           label = '0.05', color = 'red') + 
  scale_x_continuous(breaks = c(-3, -1.746, -1, 0, 1, 1.746, 3)) + 
  labs(y = 'Probability')

# Two tailed
data.frame(x = seq(-3, 3, 0.01), 
           tprob = dt(seq(-3, 3, 0.01), 16)) %>% ggplot(aes(x)) + 
  geom_line(aes(y = tprob), size = 1, color = 'blue') + 
  stat_function(fun = dt, xlim = c(-1.746, 1.746), 
                geom = 'area', fill = 'blue', 
                alpha = 0.3, args = list(df = 16)) + 
  stat_function(fun = dt, xlim = c(-3, -1.746),
                geom = 'area', fill = 'red', alpha = 0.3, 
                args = list(df = 16)) + 
  stat_function(fun = dt, xlim = c(1.746, 3), geom = 'area', 
                fill = 'red', alpha = 0.3, args = list(df = 16)) + 
  annotate('text', x = 0, y = 0.2, size = 8, label = '0.95', color = 'blue') + 
  annotate('text', x = 0, y = 0.15, size = 8,
           label = 't[16,0.90]^0.90 == 1.746', color = 'blue', parse = TRUE) + 
  annotate('text', x = -2.05, y = 0.02, size = 5, label = '0.05', color = 'red') + 
  annotate('text', x = 2.05, y = 0.02, size = 5, label = '0.05', color = 'red') + 
  scale_x_continuous(breaks = c(-3, -1.746, -1, 0, 1, 1.746, 3)) + 
  labs(y = 'Probability')
