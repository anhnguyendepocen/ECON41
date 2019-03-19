z_score <- function(xbar, mu, sd, n){
  (xbar - mu) / (sd / sqrt(n))
}

# 4.3-1. N(mu, 100)
# Null H: mu = 110, Alt H: mu > 100
# n = 16, xbar = 113.5
z_score(113.5, 110, 10, 16)
qnorm(c(0.95, 0.90))

pnorm(1.4, 0, 1, lower.tail = FALSE)

# 5% significance level hypothesis test plot
data.frame(x = seq(-3, 3, 0.01), 
           prob = dnorm(seq(-3, 3, 0.01), 0, 1)) %>% ggplot(aes(x, prob)) +
  geom_line(size = 1, color = 'blue') +
  scale_x_continuous(breaks = c(-3, -2, -1, 0, 1, 1.4, 1.645, 3)) +
  stat_function(fun = dnorm, 
                args = list(mean = 0, sd = 1), 
                geom = 'area', 
                fill = 'red',
                alpha = 0.3,
                xlim = c(1.645, 3)) +
  stat_function(fun = dnorm, 
                args = list(mean = 0, sd = 1), 
                geom = 'area', 
                fill = 'blue',
                alpha = 0.3,
                xlim = c(-3, 1.645)) +
  annotate('text', x = 0, y = 0.3, size = 8, label = '0.95', 
           color = 'blue') + 
  annotate('text', x = 2.05, y = 0.01, size = 5, 
           label = '0.05', color = 'red') +
  geom_vline(xintercept = 1.4, 
             color = 'blue', 
             size = 1, 
             linetype = 'dashed') +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title = '5% significance level')

# 10% significance level hypothesis test plot
data.frame(x = seq(-3, 3, 0.01), 
           prob = dnorm(seq(-3, 3, 0.01), 0, 1)) %>% ggplot(aes(x, prob)) +
  geom_line(size = 1, color = 'blue') +
  scale_x_continuous(breaks = c(-3, -2, -1, 0, 1, 1.282, 1.4, 3)) +
  stat_function(fun = dnorm, 
                args = list(mean = 0, sd = 1), 
                geom = 'area', 
                fill = 'red',
                alpha = 0.3,
                xlim = c(1.282, 3)) +
  stat_function(fun = dnorm, 
                args = list(mean = 0, sd = 1), 
                geom = 'area', 
                fill = 'blue',
                alpha = 0.3,
                xlim = c(-3, 1.282)) +
  annotate('text', x = 0, y = 0.3, size = 8, label = '0.90', 
           color = 'blue') + 
  annotate('text', x = 1.85, y = 0.03, size = 5, 
           label = '0.10', color = 'red') +
  geom_vline(xintercept = 1.4, 
             color = 'red', 
             size = 1, 
             linetype = 'dashed') +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  labs(title = '10% significance level')

# 4.3-2.

#a. Normal distribution for one tail test
data.frame(x = seq(-3, 3, 0.01), 
           prob = dnorm(seq(-3, 3, 0.01), 0, 1)) %>% ggplot(aes(x, prob)) +
  geom_line(size = 1, color = 'blue') +
  scale_x_continuous(breaks = c(-3, -2, -1, 0, 1, 1.645, 3)) +
  stat_function(fun = dnorm, 
                args = list(mean = 0, sd = 1), 
                geom = 'area', 
                fill = 'red',
                alpha = 0.3,
                xlim = c(1.645, 3)) +
  stat_function(fun = dnorm, 
                args = list(mean = 0, sd = 1), 
                geom = 'area', 
                fill = 'blue',
                alpha = 0.3,
                xlim = c(-3, 1.645)) +
  annotate('text', x = 0, y = 0.3, size = 8, label = '0.95', 
           color = 'blue') + 
  annotate('text', x = 2.05, y = 0.01, size = 5, 
           label = '0.05', color = 'red') +
  labs(title = 'Normal distribution for one tail test with 95% CL')

samp <- c(170, 167, 174, 179, 179, 156, 163, 156, 187,
          156, 183, 179, 174, 179, 170, 156, 187,
          179, 183, 174, 187, 167, 159, 170, 179)
mu <- 170
gamma <- 10
xbar <- mean(samp)
xbar
z <- z_score(xbar, mu, gamma, length(samp))
z
pnorm(z, 0, 1, lower.tail = FALSE)

# Plot of hypothesis test result--one tailed
data.frame(x = seq(-3, 3, 0.01), 
           prob = dnorm(seq(-3, 3, 0.01), 0, 1)) %>% ggplot(aes(x, prob)) +
  geom_line(size = 1, color = 'blue') +
  scale_x_continuous(breaks = c(-3, -2, -1, 0, 1, 1.26, 1.645, 3)) +
  stat_function(fun = dnorm, 
                args = list(mean = 0, sd = 1), 
                geom = 'area', 
                fill = 'red',
                alpha = 0.3,
                xlim = c(1.645, 3)) +
  stat_function(fun = dnorm, 
                args = list(mean = 0, sd = 1), 
                geom = 'area', 
                fill = 'blue',
                alpha = 0.3,
                xlim = c(-3, 1.645)) +
  annotate('text', x = 0, y = 0.3, size = 8, label = '0.95', 
           color = 'blue') + 
  annotate('text', x = 2.05, y = 0.01, size = 5, 
           label = '0.05', color = 'red') +
  geom_vline(xintercept = 1.26, 
             color = 'blue', 
             size = 1, 
             linetype = 'dashed') +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title = '5% significance level')


# 4.3-3. mu = 25, Null H: mu = 25, Alt H: mu < 25, n = 4, xbar = 22.5
# a.
z <- z_score(22.5, 25, 3, 4)
z
pnorm(z, 0, 1)






