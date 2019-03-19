z_score <- function(xbar, mu, sd, n){
  (xbar - mu) / (sd / sqrt(n))
}

t_stat <- function(xbar, mu, sd, n){
  (xbar - mu) / (sd / sqrt(n))
}

# P value/significance level example--one tailed probability P(z > 2.163)
pnorm(2.163, 0, 1, lower.tail = FALSE)

data.frame(x = seq(-3, 3, 0.01), 
           prob = dnorm(seq(-3, 3, 0.01), 0, 1)) %>% ggplot(aes(x, prob)) +
  geom_line(size = 1, color = 'blue') +
  scale_x_continuous(breaks = c(-3, -2, -1, 0, 1, 2.163, 3)) +
  stat_function(fun = dnorm, 
                args = list(mean = 0, sd = 1), 
                geom = 'area', 
                fill = 'red',
                alpha = 0.3,
                xlim = c(-2.163, -3)) +
  stat_function(fun = dnorm, 
                args = list(mean = 0, sd = 1), 
                geom = 'area', 
                fill = 'blue',
                alpha = 0.3,
                xlim = c(-2.163, 3)) +
  geom_vline(xintercept = -2.163, linetype = 'dashed', size = 1)

# P value/significance level example--two tailed probability P(z < -2.163)
pnorm(-2.163, 0, 1)

data.frame(x = seq(-3, 3, 0.01), 
           prob = dnorm(seq(-3, 3, 0.01), 0, 1)) %>% ggplot(aes(x, prob)) +
  geom_line(size = 1, color = 'blue') +
  scale_x_continuous(breaks = c(-3, -2.163, -1, 0, 1, 2.163, 3)) +
  stat_function(fun = dnorm, 
                args = list(mean = 0, sd = 1), 
                geom = 'area', 
                fill = 'red',
                alpha = 0.3,
                xlim = c(-2.163, -3)) +
  stat_function(fun = dnorm, 
                args = list(mean = 0, sd = 1), 
                geom = 'area', 
                fill = 'blue',
                alpha = 0.3,
                xlim = c(-2.163, 3)) +
  geom_vline(xintercept = -2.163, linetype = 'dashed', size = 1)

# P value/significance level example--two tailed probability P(z = 2.163)
pnorm(2.163, 0, 1, lower.tail = FALSE) * 2

data.frame(x = seq(-3, 3, 0.01), 
           prob = dnorm(seq(-3, 3, 0.01), 0, 1)) %>% ggplot(aes(x, prob)) +
  geom_line(size = 1, color = 'blue') +
  scale_x_continuous(breaks = c(-3, -2.163, -1, 0, 1, 2.163, 3)) +
  stat_function(fun = dnorm, 
                args = list(mean = 0, sd = 1), 
                geom = 'area', 
                fill = 'red',
                alpha = 0.3,
                xlim = c(2.163, 3)) +
  stat_function(fun = dnorm, 
                args = list(mean = 0, sd = 1), 
                geom = 'area', 
                fill = 'blue',
                alpha = 0.3,
                xlim = c(-2.163, 2.163)) +
  stat_function(fun = dnorm, 
                args = list(mean = 0, sd = 1), 
                geom = 'area', 
                fill = 'red',
                alpha = 0.3,
                xlim = c(-3, -2.163)) +
  geom_vline(xintercept = 2.163, linetype = 'dashed', size = 1) +
  geom_vline(xintercept = -2.163, linetype = 'dashed', size = 1)



# Normal distribution for one tail test
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

# Normal distribution for two tail test
data.frame(x = seq(-3, 3, 0.01), 
           prob = dnorm(seq(-3, 3, 0.01), 0, 1)) %>% ggplot(aes(x, prob)) +
  geom_line(size = 1, color = 'blue') +
  scale_x_continuous(breaks = c(-3, -1.96, -1, 0, 1, 1.96, 3)) +
  stat_function(fun = dnorm, 
                args = list(mean = 0, sd = 1), 
                geom = 'area', 
                fill = 'red',
                alpha = 0.3,
                xlim = c(1.96, 3)) +
  stat_function(fun = dnorm, 
                args = list(mean = 0, sd = 1), 
                geom = 'area', 
                fill = 'red',
                alpha = 0.3,
                xlim = c(-1.96, -3)) +
  stat_function(fun = dnorm, 
                args = list(mean = 0, sd = 1), 
                geom = 'area', 
                fill = 'blue',
                alpha = 0.3,
                xlim = c(-1.96, 1.96)) +
  annotate('text', x = 0, y = 0.3, size = 8, label = '0.95', 
           color = 'blue') + 
  annotate('text', x = 2.25, y = 0.01, size = 4, 
           label = '0.025', color = 'red') +
  annotate('text', x = -2.25, y = 0.01, size = 4, 
           label = '0.025', color = 'red') +
  labs(title = 'Normal distribution for two tail test with 95% CL')

# 4.23 from OpenIntro
z_score(134, 130, 17, 35)
qnorm(c(0.025, 0.975))
pnorm(1.392, 0, 1, lower.tail = FALSE)

# Plot of hypothesis test result--two tailed
data.frame(x = seq(-3, 3, 0.01), 
           prob = dnorm(seq(-3, 3, 0.01), 0, 1)) %>% ggplot(aes(x, prob)) +
  geom_line(size = 1, color = 'blue') +
  scale_x_continuous(breaks = c(-3, -1.96, -1, 0, 1, 1.392, 1.96, 3)) +
  stat_function(fun = dnorm, 
                args = list(mean = 0, sd = 1), 
                geom = 'area', 
                fill = 'red',
                alpha = 0.3,
                xlim = c(1.96, 3)) +
  stat_function(fun = dnorm, 
                args = list(mean = 0, sd = 1), 
                geom = 'area', 
                fill = 'red',
                alpha = 0.3,
                xlim = c(-1.96, -3)) +
  stat_function(fun = dnorm, 
                args = list(mean = 0, sd = 1), 
                geom = 'area', 
                fill = 'blue',
                alpha = 0.3,
                xlim = c(-1.96, 1.96)) +
  geom_vline(xintercept = 1.392, color = 'blue', size = 1, linetype = 'dashed') +
  annotate('text', x = 0, y = 0.3, size = 8, label = '0.95', 
           color = 'blue') + 
  annotate('text', x = 2.25, y = 0.01, size = 4, 
           label = '0.025', color = 'red') +
  annotate('text', x = -2.25, y = 0.01, size = 4, 
           label = '0.025', color = 'red') +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title = '5% significance level')

# Plot of hypothesis test result--one tailed
data.frame(x = seq(-3, 3, 0.01), 
           prob = dnorm(seq(-3, 3, 0.01), 0, 1)) %>% ggplot(aes(x, prob)) +
  geom_line(size = 1, color = 'blue') +
  scale_x_continuous(breaks = c(-3, -2, -1, 0, 1, 1.392, 1.645, 3)) +
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
  geom_vline(xintercept = 1.392, 
             color = 'blue', 
             size = 1, 
             linetype = 'dashed') +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title = '5% significance level')

# 4.25 from OpenIntro
z_score(137.5, 127, 39, 64)
qnorm(0.95)
pnorm(2.154, 0, 1, lower.tail = FALSE)

# Plot of hypothesis test result--one tail--5% significance level
data.frame(x = seq(-3, 3, 0.01), 
           prob = dnorm(seq(-3, 3, 0.01), 0, 1)) %>% ggplot(aes(x, prob)) +
  geom_line(size = 1, color = 'blue') +
  scale_x_continuous(breaks = c(-3, -2, -1, 0, 1, 1.645, 2.154, 3)) +
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
  geom_vline(xintercept = 2.154, 
             color = 'red', 
             size = 1, 
             linetype = 'dashed') +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title = '5% significance level')

# Plot of hypothesis test result--one tail--1% significance
z_score(137.5, 127, 39, 64)
qnorm(0.99)
pnorm(2.154, 0, 1, lower.tail = FALSE)

data.frame(x = seq(-3, 3, 0.01), 
           prob = dnorm(seq(-3, 3, 0.01), 0, 1)) %>% ggplot(aes(x, prob)) +
  geom_line(size = 1, color = 'blue') +
  scale_x_continuous(breaks = c(-3, -2, -1, 0, 1, 1.645, 2.154, 2.326, 3)) +
  stat_function(fun = dnorm, 
                args = list(mean = 0, sd = 1), 
                geom = 'area', 
                fill = 'red',
                alpha = 0.3,
                xlim = c(2.326, 3)) +
  stat_function(fun = dnorm, 
                args = list(mean = 0, sd = 1), 
                geom = 'area', 
                fill = 'blue',
                alpha = 0.3,
                xlim = c(-3, 2.326)) +
  annotate('text', x = 0, y = 0.3, size = 8, label = '0.99', 
           color = 'blue') + 
  geom_vline(xintercept = 2.154, 
             color = 'blue', 
             size = 1, 
             linetype = 'dashed') +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  labs(title = '1% significance level')

# Plot of hypothesis test result--two tailed
data.frame(x = seq(-3, 3, 0.01), 
           prob = dnorm(seq(-3, 3, 0.01), 0, 1)) %>% ggplot(aes(x, prob)) +
  geom_line(size = 1, color = 'blue') +
  scale_x_continuous(breaks = c(-3, -1.96, -1, 0, 1, 1.96, 3)) +
  stat_function(fun = dnorm, 
                args = list(mean = 0, sd = 1), 
                geom = 'area', 
                fill = 'red',
                alpha = 0.3,
                xlim = c(1.96, 3)) +
  stat_function(fun = dnorm, 
                args = list(mean = 0, sd = 1), 
                geom = 'area', 
                fill = 'red',
                alpha = 0.3,
                xlim = c(-1.96, -3)) +
  stat_function(fun = dnorm, 
                args = list(mean = 0, sd = 1), 
                geom = 'area', 
                fill = 'blue',
                alpha = 0.3,
                xlim = c(-1.96, 1.96)) +
  geom_vline(xintercept = 2.154, color = 'red', size = 1, linetype = 'dashed') +
  annotate('text', x = 0, y = 0.3, size = 8, label = '0.95', 
           color = 'blue') + 
  annotate('text', x = 2.25, y = 0.01, size = 4, 
           label = '0.025', color = 'red') +
  annotate('text', x = -2.25, y = 0.01, size = 4, 
           label = '0.025', color = 'red') +
  labs(title = '5% significance level')

# 4.2-11.
wire_pull <- c(28.8, 24.4, 30.1, 25.6, 26.4,
               23.9, 22.1, 22.5, 27.6, 28.1,
               20.8, 27.7, 24.4, 25.1, 24.6,
               26.3, 28.2, 22.2, 26.3, 24.4)

t <- t_stat(mean(wire_pull), 
                  25, 
                  sd(wire_pull), 
                  length(wire_pull))

pt(t, length(wire_pull) - 1, lower.tail = FALSE) * 2

# Plot of hypothesis test result--two tailed 99% CL
data.frame(x = seq(-3, 3, 0.01), 
           prob = dt(seq(-3, 3, 0.01), length(wire_pull) - 1)) %>% ggplot(aes(x, prob)) +
  geom_line(size = 1, color = 'blue') +
  scale_x_continuous(breaks = c(-2.861, -1, 0, 0.852, 2.861)) +
  stat_function(fun = dt, 
                args = list(df = 19), 
                geom = 'area', 
                fill = 'red',
                alpha = 0.3,
                xlim = c(2.861, 3)) +
  stat_function(fun = dt, 
                args = list(df = 19), 
                geom = 'area', 
                fill = 'red',
                alpha = 0.3,
                xlim = c(-2.861, -3)) +
  stat_function(fun = dt, 
                args = list(df = 19), 
                geom = 'area', 
                fill = 'blue',
                alpha = 0.3,
                xlim = c(-2.861, 2.861)) +
  geom_vline(xintercept = 0.852, 
             color = 'blue', 
             size = 1, 
             linetype = 'dashed') +
  labs(x = '') +
  ds_theme_set()

# Plot of hypothesis test result--two tailed 99% CL
data.frame(x = seq(-3, 3, 0.01), 
           prob = dt(seq(-3, 3, 0.01), length(wire_pull) - 1)) %>% ggplot(aes(x, prob)) +
  geom_line(size = 1, color = 'blue') +
  scale_x_continuous(breaks = c(-2.861, -1, 0, 0.852, 2.861)) +
  stat_function(fun = dt, 
                args = list(df = 19), 
                geom = 'area', 
                fill = 'red',
                alpha = 0.3,
                xlim = c(2.861, 3)) +
  stat_function(fun = dt, 
                args = list(df = 19), 
                geom = 'area', 
                fill = 'red',
                alpha = 0.3,
                xlim = c(-2.861, -3)) +
  stat_function(fun = dt, 
                args = list(df = 19), 
                geom = 'area', 
                fill = 'blue',
                alpha = 0.3,
                xlim = c(-2.861, 2.861)) +
  geom_vline(xintercept = 0.852, 
             color = 'blue', 
             size = 1, 
             linetype = 'dashed') +
  labs(x = '') +
  ds_theme_set()

# Plot of hypothesis test result--two tailed 95% CL
data.frame(x = seq(-3, 3, 0.01), 
           prob = dt(seq(-3, 3, 0.01), length(wire_pull) - 1)) %>% ggplot(aes(x, prob)) +
  geom_line(size = 1, color = 'blue') +
  scale_x_continuous(breaks = c(-2.735, -2.093, -1, 0, 1, 2.093)) +
  stat_function(fun = dt, 
                args = list(df = 19), 
                geom = 'area', 
                fill = 'red',
                alpha = 0.3,
                xlim = c(2.093, 3)) +
  stat_function(fun = dt, 
                args = list(df = 19), 
                geom = 'area', 
                fill = 'red',
                alpha = 0.3,
                xlim = c(-2.093, -3)) +
  stat_function(fun = dt, 
                args = list(df = 19), 
                geom = 'area', 
                fill = 'blue',
                alpha = 0.3,
                xlim = c(-2.093, 2.093)) +
  geom_vline(xintercept = -2.735, 
             color = 'red', 
             size = 1, 
             linetype = 'dashed') +
  labs(x = '') +
  ds_theme_set()




